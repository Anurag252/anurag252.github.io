---
title: "Tuple With Same Product"
date: "2025-02-06T08:16:01+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 226 ms (14.29%) | Memory: 42 MB (85.71%) - LeetSync"
---

```go
func tupleSameProduct(nums []int) int {
    mp := make(map[int]int)

    for _, k1 := range nums {
        for _ , k2 := range nums {
            if k1 != k2 {
                mp[k1*k2] += 1
            }
        }
    }   

    //fmt.Println(mp)
    res := 0
    // 4-> 8
    // 6 -> 24 
    // a b c d perm -> 8
    // ab cd
    // ab cd ef-> 8
    // ab cd, ba cd, ab dc, ba dc, 
    // groups of v / 2 -> from this select 2
    // groups of 4/ 2 = 2 -> from this select 2 only 1 way
    // gropus of 6/2 = 3 -> from this select 2 only 3 ways 
    for _, v := range mp {
        if v >= 4 {
            groups := v/2
            sel := (groups * (groups -1)) / 2
            res += (8 * sel)
        }
    }

   
    return res

}
```