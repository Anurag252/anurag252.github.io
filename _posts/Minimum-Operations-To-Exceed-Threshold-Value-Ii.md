---
title: "Minimum Operations To Exceed Threshold Value Ii"
date: "2025-02-13T07:57:47+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 283 ms (10.00%) | Memory: 24.4 MB (10.00%) - LeetSync"
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