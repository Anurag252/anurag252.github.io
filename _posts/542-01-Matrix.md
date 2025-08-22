---
title: "542 01 Matrix"
date: "2025-01-22T08:55:08+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: |
  ## [01 Matrix](https://leetcode.com/problems/01-matrix) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given an m x n binary matrix mat, return *the distance of the nearest *0* for each cell*.
  
  The distance between two cells sharing a common edge is 1.
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2021/04/24/01-1-grid.jpg)
  ```
  
  **Input:** mat = [[0,0,0],[0,1,0],[0,0,0]]
  **Output:** [[0,0,0],[0,1,0],[0,0,0]]
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2021/04/24/01-2-grid.jpg)
  ```
  
  **Input:** mat = [[0,0,0],[0,1,0],[1,1,1]]
  **Output:** [[0,0,0],[0,1,0],[1,2,1]]
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	m == mat.length
  	n == mat[i].length
  	1 &lt;= m, n &lt;= 104
  	1 &lt;= m * n &lt;= 104
  	mat[i][j] is either 0 or 1.
  	There is at least one 0 in mat.
  
  &nbsp;
  
  **Note:** This question is the same as 1765: [https://leetcode.com/problems/map-of-highest-peak/](https://leetcode.com/problems/map-of-highest-peak/description/)
---

```go
func updateMatrix(isWater [][]int) [][]int {
    m, n := len(isWater), len(isWater[0])
    res := make([][]int, m)
    queue := [][]int{}

    for i := 0; i < m; i++ {
        res[i] = make([]int, n)
        for j := 0; j < n; j++ {
            if isWater[i][j] == 0 {
                res[i][j] = 0
                queue = append(queue, []int{i, j})
            } else {
                res[i][j] = -1
            }
        }
    }

    dirs := [][]int{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}

    for len(queue) > 0 {
        cell := queue[0]
        queue = queue[1:]
        i, j := cell[0], cell[1]

        for _, d := range dirs {
            ni, nj := i + d[0], j + d[1]
            if ni >= 0 && ni < m && nj >= 0 && nj < n && res[ni][nj] == -1 {
                res[ni][nj] = res[i][j] + 1
                queue = append(queue, []int{ni, nj})
            }
        }
    }

    return res
}
```