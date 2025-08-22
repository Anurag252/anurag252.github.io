---
title: "Find The Minimum Area To Cover All Ones I"
date: "2025-08-22T07:49:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3007 ms (20.87%) | Memory: 48 MB (17.27%) - LeetSync"
---

```python
class Solution:
    def minimumArea(self, grid: List[List[int]]) -> int:
        """
        traverse rows and find first row with 1 and last row with 1
        and same with col
        multiply

        """
        first_row = 10000
        last_row = 0
        first_col = 10000
        last_col = 0

        for i,k in enumerate(grid):
            #print(k)
            for j,l in enumerate(k):
                if l == 1:
                    first_row = min(first_row, i)
                    last_row = max(last_row, i)
                    first_col = min(first_col, j)
                    last_col = max(last_col, j)
        
        return (last_row- first_row + 1) * (last_col - first_col + 1)

        
```