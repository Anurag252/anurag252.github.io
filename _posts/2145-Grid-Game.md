---
title: "./2145 Grid Game"
date: "2025-01-21T13:27:22+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/grid-game">Grid Game</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> 2D array <code>grid</code> of size <code>2 x n</code>, where <code>grid[r][c]</code> represents the number of points at position <code>(r, c)</code> on the matrix. Two robots are playing a game on this matrix.</p>

<p>Both robots initially start at <code>(0, 0)</code> and want to reach <code>(1, n-1)</code>. Each robot may only move to the <strong>right</strong> (<code>(r, c)</code> to <code>(r, c + 1)</code>) or <strong>down </strong>(<code>(r, c)</code> to <code>(r + 1, c)</code>).</p>

<p>At the start of the game, the <strong>first</strong> robot moves from <code>(0, 0)</code> to <code>(1, n-1)</code>, collecting all the points from the cells on its path. For all cells <code>(r, c)</code> traversed on the path, <code>grid[r][c]</code> is set to <code>0</code>. Then, the <strong>second</strong> robot moves from <code>(0, 0)</code> to <code>(1, n-1)</code>, collecting the points on its path. Note that their paths may intersect with one another.</p>

<p>The <strong>first</strong> robot wants to <strong>minimize</strong> the number of points collected by the <strong>second</strong> robot. In contrast, the <strong>second </strong>robot wants to <strong>maximize</strong> the number of points it collects. If both robots play <strong>optimally</strong>, return <em>the <b>number of points</b> collected by the <strong>second</strong> robot.</em></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/09/08/a1.png" style="width: 388px; height: 103px;" />
<pre>
<strong>Input:</strong> grid = [[2,5,4],[1,5,1]]
<strong>Output:</strong> 4
<strong>Explanation:</strong> The optimal path taken by the first robot is shown in red, and the optimal path taken by the second robot is shown in blue.
The cells visited by the first robot are set to 0.
The second robot will collect 0 + 0 + 4 + 0 = 4 points.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/09/08/a2.png" style="width: 384px; height: 105px;" />
<pre>
<strong>Input:</strong> grid = [[3,3,1],[8,5,2]]
<strong>Output:</strong> 4
<strong>Explanation:</strong> The optimal path taken by the first robot is shown in red, and the optimal path taken by the second robot is shown in blue.
The cells visited by the first robot are set to 0.
The second robot will collect 0 + 3 + 1 + 0 = 4 points.
</pre>

<p><strong class="example">Example 3:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/09/08/a3.png" style="width: 493px; height: 103px;" />
<pre>
<strong>Input:</strong> grid = [[1,3,1,15],[1,3,3,1]]
<strong>Output:</strong> 7
<strong>Explanation: </strong>The optimal path taken by the first robot is shown in red, and the optimal path taken by the second robot is shown in blue.
The cells visited by the first robot are set to 0.
The second robot will collect 0 + 1 + 3 + 3 + 0 = 7 points.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>grid.length == 2</code></li>
	<li><code>n == grid[r].length</code></li>
	<li><code>1 &lt;= n &lt;= 5 * 10<sup>4</sup></code></li>
	<li><code>1 &lt;= grid[r][c] &lt;= 10<sup>5</sup></code></li>
</ul>"
---

```go
/*
dp did not work 
1 2 3 4
5 6 7 8

10,9,7,4
26,21,15,8
https://leetcode.com/problems/grid-game/editorial/comments/2817377

for every n , i to find the pivot and then n to evaluate b's sum n*n*n
- fill prefix and suffix for both rows
- row1 prefix + row0 suffix sum least 

*/

func gridGame(grid [][]int) int64 {
    if len(grid[0]) == 1 {
        return 0
    }
    arr := make([][]int, 2)

    for i := 0 ; i < 2 ; i ++ {
        arr[i] = make([]int, len(grid[0]))
    }

    temp := 0
    for i := 0 ; i < len(grid[0]) ; i ++ {
        temp += grid[1][i]
        arr[1][i] = temp
    }

    temp = 0
    for i := len(grid[0]) - 1 ; i >= 0 ; i -- {
        temp += grid[0][i]
        arr[0][i] = temp
    }

    s := 10000000000000
    for i := 0 ; i < len(grid[0]) ; i ++ {

        if i - 1 >= 0 && i + 1 < len(grid[0]) {
            s = min(s, max(arr[1][i-1] , arr[0][i+1]))
            continue
        }

        if i - 1 < 0 && i + 1 < len(grid[0]){
            s = min(s,  arr[0][i+1])
            continue
        }

        if i - 1 >= 0 && i + 1 > len(grid[0])-1 {
            s = min(s,  arr[1][i-1])
            continue
        }
        
    }
    return int64(s)
    
}

```