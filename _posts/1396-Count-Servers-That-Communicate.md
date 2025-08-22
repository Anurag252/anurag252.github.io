---
title: "./1396 Count Servers That Communicate"
date: "2025-01-23T19:15:57+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-servers-that-communicate">Count Servers that Communicate</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a map of a server center, represented as a <code>m * n</code> integer matrix&nbsp;<code>grid</code>, where 1 means that on that cell there is a server and 0 means that it is no server. Two servers are said to communicate if they are on the same row or on the same column.<br />
<br />
Return the number of servers&nbsp;that communicate with any other server.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2019/11/14/untitled-diagram-6.jpg" style="width: 202px; height: 203px;" /></p>

<pre>
<strong>Input:</strong> grid = [[1,0],[0,1]]
<strong>Output:</strong> 0
<b>Explanation:</b>&nbsp;No servers can communicate with others.</pre>

<p><strong class="example">Example 2:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2019/11/13/untitled-diagram-4.jpg" style="width: 203px; height: 203px;" /></strong></p>

<pre>
<strong>Input:</strong> grid = [[1,0],[1,1]]
<strong>Output:</strong> 3
<b>Explanation:</b>&nbsp;All three servers can communicate with at least one other server.
</pre>

<p><strong class="example">Example 3:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2019/11/14/untitled-diagram-1-3.jpg" style="width: 443px; height: 443px;" /></p>

<pre>
<strong>Input:</strong> grid = [[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]]
<strong>Output:</strong> 4
<b>Explanation:</b>&nbsp;The two servers in the first row can communicate with each other. The two servers in the third column can communicate with each other. The server at right bottom corner can&#39;t communicate with any other server.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == grid.length</code></li>
	<li><code>n == grid[i].length</code></li>
	<li><code>1 &lt;= m &lt;= 250</code></li>
	<li><code>1 &lt;= n &lt;= 250</code></li>
	<li><code>grid[i][j] == 0 or 1</code></li>
</ul>"
---

```go

func dfs_row(row int, col int, grid [][]int, found bool) (int ) {
    res := 0
    
    for k , v := range grid[row] {
       if v == 1 {
        grid[row][k] = 0
        res += res + 1+ dfs_row(row, k , grid, true)
       }
    }

    for a := range len(grid) {
        if grid[a][col] == 1 {
            grid[a][col] = 0
            res = res + 1 +  dfs_row(a, col , grid, true)
            //grid[a][col] = 1
        }
    }
    if !found && res == 1 {
        return 0
    }
    return res

}



func countServers(grid [][]int) int {

    res := make(map[string]bool, 0)
    
    first_match_row := make(map[int][]string)
    first_match_col := make(map[int][]string)
    //mp := make(map[int]int, 0)
    for i , _ := range grid {
        for j , _ := range grid[0] {
            
            if grid[i][j] == 1 {
                _, ok1 := first_match_row[i]
                _, ok2 := first_match_col[j]

                if !ok1 {
                    first_match_row[i] = make([]string, 0)
                }
                 if !ok2 {
                    first_match_col[j] = make([]string, 0)
                }

                first_match_row[i] = append(first_match_row[i], strconv.Itoa(i)+"$"+ strconv.Itoa(j))
                first_match_col[j] = append(first_match_col[j], strconv.Itoa(i)+"$"+ strconv.Itoa(j))
                
                //fmt.Println(i,j,res,first_match_row, first_match_col, row, col, ok1, ok2)
            }
        }
    }

    for _,v := range first_match_row {
        if len(v) == 1 {
            continue
        }
        for _, v1 := range v {
            res[v1] = true
        }
    }

    for _,v := range first_match_col {
        if len(v) == 1 {
            continue
        }
        for _, v1 := range v {
            res[v1] = true
        }
    }

     
    
    return len(res)
}
```