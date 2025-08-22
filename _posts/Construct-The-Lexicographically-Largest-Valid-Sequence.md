---
title: "Construct The Lexicographically Largest Valid Sequence"
date: "2025-02-16T09:07:43+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 4 MB (100.00%) - LeetSync"
---

```go
package main

import "fmt"

func constructDistancedSequence(n int) []int {
    arr := make([]int, 2*n-1)
    used := make([]bool, n+1)
    
    var result []int
    recurse(arr, used, n, 0, &result)
    return result
}

func recurse(arr []int, used []bool, n, index int, result *[]int) bool {
    if index == len(arr) {
        *result = append([]int(nil), arr...) // Store the first valid solution
        return true
    }

    if arr[index] != 0 {
        return recurse(arr, used, n, index+1, result) // Skip filled indices
    }

    for num := n; num >= 1; num-- {
        if used[num] {
            continue
        }
        if num == 1 {
            arr[index] = 1
            used[1] = true
            if recurse(arr, used, n, index+1, result) {
                return true
            }
            arr[index] = 0
            used[1] = false
        } else if index+num < len(arr) && arr[index+num] == 0 {
            arr[index], arr[index+num] = num, num
            used[num] = true
            if recurse(arr, used, n, index+1, result) {
                return true
            }
            arr[index], arr[index+num] = 0, 0
            used[num] = false
        }
    }
    return false
}



```