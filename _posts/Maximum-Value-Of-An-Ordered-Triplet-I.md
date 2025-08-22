---
title: "Maximum Value Of An Ordered Triplet I"
date: "2025-04-02T08:01:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 4 ms (70.82%) | Memory: 18.1 MB (8.98%) - LeetSync"
---

```python
class Solution:
    def maximumTripletValue(self, nums: List[int]) -> int:
        pos = [0] * len(nums)
        pos1 = [0] * len(nums)
        mn = [0] * len(nums)
        
        temp1 = 0
        temp2 = 0
        temp3 = 1000
        for i, k in enumerate(nums[::-1]):
            if temp1 < k:
                temp1 = k
            pos[len(nums) - i-1] = temp1
        
        for i, k in enumerate(nums):
            if temp2 < k:
                temp2 = k
            pos1[i] = temp2

        for i, k in enumerate(nums[::-1]):
            if temp3 > k:
                temp3 = k
            mn[len(nums) - i-1] = temp3
            
        print(pos, pos1, mn)
        mx = 0

        for i , k in enumerate(nums):
            if i - 1 >= 0 and i + 1 < len(nums):
                mx = max(mx, (pos1[i-1] - k) * pos[i+1])
        return mx

        
```