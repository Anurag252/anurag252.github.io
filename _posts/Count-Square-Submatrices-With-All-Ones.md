---
title: "Count Square Submatrices With All Ones"
date: "2025-08-20T11:04:43+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 54 ms (77.88%) | Memory: 20.1 MB (90.78%) - LeetSync"
---

```python
from typing import List

class Solution:
    def countSquares(self, matrix: List[List[int]]) -> int:
        if not matrix or not matrix[0]:
            return 0
        m, n = len(matrix), len(matrix[0])
        total = 0

        # matrix[i][j] becomes the size of the largest all-ones square
        # with TOP-LEFT corner at (i, j)
        for i in range(m - 1, -1, -1):
            for j in range(n - 1, -1, -1):
                if matrix[i][j] == 1:
                    if i < m - 1 and j < n - 1:
                        matrix[i][j] = 1 + min(
                            matrix[i + 1][j],      # down
                            matrix[i][j + 1],      # right
                            matrix[i + 1][j + 1],  # down-right
                        )
                    else:
                        matrix[i][j] = 1  # edge cells
                    total += matrix[i][j]
                # if it's 0, leave as 0 and add nothing
        return total

```