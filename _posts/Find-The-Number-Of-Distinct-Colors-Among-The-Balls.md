---
title: "Find The Number Of Distinct Colors Among The Balls"
date: "2025-02-07T08:22:51+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 109 ms (11.11%) | Memory: 26.8 MB (44.44%) - LeetSync"
---

```go
func queryResults(limit int, queries [][]int) []int {
    balls := make(map[int]int)
    colors := make(map[int]int)
    res := make([]int, 0)
    for _, k := range queries {
        col , ok := balls[k[0]]
        if ! ok {
            balls[k[0]] = k[1]
            _, ok = colors[k[1]]
            if !ok {
                colors[k[1]] = 1
            } else {
                colors[k[1]] += 1
            }
            
        } else {
            balls[k[0]]  = k[1]
            colors[col] -= 1
            if colors[col] == 0 {
                delete(colors, col)
            }
            _, ok = colors[k[1]]
            if !ok {
                colors[k[1]] = 1
            } else {
                colors[k[1]] += 1
            }

        }
        //fmt.Println(colors)
        res = append(res, len(colors))
        
    }
    
    return res
}
```