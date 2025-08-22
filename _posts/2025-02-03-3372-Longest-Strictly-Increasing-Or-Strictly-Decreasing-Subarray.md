---
title: "3372 Longest Strictly Increasing Or Strictly Decreasing Subarray"
date: "2025-02-03T07:25:23+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---

## [Longest Strictly Increasing or Strictly Decreasing Subarray](https://leetcode.com/problems/longest-strictly-increasing-or-strictly-decreasing-subarray) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an array of integers nums. Return *the length of the **longest** subarray of *nums* which is either **strictly increasing** or **strictly decreasing***.

 

Example 1:

**Input:** nums = [1,4,3,3,2]

**Output:** 2

**Explanation:**

The strictly increasing subarrays of nums are [1], [2], [3], [3], [4], and [1,4].

The strictly decreasing subarrays of nums are [1], [2], [3], [3], [4], [3,2], and [4,3].

Hence, we return 2.

Example 2:

**Input:** nums = [3,3,3,3]

**Output:** 1

**Explanation:**

The strictly increasing subarrays of nums are [3], [3], [3], and [3].

The strictly decreasing subarrays of nums are [3], [3], [3], and [3].

Hence, we return 1.

Example 3:

**Input:** nums = [3,2,1]

**Output:** 3

**Explanation:**

The strictly increasing subarrays of nums are [3], [2], and [1].

The strictly decreasing subarrays of nums are [3], [2], [1], [3,2], [2,1], and [3,2,1].

Hence, we return 3.

 

**Constraints:**

	1 <= nums.length <= 50
	1 <= nums[i] <= 50

```go
func longestMonotonicSubarray(nums []int) int {
    l := 0
    prev := -1
    res := 0
    for _ , k := range nums {
        if prev < k {
            l += 1
            prev = k
        } else {
            res = max(res, l)
            l = 1
            prev = k
        }
    }
    res = max(res, l)
    prev = -1
    l = 0
    
    //fmt.Println(nums)
    for _ , k := range nums {
        if prev > k {
            l += 1
            prev = k
        } else {
            res = max(res, l)
            l = 1
            prev = k
        }
    }
    res = max(res, l)
    return res
}
```