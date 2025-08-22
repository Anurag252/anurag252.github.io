---
            title: "2588 Maximum Number Of Points From Grid Queries"
            date: "2025-03-29T07:59:38+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Number of Points From Grid Queries](https://leetcode.com/problems/maximum-number-of-points-from-grid-queries) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given an m x n integer matrix grid and an array queries of size k.

Find an array answer of size k such that for each integer queries[i] you start in the **top left** cell of the matrix and repeat the following process:

	If queries[i] is **strictly** greater than the value of the current cell that you are in, then you get one point if it is your first time visiting this cell, and you can move to any **adjacent** cell in all 4 directions: up, down, left, and right.
	Otherwise, you do not get any points, and you end this process.

After the process, answer[i] is the **maximum** number of points you can get. **Note** that for each query you are allowed to visit the same cell **multiple** times.

Return *the resulting array* answer.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2025/03/15/image1.png)
```

**Input:** grid = [[1,2,3],[2,5,7],[3,5,1]], queries = [5,6,2]
**Output:** [5,8,1]
**Explanation:** The diagrams above show which cells we visit to get points for each query.
```

Example 2:

![image](https://assets.leetcode.com/uploads/2022/10/20/yetgriddrawio-2.png)
```

**Input:** grid = [[5,2,1],[1,1,2]], queries = [3]
**Output:** [0]
**Explanation:** We can not get any points because the value of the top left cell is already greater than or equal to 3.

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	2 <= m, n <= 1000
	4 <= m * n <= 105
	k == queries.length
	1 <= k <= 104
	1 <= grid[i][j], queries[i] <= 106

{% raw %}


```python


from queue import PriorityQueue


class Solution:
    def maxPoints(self, grid: List[List[int]], queries: List[int]) -> List[int]:
        row_count, col_count = len(grid), len(grid[0])
        result = [0] * len(queries)
        # Directions for movement (right, down, left, up)
        DIRECTIONS = [(0, 1), (1, 0), (0, -1), (-1, 0)]

        # Store queries along with their original indices to restore order
        # later
        sorted_queries = sorted([(val, idx) for idx, val in enumerate(queries)])

        # Min-heap (priority queue) to process cells in increasing order of
        # value
        min_heap = PriorityQueue()
        visited = [[False] * col_count for _ in range(row_count)]
        # Keeps track of the number of cells processed
        total_points = 0
        # Start from the top-left cell
        min_heap.put((grid[0][0], 0, 0))
        visited[0][0] = True

        # Process queries in sorted order
        for query_value, query_index in sorted_queries:
            # Expand the cells that are smaller than the current query value
            while not min_heap.empty() and min_heap.queue[0][0] < query_value:
                cellValue, current_row, current_col = min_heap.get()

                # Increment count of valid cells
                total_points += 1

                # Explore all four possible directions
                for row_offset, col_offset in DIRECTIONS:
                    new_row, new_col = (
                        current_row + row_offset,
                        current_col + col_offset,
                    )

                    # Check if the new cell is within bounds and not visited
                    if (
                        new_row >= 0
                        and new_col >= 0
                        and new_row < row_count
                        and new_col < col_count
                        and not visited[new_row][new_col]
                    ):
                        min_heap.put((grid[new_row][new_col], new_row, new_col))
                        # Mark as visited
                        visited[new_row][new_col] = True
            # Store the result for this query
            result[query_index] = total_points

        return result


{% endraw %}
