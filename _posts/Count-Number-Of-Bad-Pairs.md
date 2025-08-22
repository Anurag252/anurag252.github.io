---
title: "Count Number Of Bad Pairs"
date: "2025-02-09T11:11:05+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 27 ms (84.62%) | Memory: 15.2 MB (30.77%) - LeetSync"
---

```go
func countBadPairs(nums []int) int64 {

    // consecutive numbers must lie at indexes
    // we could count the number of consecutive numbers but 
    // [1,6,7,4,5], here 6 and 7 are consecutive and good pair and 1,4,5 are another good pairs
    // another obsv is that all good pairs till 4 will be added to 5
    // total number of pairs are n + n-1 + n-2 + n-3 . . .
    // saw the 2nd hint

    mp := make(map[int]int)

    totalPairs := int64(len(nums) * (len(nums) -1))/2
    goodPairs := int64(0)
    for i, k := range nums {
        elem := k - i
        _, ok := mp[elem]
        if ! ok {
            mp[elem] = 1
        } else {
            mp[elem] += 1
        }
    }

    for _, k := range mp {
        if k > 1 {
            goodPairs += int64((k * (k-1))/2)
        }
        
    }
    //fmt.Println(mp)
    return totalPairs - goodPairs

}
```