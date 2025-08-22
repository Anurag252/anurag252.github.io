---
title: "3332 Minimum Operations To Exceed Threshold Value Ii"
date: "2025-02-13T07:57:47+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: |
  ## [Minimum Operations to Exceed Threshold Value II](https://leetcode.com/problems/minimum-operations-to-exceed-threshold-value-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a **0-indexed** integer array nums, and an integer k.
  
  In one operation, you will:
  
  	Take the two smallest integers x and y in nums.
  	Remove x and y from nums.
  	Add min(x, y) * 2 + max(x, y) anywhere in the array.
  
  **Note** that you can only apply the described operation if nums contains at least two elements.
  
  Return *the **minimum** number of operations needed so that all elements of the array are greater than or equal to* k.
  
   
  
  Example 1:
  
  ```
  
  **Input:** nums = [2,11,10,1,3], k = 10
  **Output:** 2
  **Explanation:** In the first operation, we remove elements 1 and 2, then add 1 * 2 + 2 to nums. nums becomes equal to [4, 11, 10, 3].
  In the second operation, we remove elements 3 and 4, then add 3 * 2 + 4 to nums. nums becomes equal to [10, 11, 10].
  At this stage, all the elements of nums are greater than or equal to 10 so we can stop.
  It can be shown that 2 is the minimum number of operations needed so that all elements of the array are greater than or equal to 10.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [1,1,2,4,9], k = 20
  **Output:** 4
  **Explanation:** After one operation, nums becomes equal to [2, 4, 9, 3].
  After two operations, nums becomes equal to [7, 4, 9].
  After three operations, nums becomes equal to [15, 9].
  After four operations, nums becomes equal to [33].
  At this stage, all the elements of nums are greater than 20 so we can stop.
  It can be shown that 4 is the minimum number of operations needed so that all elements of the array are greater than or equal to 20.
  ```
  
   
  
  **Constraints:**
  
  	2 <= nums.length <= 2 * 105
  	1 <= nums[i] <= 109
  	1 <= k <= 109
  	The input is generated such that an answer always exists. That is, there exists some sequence of operations after which all elements of the array are greater than or equal to k.
---

```go
import pq "github.com/emirpasic/gods/queues/priorityqueue"


type Element struct {
    name     int
    priority int
}

func byPriority(a, b interface{}) int {
    priorityA := a.(Element).priority
    priorityB := b.(Element).priority
    return utils.IntComparator(priorityA, priorityB) // "-" descending order
}


func minOperations(nums []int, k int) int {
    q := pq.NewWith(byPriority)
    for _, k := range nums {
        a := Element{name:k , priority: k}
        q.Enqueue(a)
    }
    top := 0
    top1 := 0
    m , _ := q.Peek()
    p := (m.(Element)).name


    res := 0
    for (p < k) {
        res ++
        elem, ok := q.Dequeue()
        if !ok {
            return -1 // should never occur as per constraints
        }
        top = (elem.(Element)).name


        elem, ok = q.Dequeue()
        if !ok {
            return -1 // should never occur as per constraints
        }
        top1 = (elem.(Element)).name

        newelem := min(top, top1) * 2 + max(top, top1)
        q.Enqueue(Element{name:newelem , priority: newelem})
        m , _ = q.Peek()
        p = (m.(Element)).name
    }
    //fmt.Println(q.Values())
    return res
}
```