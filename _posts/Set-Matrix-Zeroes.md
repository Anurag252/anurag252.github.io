---
title: "Set Matrix Zeroes"
date: "2025-05-21T09:01:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 11 ms (7.82%) | Memory: 18.6 MB (17.00%) - LeetSync"
---

```python
class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """


        def changer(i , j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return 
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changer(i - 1, j , matrix, t)



        def changef(i , j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return 
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changef(i + 1, j , matrix, t)

        def changecolr(i,  j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changecolr(i , j - 1 , matrix, t)
        
        def changecolf(i,  j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changecolf(i , j + 1 , matrix, t)

        
        for i, k in enumerate(matrix):
            for j, l in enumerate(matrix[i]):
                if l == 0:
                    changer(i , j , matrix, "s")
                    changef(i , j , matrix, "s")
                    changecolr(i , j , matrix, "s")
                    changecolf(i , j , matrix, "s")
                    

        for i, k in enumerate(matrix):
            for j, l in enumerate(matrix[i]):
                if l == "s":
                    matrix[i][j] = 0
                    


            

        

        
```