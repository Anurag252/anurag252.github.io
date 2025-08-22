---
title: "2473 Max Sum Of A Pair With Equal Sum Of Digits"
date: "2025-02-12T07:50:43+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---

## [Max Sum of a Pair With Equal Sum of Digits](https://leetcode.com/problems/max-sum-of-a-pair-with-equal-sum-of-digits) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** array nums consisting of **positive** integers. You can choose two indices i and j, such that i != j, and the sum of digits of the number nums[i] is equal to that of nums[j].

Return *the **maximum** value of *nums[i] + nums[j]* that you can obtain over all possible indices *i* and *j* that satisfy the conditions.*

 

Example 1:

```

**Input:** nums = [18,43,36,13,7]
**Output:** 54
**Explanation:** The pairs (i, j) that satisfy the conditions are:
- (0, 2), both numbers have a sum of digits equal to 9, and their sum is 18 + 36 = 54.
- (1, 4), both numbers have a sum of digits equal to 7, and their sum is 43 + 7 = 50.
So the maximum sum that we can obtain is 54.

```

Example 2:

```

**Input:** nums = [10,12,19,14]
**Output:** -1
**Explanation:** There are no two numbers that satisfy the conditions, so we return -1.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 109

```go


func maximumSum(nums []int) int {
    mp := make(map[int][]int)

    for i , k := range nums {
        n := 0
        for(k > 0) {
            n += (k % 10)
            k = k / 10
        }
        _, ok := mp[n]
        if ok {
            mp[n] = append(mp[n], i)
        } else {
            mp[n] = make([]int, 0)
            mp[n] = append(mp[n], i)
        }
    }
    //fmt.Println(mp)

    res := -1
    for _,v := range mp {
        if len(v) >= 2 {
            m1 := 0

            m2 := 0

            for _, c := range v {
                if nums[c] > m1 {
                    m2 = max(m2, m1)
                    m1 = nums[c]
                } else {
                    m2 = max(nums[c], m2)
                }

            }

            res = max(res, m1 + m2)
        }
    }
    return res
}
```