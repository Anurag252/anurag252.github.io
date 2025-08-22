---
title: "2463 Minimum Recolors To Get K Consecutive Black Blocks"
date: "2025-03-08T05:15:16+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: |
  ## [Minimum Recolors to Get K Consecutive Black Blocks](https://leetcode.com/problems/minimum-recolors-to-get-k-consecutive-black-blocks) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  You are given a **0-indexed** string blocks of length n, where blocks[i] is either &#39;W&#39; or &#39;B&#39;, representing the color of the ith block. The characters &#39;W&#39; and &#39;B&#39; denote the colors white and black, respectively.
  
  You are also given an integer k, which is the desired number of **consecutive** black blocks.
  
  In one operation, you can **recolor** a white block such that it becomes a black block.
  
  Return* the **minimum** number of operations needed such that there is at least **one** occurrence of *k* consecutive black blocks.*
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** blocks = \"WBBWWBBWBW\", k = 7
  **Output:** 3
  **Explanation:**
  One way to achieve 7 consecutive black blocks is to recolor the 0th, 3rd, and 4th blocks
  so that blocks = \"BBBBBBBWBW\". 
  It can be shown that there is no way to achieve 7 consecutive black blocks in less than 3 operations.
  Therefore, we return 3.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** blocks = \"WBWBBBW\", k = 2
  **Output:** 0
  **Explanation:**
  No changes need to be made, since 2 consecutive black blocks already exist.
  Therefore, we return 0.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	n == blocks.length
  	1 &lt;= n &lt;= 100
  	blocks[i] is either &#39;W&#39; or &#39;B&#39;.
  	1 &lt;= k &lt;= n
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