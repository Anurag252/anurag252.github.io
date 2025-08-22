---
title: "Maximum Number Of Fish In A Grid"
date: "2025-01-28T21:31:30+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 8.8 MB (12.50%) - LeetSync"
---

```go

func dfs(i int, j int, grid [][]int) int {
    if (grid)[i][j] == 0 {
        return 0
    }
    res := (grid)[i][j]
    (grid)[i][j] = 0
    dir := [][]int{{1,0}, {0,1}, {-1,0}, {0,-1}}
    for _, k := range dir {
        if k[0] + i >= 0 && k[0] + i < len(grid) && k[1] + j >= 0 && k[1] + j < len((grid)[0]) {
            res += dfs(k[0] + i, k[1] + j, grid)
        }
    }
    return res
}

func findMaxFish(grid [][]int) int {
    res := 0
    for i, _ := range grid {
        for j, k := range grid[i] {
            if k > 0 {
               // fmt.Println(grid, i, j)
                res = max(res,dfs(i, j , grid))
            }
        }
    }
    return res
}
```