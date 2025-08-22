---
title: "2343 Count Unguarded Cells In The Grid"
date: "2024-11-21T12:17:39+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Count Unguarded Cells in the Grid](https://leetcode.com/problems/count-unguarded-cells-in-the-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given two integers m and n representing a **0-indexed** m x n grid. You are also given two 2D integer arrays guards and walls where guards[i] = [rowi, coli] and walls[j] = [rowj, colj] represent the positions of the ith guard and jth wall respectively.
  
  A guard can see **every** cell in the four cardinal directions (north, east, south, or west) starting from their position unless **obstructed** by a wall or another guard. A cell is **guarded** if there is **at least** one guard that can see it.
  
  Return* the number of unoccupied cells that are **not** **guarded**.*
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2022/03/10/example1drawio2.png)
  ```
  
  **Input:** m = 4, n = 6, guards = [[0,0],[1,1],[2,3]], walls = [[0,1],[2,2],[1,4]]
  **Output:** 7
  **Explanation:** The guarded and unguarded cells are shown in red and green respectively in the above diagram.
  There are a total of 7 unguarded cells, so we return 7.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2022/03/10/example2drawio.png)
  ```
  
  **Input:** m = 3, n = 3, guards = [[1,1]], walls = [[0,1],[1,0],[2,1],[1,2]]
  **Output:** 4
  **Explanation:** The unguarded cells are shown in green in the above diagram.
  There are a total of 4 unguarded cells, so we return 4.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= m, n &lt;= 105
  	2 &lt;= m * n &lt;= 105
  	1 &lt;= guards.length, walls.length &lt;= 5 * 104
  	2 &lt;= guards.length + walls.length &lt;= m * n
  	guards[i].length == walls[j].length == 2
  	0 &lt;= rowi, rowj &lt; m
  	0 &lt;= coli, colj &lt; n
  	All the positions in guards and walls are **unique**.
---

```python
class Solution:
    def countUnguarded(self, m: int, n: int, guards: List[List[int]], walls: List[List[int]]) -> int:
        grid = [[0] * n for _ in range(m)]
        
        # Mark guards and walls
        for r, c in guards:
            grid[r][c] = 1  # Guard
        for r, c in walls:
            grid[r][c] = 2  # Wall
        
        # Directions for guard coverage: up, down, left, right
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        # Expand guard coverage
        for r, c in guards:
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                while 0 <= nr < m and 0 <= nc < n and grid[nr][nc] != 2 and grid[nr][nc] != 1:
                    grid[nr][nc] = 3  # Guarded
                    nr, nc = nr + dr, nc + dc
        
        # Count unguarded cells
        return sum(cell == 0 for row in grid for cell in row)

```