---
title: "Minimum Recolors To Get K Consecutive Black Blocks"
date: "2025-03-08T05:15:16+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 3.9 MB (100.00%) - LeetSync"
---

```go
func minimumRecolors(blocks string, k int) int {
    black := 0
    white := 0
    left := 0
    right := 0

    for i := range  k {
        if blocks[i] == 'W' {
            white ++
        } else {
            black ++
        }
    }

    if white == 0 {
        return 0
    }

    right = k-1
    count := 101
    for right < len(blocks) - 1 {
        count = min(count, white)
        right ++ 
        if blocks[right] == 'W' {
            white ++
        } else {
            black ++
        }
        
        if blocks[left] == 'W' {
            white --
        } else {
            black --
        }

        left ++
    }
    count = min(count, white)
    return count
}
```