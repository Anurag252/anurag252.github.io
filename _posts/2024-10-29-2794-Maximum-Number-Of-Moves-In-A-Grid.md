---
title: "2794 Maximum Number Of Moves In A Grid"
date: "2024-10-29T09:42:00+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Maximum Number of Moves in a Grid](https://leetcode.com/problems/maximum-number-of-moves-in-a-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** m x n matrix grid consisting of **positive** integers.

You can start at **any** cell in the first column of the matrix, and traverse the grid in the following way:

	From a cell (row, col), you can move to any of the cells: (row - 1, col + 1), (row, col + 1) and (row + 1, col + 1) such that the value of the cell you move to, should be **strictly** bigger than the value of the current cell.

Return *the **maximum** number of **moves** that you can perform.*

 

Example 1:

![image](https://assets.leetcode.com/uploads/2023/04/11/yetgriddrawio-10.png)
```

**Input:** grid = [[2,4,3,5],[5,4,9,3],[3,4,2,11],[10,9,13,15]]
**Output:** 3
**Explanation:** We can start at the cell (0, 0) and make the following moves:
- (0, 0) -> (0, 1).
- (0, 1) -> (1, 2).
- (1, 2) -> (2, 3).
It can be shown that it is the maximum number of moves that can be made.
```

Example 2:

```

![image](https://assets.leetcode.com/uploads/2023/04/12/yetgrid4drawio.png)
**Input:** grid = [[3,2,4],[2,1,9],[1,1,7]]
**Output:** 0
**Explanation:** Starting from any cell in the first column we cannot perform any moves.

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	2 <= m, n <= 1000
	4 <= m * n <= 105
	1 <= grid[i][j] <= 106

```python
class Solution:
    def maxMoves(self, grid: List[List[int]]) -> int:
        
        row = len(grid)
        col = len(grid[0])
        
        @cache
        def maxmv(i, j):
            if i >= row or j >= col:
                return 0
            a,b,c = 0,0,0
            if i - 1 >= 0 and j + 1 < col and grid[i][j] < grid[i -1][j+1]:
                a = 1 + maxmv(i-1, j+1)

            if j + 1 < col and grid[i][j] < grid[i][j+1]:
                b = 1 + maxmv(i, j+1)

            if i+1 < row and j +1 < col and grid[i][j] < grid[i +1][j+1]:
                c = 1 + maxmv(i+1, j+1)


            return max(a,b,c)
        res = 0
        for k in range(row):
            res = max(res, maxmv(k,0))
        return res
```