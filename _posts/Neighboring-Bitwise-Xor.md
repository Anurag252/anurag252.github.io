---
title: "Neighboring Bitwise Xor"
date: "2025-01-17T08:15:51+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 161 ms (0.00%) | Memory: 19.2 MB (11.11%) - LeetSync"
---

```go
func doesValidArrayExist(derived []int) bool {
    // a ^ b = 1 diff
    // b ^ c = 1 diff
    // c ^ a = 1 diff
    // if a and b are same , b and c are same but c and a are diff -> not possible 
    // it is always possible to construct derived except last element to first elemen rule
    // and there are only two possible solutions start with 0 or 1

    valid := make([]int,1)

    // start with 0
    valid[0] = 0

    for _, k := range derived {
        if k == 1 {
            if valid[len(valid) - 1] == 1 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        } else {
            if valid[len(valid) - 1] == 0 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        }
    }

    if valid[len(valid) - 1] == valid[0] {
        return true
    }
    fmt.Println(valid)
    valid = make([]int,1)

    // start with 0
    valid[0] = 1

    for _, k := range derived {
        if k == 1 {
            if valid[len(valid) - 1] == 1 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        } else {
            if valid[len(valid) - 1] == 0 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        }
    }

    if valid[len(valid) - 1] == valid[0] {
        return true
    }
    return false
}
```