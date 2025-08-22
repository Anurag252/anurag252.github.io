---
title: "Maximum Difference Between Increasing Elements"
date: "2025-06-16T11:37:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3 ms (51.98%) | Memory: 18.2 MB (17.41%) - LeetSync"
---

```python
class Solution:
    def maximumDifference(self, nums: List[int]) -> int:
        min_arr =[]
        max_arr = []
        min_till_here = 10000000000
        max_till_here = 0
        for k in nums:
            min_till_here = min(k, min_till_here)
            min_arr.append(min_till_here)
            
        
        for k in nums[::-1]:
            max_till_here = max(k, max_till_here)
            max_arr.append(max_till_here)


        ans = -1
        for k1, k2 in zip(min_arr, max_arr[::-1]):
            if k2 > k1:
                ans = max(ans, k2-k1)
        return ans


```