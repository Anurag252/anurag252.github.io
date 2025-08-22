---
title: "Find The Punishment Number Of An Integer"
date: "2025-02-15T08:36:25+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 8 ms (80.00%) | Memory: 4.1 MB (50.00%) - LeetSync"
---

```go
func punishmentNumber(n int) int {
    // we can do n + T(n-1)
    // for each n -> square it, then split it and see if thi sums up. This can be done in 
    // 6 (log n2) iterations for each n
    // n2logn
    // m times 
    // n2^logn
    if n == 1 {
        return 1
    }

    k := n * n
    if recurse(k, n, 0) {
        //fmt.Println(n, "found")
        return k + punishmentNumber(n-1)
    }

    return punishmentNumber(n-1)
    
}

func recurse(n int, init int, sum int) bool {
    if n <= 9 {
        if init == sum + n {
            return true
        } else {
            return false
        }
    }

    if init == sum + n {
            return true
    }

    l := n
    b := 10

    for l / b  > 0 {
        rem := l % b
        if recurse(l/b, init, sum + rem) {
            return true
        }
        b *= 10
    }
    return false

}
```