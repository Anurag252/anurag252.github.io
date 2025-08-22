---
title: "./73 Set Matrix Zeroes"
date: "2025-05-21T09:01:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/set-matrix-zeroes">Set Matrix Zeroes</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an <code>m x n</code> integer matrix <code>matrix</code>, if an element is <code>0</code>, set its entire row and column to <code>0</code>&#39;s.</p>

<p>You must do it <a href="https://en.wikipedia.org/wiki/In-place_algorithm" target="_blank">in place</a>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/08/17/mat1.jpg" style="width: 450px; height: 169px;" />
<pre>
<strong>Input:</strong> matrix = [[1,1,1],[1,0,1],[1,1,1]]
<strong>Output:</strong> [[1,0,1],[0,0,0],[1,0,1]]
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/08/17/mat2.jpg" style="width: 450px; height: 137px;" />
<pre>
<strong>Input:</strong> matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
<strong>Output:</strong> [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == matrix.length</code></li>
	<li><code>n == matrix[0].length</code></li>
	<li><code>1 &lt;= m, n &lt;= 200</code></li>
	<li><code>-2<sup>31</sup> &lt;= matrix[i][j] &lt;= 2<sup>31</sup> - 1</code></li>
</ul>

<p>&nbsp;</p>
<p><strong>Follow up:</strong></p>

<ul>
	<li>A straightforward solution using <code>O(mn)</code> space is probably a bad idea.</li>
	<li>A simple improvement uses <code>O(m + n)</code> space, but still not the best solution.</li>
	<li>Could you devise a constant space solution?</li>
</ul>"
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