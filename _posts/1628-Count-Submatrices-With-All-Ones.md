---
title: "1628 Count Submatrices With All Ones"
date: "2025-08-21T11:23:53+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Count Submatrices With All Ones](https://leetcode.com/problems/count-submatrices-with-all-ones) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given an m x n binary matrix mat, *return the number of **submatrices** that have all ones*.
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2021/10/27/ones1-grid.jpg)
  ```
  
  **Input:** mat = [[1,0,1],[1,1,0],[1,1,0]]
  **Output:** 13
  **Explanation:** 
  There are 6 rectangles of side 1x1.
  There are 2 rectangles of side 1x2.
  There are 3 rectangles of side 2x1.
  There is 1 rectangle of side 2x2. 
  There is 1 rectangle of side 3x1.
  Total number of rectangles = 6 + 2 + 3 + 1 + 1 = 13.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2021/10/27/ones2-grid.jpg)
  ```
  
  **Input:** mat = [[0,1,1,0],[0,1,1,1],[1,1,1,0]]
  **Output:** 24
  **Explanation:** 
  There are 8 rectangles of side 1x1.
  There are 5 rectangles of side 1x2.
  There are 2 rectangles of side 1x3. 
  There are 4 rectangles of side 2x1.
  There are 2 rectangles of side 2x2. 
  There are 2 rectangles of side 3x1. 
  There is 1 rectangle of side 3x2. 
  Total number of rectangles = 8 + 5 + 2 + 4 + 2 + 2 + 1 = 24.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= m, n &lt;= 150
  	mat[i][j] is either 0 or 1.
---

```python
class Solution:
    def numSubmat(self, mat: List[List[int]]) -> int:
        """
            a rectangle is x + 1, y or y + 1, x
            if 1,1 is present then we move x +1 or y + 1
            if true then we move x + 1, y + 1
            at any point we have 3 possibilities of rectangles
            row | col or row,col
            so at any point 
            T[i,j] = 1 + T[i + 1, j] -> this is row based rectangle
            S[i,j] = 1 + S[i, j+ 1] -> this is col based
            say we have a r row and c col
            then number of rectangles starting at i,j is row * col
            as size 1*1, then 1*2 ..1*n ( of row len 1)
            then size 2*1, 2*2 .... 2*n (of row length 2)
            ignore below ---->

            Q[i,j] = 1 +  max(Q[i+1,j], min(S[i+1,j], S[i,j])) -> this is both row and col based

            what if the reactangle is 2*n
            2*2 we can could as a reactangle 
            we cannot count normally 2*n , 
            what if Q is not needed,
            We just have a 1*2 and 2*1 and next cell is 2*1



        """
        rows = [row[:] for row in mat]
        cols = [row[:] for row in mat]




        for r in range(len(rows)-1, -1, -1):
            for c in range(len(rows[0])-1, -1, -1):
                if r + 1 < len(rows) and mat[r][c] == 1:
                    rows[r][c] = rows[r+1][c] + 1
                if c + 1 < len(rows[0]) and mat[r][c] == 1:
                    cols[r][c] = cols[r][c+1] + 1

        R, C = len(mat), len(mat[0])
        res = 0
        # count submatrices
        for r in range(R):
            for c in range(C):
                if mat[r][c] == 1:
                    min_width = float("inf")
                    for k in range(rows[r][c]):  # extend downward
                        min_width = min(min_width, cols[r+k][c])
                        res += min_width
        return res

        res = 0
        print(rows, cols)
        for r in range(len(rows)-1, -1, -1):
            for c in range(len(rows[0])-1, -1, -1):
                res += rows[r][c] * cols[r][c]
        return res




        
```