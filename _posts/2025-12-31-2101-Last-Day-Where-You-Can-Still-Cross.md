---
            title: "2101 Last Day Where You Can Still Cross"
            date: "2025-12-31T20:12:33+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Last Day Where You Can Still Cross](https://leetcode.com/problems/last-day-where-you-can-still-cross) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

There is a **1-based** binary matrix where 0 represents land and 1 represents water. You are given integers row and col representing the number of rows and columns in the matrix, respectively.

Initially on day 0, the **entire** matrix is **land**. However, each day a new cell becomes flooded with **water**. You are given a **1-based** 2D array cells, where cells[i] = [ri, ci] represents that on the ith day, the cell on the rith row and cith column (**1-based** coordinates) will be covered with **water** (i.e., changed to 1).

You want to find the **last** day that it is possible to walk from the **top** to the **bottom** by only walking on land cells. You can start from **any** cell in the top row and end at **any** cell in the bottom row. You can only travel in the** four** cardinal directions (left, right, up, and down).

Return *the **last** day where it is possible to walk from the **top** to the **bottom** by only walking on land cells*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/07/27/1.png)
```

**Input:** row = 2, col = 2, cells = [[1,1],[2,1],[1,2],[2,2]]
**Output:** 2
**Explanation:** The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 2.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/07/27/2.png)
```

**Input:** row = 2, col = 2, cells = [[1,1],[1,2],[2,1],[2,2]]
**Output:** 1
**Explanation:** The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 1.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/07/27/3.png)
```

**Input:** row = 3, col = 3, cells = [[1,2],[2,1],[3,3],[2,2],[1,1],[1,3],[2,3],[3,2],[3,1]]
**Output:** 3
**Explanation:** The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 3.

```

 

**Constraints:**

	2 <= row, col <= 2 * 104
	4 <= row * col <= 2 * 104
	cells.length == row * col
	1 <= ri <= row
	1 <= ci <= col
	All the values of cells are **unique**.

{% raw %}


```python


class Solution:
    def latestDayToCross(self, row: int, col: int, cells: list[list[int]]) -> int:
        dsu = DSU(row * col + 2)
        grid = [[0] * col for _ in range(row)]
        dirs = ((0,1),(0,-1),(1,0),(-1,0))

        for i in range(len(cells) - 1, -1, -1):
            r = cells[i][0] - 1
            c = cells[i][1] - 1
            grid[r][c] = 1

            id1 = r * col + c + 1
            for dr, dc in dirs:
                nr = r + dr
                nc = c + dc
                if 0 <= nr < row and 0 <= nc < col and grid[nr][nc] == 1:
                    id2 = nr * col + nc + 1
                    dsu.union(id1, id2)

            if r == 0:
                dsu.union(0, id1)
            if r == row - 1:
                dsu.union(row * col + 1, id1)
            if dsu.find(0) == dsu.find(row * col + 1):
                return i
        return -1

class DSU:
    def __init__(self, n):
        self.root = list(range(n))
        self.size = [1] * n

    def find(self, x):
        if self.root[x] != x:
            self.root[x] = self.find(self.root[x])
        return self.root[x]

    def union(self, x, y):
        rx = self.find(x)
        ry = self.find(y)
        if rx == ry:
            return
        if self.size[rx] > self.size[ry]:
            rx, ry = ry, rx
        self.root[rx] = ry
        self.size[ry] += self.size[rx]



{% endraw %}
```
