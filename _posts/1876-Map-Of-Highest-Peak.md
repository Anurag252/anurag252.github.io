---
title: "./1876 Map Of Highest Peak"
date: "2025-01-22T08:46:14+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/map-of-highest-peak">Map of Highest Peak</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer matrix <code>isWater</code> of size <code>m x n</code> that represents a map of <strong>land</strong> and <strong>water</strong> cells.</p>

<ul>
	<li>If <code>isWater[i][j] == 0</code>, cell <code>(i, j)</code> is a <strong>land</strong> cell.</li>
	<li>If <code>isWater[i][j] == 1</code>, cell <code>(i, j)</code> is a <strong>water</strong> cell.</li>
</ul>

<p>You must assign each cell a height in a way that follows these rules:</p>

<ul>
	<li>The height of each cell must be non-negative.</li>
	<li>If the cell is a <strong>water</strong> cell, its height must be <code>0</code>.</li>
	<li>Any two adjacent cells must have an absolute height difference of <strong>at most</strong> <code>1</code>. A cell is adjacent to another cell if the former is directly north, east, south, or west of the latter (i.e., their sides are touching).</li>
</ul>

<p>Find an assignment of heights such that the maximum height in the matrix is <strong>maximized</strong>.</p>

<p>Return <em>an integer matrix </em><code>height</code><em> of size </em><code>m x n</code><em> where </em><code>height[i][j]</code><em> is cell </em><code>(i, j)</code><em>&#39;s height. If there are multiple solutions, return <strong>any</strong> of them</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2021/01/10/screenshot-2021-01-11-at-82045-am.png" style="width: 220px; height: 219px;" /></strong></p>

<pre>
<strong>Input:</strong> isWater = [[0,1],[0,0]]
<strong>Output:</strong> [[1,0],[2,1]]
<strong>Explanation:</strong> The image shows the assigned heights of each cell.
The blue cell is the water cell, and the green cells are the land cells.
</pre>

<p><strong class="example">Example 2:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2021/01/10/screenshot-2021-01-11-at-82050-am.png" style="width: 300px; height: 296px;" /></strong></p>

<pre>
<strong>Input:</strong> isWater = [[0,0,1],[1,0,0],[0,0,0]]
<strong>Output:</strong> [[1,1,0],[0,1,1],[1,2,2]]
<strong>Explanation:</strong> A height of 2 is the maximum possible height of any assignment.
Any height assignment that has a maximum height of 2 while still meeting the rules will also be accepted.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == isWater.length</code></li>
	<li><code>n == isWater[i].length</code></li>
	<li><code>1 &lt;= m, n &lt;= 1000</code></li>
	<li><code>isWater[i][j]</code> is <code>0</code> or <code>1</code>.</li>
	<li>There is at least <strong>one</strong> water cell.</li>
</ul>

<p>&nbsp;</p>
<p><strong>Note:</strong> This question is the same as 542: <a href="https://leetcode.com/problems/01-matrix/description/" target="_blank">https://leetcode.com/problems/01-matrix/</a></p>"
---

```go
func highestPeak(isWater [][]int) [][]int {
    m, n := len(isWater), len(isWater[0])
    res := make([][]int, m)
    queue := [][]int{}

    for i := 0; i < m; i++ {
        res[i] = make([]int, n)
        for j := 0; j < n; j++ {
            if isWater[i][j] == 1 {
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