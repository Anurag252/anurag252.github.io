---
title: "3461 Find The Minimum Area To Cover All Ones I"
date: "2025-08-22T07:49:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Find the Minimum Area to Cover All Ones I](https://leetcode.com/problems/find-the-minimum-area-to-cover-all-ones-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a 2D **binary** array grid. Find a rectangle with horizontal and vertical sides with the** smallest** area, such that all the 1's in grid lie inside this rectangle.

Return the **minimum** possible area of the rectangle.

 

Example 1:

**Input:** grid = [[0,1,0],[1,0,1]]

**Output:** 6

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/05/08/examplerect0.png)

The smallest rectangle has a height of 2 and a width of 3, so it has an area of 2 * 3 = 6.

Example 2:

**Input:** grid = [[1,0],[0,0]]

**Output:** 1

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/05/08/examplerect1.png)

The smallest rectangle has both height and width 1, so its area is 1 * 1 = 1.

 

**Constraints:**

	1 <= grid.length, grid[i].length <= 1000
	grid[i][j] is either 0 or 1.
	The input is generated such that there is at least one 1 in grid.

                            {% raw %}
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

        
                            {% endraw %}
                            