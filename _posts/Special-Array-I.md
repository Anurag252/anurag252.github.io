---
title: "Special Array I"
date: "2025-02-01T10:17:47+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 4.7 MB (23.17%) - LeetSync"
---

```go
func isArraySpecial(nums []int) bool {
    t := nums[0]
    isEven := false // odd

    if t & 1 == 0 { // even
        isEven = true
    }

    // 1 0 1 0 1 0
    // 0 1 0 1 0 1

    for _ , k := range nums {
        
        if ( ((k & 1) == 0 &&  isEven ) || ((k & 1) == 1 &&  !isEven ) ) {
            isEven = !isEven
        } else {
            return false
        }
        
       
        //fmt.Println(t, k, k & 1)
        
    }
    return true
}
```