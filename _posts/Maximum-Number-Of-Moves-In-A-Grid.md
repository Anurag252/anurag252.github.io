---
title: "Maximum Number Of Moves In A Grid"
date: "2024-10-29T09:42:00+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 135 ms (60.61%) | Memory: 43.1 MB (5.30%) - LeetSync"
---

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