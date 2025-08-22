---
title: "Find The Prefix Common Array Of Two Arrays"
date: "2025-01-14T06:48:03+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 8.2 MB (73.42%) - LeetSync"
---

```go
func findThePrefixCommonArray(A []int, B []int) []int {
    mp := make([]int, len(A))

    res := make([]int, len(A))

    temp := 0

    for i , _ := range A {
        mp[A[i]-1] += 1
        mp[B[i]-1] += 1

        if mp[A[i]-1] == 2 {
            temp += 1
            mp[A[i]-1] = 0
        }

        if mp[B[i]-1] == 2 {
            temp += 1
            mp[B[i]-1] = 0
        }
        res[i] = temp
    }
    return res
}
```