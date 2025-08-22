---
title: "Maximum Ascending Subarray Sum"
date: "2025-02-04T08:05:36+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 4.2 MB (11.54%) - LeetSync"
---

```go
func maxAscendingSum(nums []int) int {
    s := 0
    prev := -1
    res := 0
    for _, k := range nums {
        if prev < k {
            s += k
            prev = k
        } else {
            res = max(res, s)
            s = k
            prev = k
        }
    }

     res = max(res, s)
     return res
}
```