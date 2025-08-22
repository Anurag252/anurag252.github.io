---
title: "Make Lexicographically Smallest Array By Swapping Elements"
date: "2025-01-25T13:36:21+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 127 ms (60.00%) | Memory: 20.2 MB (40.00%) - LeetSync"
---

```go
import "slices"

func lexicographicallySmallestArray(nums []int, limit int) []int {

    if len(nums) <= 1 {
        return nums
    }
    arr := make([]int, len(nums))
    for i, _ := range nums {
        arr[i] = nums[i]
    }
    slices.Sort(arr)

    temp := make([][]int, 0)
    temp1 := make([]int, 0)
    
    for i, _ := range arr {
        if i == len(arr) - 1 {
            if len(temp1) > 0 {

            }
            if arr[i] - arr[i-1] <= limit { // if true that means i-1 was already added
                temp1 = append(temp1, i)
                cpy := make([]int, len(temp1))
                copy(cpy, temp1)
                temp = append(temp, cpy)
                
            } else { // i-1 was already added
                if len(temp1) > 0 {
                    cpy := make([]int, len(temp1))
                    copy(cpy, temp1)
                    temp = append(temp, cpy)
                }
                
                temp1 = make([]int, 0)
                temp1 = append(temp1, i)
                cpy := make([]int, len(temp1))
                copy(cpy, temp1)
                temp = append(temp, cpy)

            }
            

            break
        }
        if arr[i+1] - arr[i] <= limit {
            temp1 = append(temp1, i)
        } else {
            temp1 = append(temp1, i) // previous is added to ans
            cpy := make([]int, len(temp1))
            copy(cpy, temp1)
            temp = append(temp, cpy)
            temp1 = make([]int, 0)
            
        }
    }

    mp := make(map[int]int)

    for i, k := range temp {
        for _, j := range k {
            mp[arr[j]] = i
        }
    }
    tl := make([]int, len(temp))
    for i, _ := range nums {
        grp := mp[nums[i]]
        temp1 := temp[grp]
        index := tl[grp]
        nums[i] = arr[temp1[index]]
        tl[grp] += 1

    }
    
    //fmt.Println(temp, arr, mp)
    return nums
}
```