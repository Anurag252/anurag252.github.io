---
title: "Maximum Absolute Sum Of Any Subarray"
date: "2025-02-26T07:13:44+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 126 ms (6.83%) | Memory: 32 MB (6.10%) - LeetSync"
---

```python
class Solution:
    def maxAbsoluteSum(self, nums: List[int]) -> int:
        # idea is that every time a +ve appears
        # i include it in sum 
        # but if a negative appears , sum until previous number was better 
        # I start fresh ,-> no abs sum can have negative
        # prefix sum , take non absolute sums till index i
        # and then find  index j at max distt from it and find absolute.
        # 2,-3,-2,-6,-3,-5
        # 
        pref_sum = []
        temp = 0
        for k in nums:
            temp += k
            pref_sum.append(temp)

        max_arr = []
        min_arr =[]
        ma = -100000
        mi = 100000
        for i, k in enumerate(pref_sum):
            ma = max(ma, k)
            mi = min(mi, k)
            max_arr.append(ma)
            min_arr.append(mi)
        #print(pref_sum, max_arr, min_arr)
        res = 0
        for i, k in enumerate(pref_sum):
                res = max(res, abs(k - max_arr[i]) , abs(k - min_arr[i]), abs(k))
        return res


        
```