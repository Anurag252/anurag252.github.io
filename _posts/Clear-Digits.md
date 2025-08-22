---
title: "Clear Digits"
date: "2025-02-10T07:22:00+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 4.6 MB (8.89%) - LeetSync"
---

```go
func clearDigits(s string) string {
    st := make([]rune,0)
    for _ , k := range s {
        _, err := strconv.Atoi(string(k))
        if err == nil {
            if len(st) > 0 {
                st = st[:len(st)-1]
            }
        } else {
            st = append(st , k)
        }
    }

    m := ""
    for _, k := range st {
        m += string(k)
    }
    return m
}
```