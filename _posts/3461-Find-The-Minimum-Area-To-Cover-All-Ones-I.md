---
title: "./3461 Find The Minimum Area To Cover All Ones I"
date: "2025-08-22T07:49:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-the-minimum-area-to-cover-all-ones-i">Find the Minimum Area to Cover All Ones I</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a 2D <strong>binary</strong> array <code>grid</code>. Find a rectangle with horizontal and vertical sides with the<strong> smallest</strong> area, such that all the 1&#39;s in <code>grid</code> lie inside this rectangle.</p>

<p>Return the <strong>minimum</strong> possible area of the rectangle.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">grid = [[0,1,0],[1,0,1]]</span></p>

<p><strong>Output:</strong> <span class="example-io">6</span></p>

<p><strong>Explanation:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2024/05/08/examplerect0.png" style="padding: 10px; background: rgb(255, 255, 255); border-radius: 0.5rem; width: 279px; height: 198px;" /></p>

<p>The smallest rectangle has a height of 2 and a width of 3, so it has an area of <code>2 * 3 = 6</code>.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">grid = [[1,0],[0,0]]</span></p>

<p><strong>Output:</strong> <span class="example-io">1</span></p>

<p><strong>Explanation:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2024/05/08/examplerect1.png" style="padding: 10px; background: rgb(255, 255, 255); border-radius: 0.5rem; width: 204px; height: 201px;" /></p>

<p>The smallest rectangle has both height and width 1, so its area is <code>1 * 1 = 1</code>.</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= grid.length, grid[i].length &lt;= 1000</code></li>
	<li><code>grid[i][j]</code> is either 0 or 1.</li>
	<li>The input is generated such that there is at least one 1 in <code>grid</code>.</li>
</ul>"
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