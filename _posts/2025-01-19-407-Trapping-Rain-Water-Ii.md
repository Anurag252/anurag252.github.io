---
            title: "407 Trapping Rain Water Ii"
            date: "2025-01-19T09:10:17+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Trapping Rain Water II](https://leetcode.com/problems/trapping-rain-water-ii) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given an m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map, return *the volume of water it can trap after raining*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/04/08/trap1-3d.jpg)
```

**Input:** heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]
**Output:** 4
**Explanation:** After the rain, water is trapped between the blocks.
We have two small ponds 1 and 3 units trapped.
The total volume of water trapped is 4.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/04/08/trap2-3d.jpg)
```

**Input:** heightMap = [[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]]
**Output:** 10

```

 

**Constraints:**

	m == heightMap.length
	n == heightMap[i].length
	1 <= m, n <= 200
	0 <= heightMap[i][j] <= 2 * 104

{% raw %}


```go


type Cell struct {
	height int
	row    int
	col    int
}

type MinHeap []Cell

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i].height < h[j].height }
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
	*h = append(*h, x.(Cell))
}

func (h *MinHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[:n-1]
	return x
}

func isValidCell(row, col, rows, cols int) bool {
	return row >= 0 && row < rows && col >= 0 && col < cols
}

func trapRainWater(heightMap [][]int) int {
	if len(heightMap) == 0 || len(heightMap[0]) == 0 {
		return 0
	}

	rows := len(heightMap)
	cols := len(heightMap[0])

	// Direction arrays for exploring neighbors
	dRow := []int{0, 0, -1, 1}
	dCol := []int{-1, 1, 0, 0}

	// Min-heap to store boundary cells
	minHeap := &MinHeap{}
	heap.Init(minHeap)

	// Visited matrix to track processed cells
	visited := make([][]bool, rows)
	for i := range visited {
		visited[i] = make([]bool, cols)
	}

	// Add the boundary cells to the heap and mark them as visited
	for i := 0; i < rows; i++ {
		heap.Push(minHeap, Cell{heightMap[i][0], i, 0})
		heap.Push(minHeap, Cell{heightMap[i][cols-1], i, cols - 1})
		visited[i][0] = true
		visited[i][cols-1] = true
	}
	for j := 0; j < cols; j++ {
		heap.Push(minHeap, Cell{heightMap[0][j], 0, j})
		heap.Push(minHeap, Cell{heightMap[rows-1][j], rows - 1, j})
		visited[0][j] = true
		visited[rows-1][j] = true
	}

	totalWater := 0

	// Process cells in the priority queue (min-heap)
	for minHeap.Len() > 0 {
		// Pop the cell with the smallest height
		current := heap.Pop(minHeap).(Cell)

		// Explore all 4 neighbors
		for d := 0; d < 4; d++ {
			nRow := current.row + dRow[d]
			nCol := current.col + dCol[d]

			// Check if the neighbor is valid and not yet visited
			if isValidCell(nRow, nCol, rows, cols) && !visited[nRow][nCol] {
				visited[nRow][nCol] = true

				// Calculate water trapped at the neighbor
				if heightMap[nRow][nCol] < current.height {
					totalWater += current.height - heightMap[nRow][nCol]
				}

				// Push the neighbor into the heap with the updated height
				heap.Push(minHeap, Cell{
					height: int(math.Max(float64(heightMap[nRow][nCol]), float64(current.height))),
					row:    nRow,
					col:    nCol,
				})
			}
		}
	}

	return totalWater
}


{% endraw %}
```
