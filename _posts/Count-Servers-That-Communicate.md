---
title: "Count Servers That Communicate"
date: "2025-01-23T19:15:57+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 5 ms (26.67%) | Memory: 9.3 MB (20.00%) - LeetSync"
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