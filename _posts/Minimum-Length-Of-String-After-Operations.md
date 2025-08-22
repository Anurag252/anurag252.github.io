---
title: "Minimum Length Of String After Operations"
date: "2025-01-13T21:08:32+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 111 ms (11.11%) | Memory: 8.6 MB (100.00%) - LeetSync"
---

```go
func minimumLength(s string) int {
    // if there are 3 chars then 2 can be removed 1 is left 
    // if there are 4 - then also 2 can be removed 2 is left 
    // if there are 5 then 2 can be removed then 3 are left 
    // keep reducing 2 till at max 2 is left
    // (n - 2k) = 1  
    // n - 1/2 = 2k

    mp := make(map[rune]int)

    for _, k := range s {
        if _, ok := mp[k]; ok {
            mp[k] += 1
        } else {
            mp[k] = 1
        }
    }
    reduced := 0
    for _,v := range mp {
        if v >= 3 {
            if (v-1) % 2 == 0 {
                reduced += (v - 1)
            } else {
                reduced += (v - 2)
            }
        }
    }
    return len(s) - reduced
    
}
```