---
title: "Grid Game"
date: "2025-01-21T13:27:22+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 10 ms (14.29%) | Memory: 9.8 MB (78.57%) - LeetSync"
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