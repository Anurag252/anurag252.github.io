---
title: "Remove All Occurrences Of A Substring"
date: "2025-02-11T08:43:07+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 18 ms (5.41%) | Memory: 7.3 MB (32.43%) - LeetSync"
---

```go
import (
    "strings"
    "fmt"
    "hash/fnv"
)

func hash(s string) uint32 {
        h := fnv.New32a()
        h.Write([]byte(s))
        return h.Sum32()
}

func removeOccurrences(s string, part string) string {
    // in case we do a recursive func, we get n/2 * m 
    // another approach is maybe brackets balancing like stack
    // that is m + n efficient ?def more than first approach 
    // No this is also n*m
    // how about sliding window ?


    st := make([]string, 0)
    h := hash(part)
    for _, k := range s {
        if len(st) >= len(part) {
            last := st[len(st) - len(part):]
            //fmt.Println(last, st)
            if hash(strings.Join(last, "")) == h {
                st = st[:len(st) - len(part)]
            } 
        }
        st = append(st, string(k))
        
    }
    if len(st) >= len(part) {
            last := st[len(st) - len(part):]
            fmt.Println(last, st)
            if strings.Join(last, "") == part {
                st = st[:len(st) - len(part)]
            } 
        }
    return strings.Join(st, "")
    





}
```