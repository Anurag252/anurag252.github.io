---
title: "The K Th Lexicographical String Of All Happy Strings Of Length N"
date: "2025-02-19T07:54:05+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 18 ms (18.18%) | Memory: 9 MB (18.18%) - LeetSync"
---

```go
//import "sort"
func getHappyString(n int, k int) string {
    str := []string{"a", "b", "c"}
    // list of n is a appended to n-1 list with restrictions
    res := calc(str, n) //T[n] = 2n*T[n-1] or  4n*T[n-2] or 8n*T[n-3] ..., T[n-1] = 2*T[n-2] -> n2^n
    // 2^10 is 1024
    //sort.Strings(res) // klogk -> saw from discussion that sorting maybe skipped as well as backtracking builds strings in correct order
    if len(res) > k - 1 {
        return res[k- 1]
    }
    return ""
}

func calc(str []string, n int) []string {
    if n == 1 {
        return str
    }
    newRes := make([]string, 0)
    res := calc(str, n-1)
    for _, k := range res {
        for _, k1 := range str {
                if string(k[len(k)-1]) != k1 {
                newRes = append(newRes,k + k1)
            }
        }
        
    }
    return newRes
}
```