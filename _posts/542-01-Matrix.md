---
title: "./542 01 Matrix"
date: "2025-01-22T08:55:08+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/01-matrix">01 Matrix</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an <code>m x n</code> binary matrix <code>mat</code>, return <em>the distance of the nearest </em><code>0</code><em> for each cell</em>.</p>

<p>The distance between two cells sharing a common edge is <code>1</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/04/24/01-1-grid.jpg" style="width: 253px; height: 253px;" />
<pre>
<strong>Input:</strong> mat = [[0,0,0],[0,1,0],[0,0,0]]
<strong>Output:</strong> [[0,0,0],[0,1,0],[0,0,0]]
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/04/24/01-2-grid.jpg" style="width: 253px; height: 253px;" />
<pre>
<strong>Input:</strong> mat = [[0,0,0],[0,1,0],[1,1,1]]
<strong>Output:</strong> [[0,0,0],[0,1,0],[1,2,1]]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == mat.length</code></li>
	<li><code>n == mat[i].length</code></li>
	<li><code>1 &lt;= m, n &lt;= 10<sup>4</sup></code></li>
	<li><code>1 &lt;= m * n &lt;= 10<sup>4</sup></code></li>
	<li><code>mat[i][j]</code> is either <code>0</code> or <code>1</code>.</li>
	<li>There is at least one <code>0</code> in <code>mat</code>.</li>
</ul>

<p>&nbsp;</p>
<p><strong>Note:</strong> This question is the same as 1765: <a href="https://leetcode.com/problems/map-of-highest-peak/description/" target="_blank">https://leetcode.com/problems/map-of-highest-peak/</a></p>"
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