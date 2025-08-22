---
title: "Minimum Operations To Make Array Values Equal To K"
date: "2025-04-09T14:02:58+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 70 ms (35.38%) | Memory: 17.6 MB (75.47%) - LeetSync"
---

```python
class Solution:
    def minOperations(self, nums: List[int], k: int) -> int:
        # keep fetching the largest elements and keep changing them to 
        # h
        # at the end res is num of unique elements > k

        s = set(nums)
        count = 0
        c = 0
        if k > min(nums):
            return -1
        for m in nums:
            if m == k:
                c += 1
        if c == len(nums):
            return 0

        for m in s:
            if m > k:
                count += 1
            
            
       
        return count if count > 0 else -1

        
```