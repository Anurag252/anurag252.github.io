---
title: "2375 Minimum Obstacle Removal To Reach Corner"
date: "2024-11-28T09:32:13+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Minimum Obstacle Removal to Reach Corner](https://leetcode.com/problems/minimum-obstacle-removal-to-reach-corner) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  You are given a **0-indexed** 2D integer array grid of size m x n. Each cell has one of two values:
  
  	0 represents an **empty** cell,
  	1 represents an **obstacle** that may be removed.
  
  You can move up, down, left, or right from and to an empty cell.
  
  Return *the **minimum** number of **obstacles** to **remove** so you can move from the upper left corner *(0, 0)* to the lower right corner *(m - 1, n - 1).
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2022/04/06/example1drawio-1.png)
  ```
  
  **Input:** grid = [[0,1,1],[1,1,0],[1,1,0]]
  **Output:** 2
  **Explanation:** We can remove the obstacles at (0, 1) and (0, 2) to create a path from (0, 0) to (2, 2).
  It can be shown that we need to remove at least 2 obstacles, so we return 2.
  Note that there may be other ways to remove 2 obstacles to create a path.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2022/04/06/example1drawio.png)
  ```
  
  **Input:** grid = [[0,1,0,0,0],[0,1,0,1,0],[0,0,0,1,0]]
  **Output:** 0
  **Explanation:** We can move from (0, 0) to (2, 4) without removing any obstacles, so we return 0.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	m == grid.length
  	n == grid[i].length
  	1 &lt;= m, n &lt;= 105
  	2 &lt;= m * n &lt;= 105
  	grid[i][j] is either 0 **or** 1.
  	grid[0][0] == grid[m - 1][n - 1] == 0
---

```python
from heapq import heappush, heappop
from typing import List

class Solution:
    def minimumObstacles(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        costs = [[float('inf')] * cols for _ in range(rows)]
        pq = [(0, 0, 0)]  # (cost, x, y)

        while pq:
            cost, x, y = heappop(pq)

            # If already visited with a cheaper cost, skip
            if costs[x][y] <= cost:
                continue
            costs[x][y] = cost

            # If we reach the target, return the cost
            if x == rows - 1 and y == cols - 1:
                return cost

            # Explore neighbors
            for dx, dy in directions:
                nx, ny = x + dx, y + dy
                if 0 <= nx < rows and 0 <= ny < cols:
                    heappush(pq, (cost + grid[nx][ny], nx, ny))

        # If the target is unreachable (edge case)
        return -1

```