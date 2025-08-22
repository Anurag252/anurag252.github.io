---
title: "./3332 Minimum Operations To Exceed Threshold Value Ii"
date: "2025-02-13T07:57:47+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-operations-to-exceed-threshold-value-ii">Minimum Operations to Exceed Threshold Value II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> integer array <code>nums</code>, and an integer <code>k</code>.</p>

<p>In one operation, you will:</p>

<ul>
	<li>Take the two smallest integers <code>x</code> and <code>y</code> in <code>nums</code>.</li>
	<li>Remove <code>x</code> and <code>y</code> from <code>nums</code>.</li>
	<li>Add <code>min(x, y) * 2 + max(x, y)</code> anywhere in the array.</li>
</ul>

<p><strong>Note</strong> that you can only apply the described operation if <code>nums</code> contains at least two elements.</p>

<p>Return <em>the <strong>minimum</strong> number of operations needed so that all elements of the array are greater than or equal to</em> <code>k</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,11,10,1,3], k = 10
<strong>Output:</strong> 2
<strong>Explanation:</strong> In the first operation, we remove elements 1 and 2, then add 1 * 2 + 2 to nums. nums becomes equal to [4, 11, 10, 3].
In the second operation, we remove elements 3 and 4, then add 3 * 2 + 4 to nums. nums becomes equal to [10, 11, 10].
At this stage, all the elements of nums are greater than or equal to 10 so we can stop.
It can be shown that 2 is the minimum number of operations needed so that all elements of the array are greater than or equal to 10.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,1,2,4,9], k = 20
<strong>Output:</strong> 4
<strong>Explanation:</strong> After one operation, nums becomes equal to [2, 4, 9, 3].
After two operations, nums becomes equal to [7, 4, 9].
After three operations, nums becomes equal to [15, 9].
After four operations, nums becomes equal to [33].
At this stage, all the elements of nums are greater than 20 so we can stop.
It can be shown that 4 is the minimum number of operations needed so that all elements of the array are greater than or equal to 20.</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= nums.length &lt;= 2 * 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
	<li><code>1 &lt;= k &lt;= 10<sup>9</sup></code></li>
	<li>The input is generated such that an answer always exists. That is, there exists some sequence of operations after which all elements of the array are greater than or equal to <code>k</code>.</li>
</ul>"
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