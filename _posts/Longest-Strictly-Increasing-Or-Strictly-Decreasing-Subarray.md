---
title: "Longest Strictly Increasing Or Strictly Decreasing Subarray"
date: "2025-02-03T07:25:23+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 4.4 MB (64.44%) - LeetSync"
---

```go
func longestMonotonicSubarray(nums []int) int {
    l := 0
    prev := -1
    res := 0
    for _ , k := range nums {
        if prev < k {
            l += 1
            prev = k
        } else {
            res = max(res, l)
            l = 1
            prev = k
        }
    }
    res = max(res, l)
    prev = -1
    l = 0
    
    //fmt.Println(nums)
    for _ , k := range nums {
        if prev > k {
            l += 1
            prev = k
        } else {
            res = max(res, l)
            l = 1
            prev = k
        }
    }
    res = max(res, l)
    return res
}
```