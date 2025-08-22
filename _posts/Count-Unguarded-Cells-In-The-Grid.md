---
title: "Count Unguarded Cells In The Grid"
date: "2024-11-21T12:17:39+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 408 ms (49.00%) | Memory: 38.1 MB (84.80%) - LeetSync"
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