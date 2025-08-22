---
title: "Minimum Number Of Operations To Make Elements In Array Distinct"
date: "2025-04-08T11:30:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1 ms (79.12%) | Memory: 17.8 MB (73.67%) - LeetSync"
---

```python
class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        arr = [0] * 101

        for i in nums:
            arr[i] += 1
        start = 0
        for k in range(0,100):
            found = False
            for m in range(0,100):
                if arr[m] > 1:
                    found= True
                    break
            if not found:
                return k 
            if start + 2 >= len(nums):
                return k + 1
            arr[nums[start]] -= 1
            arr[nums[start+ 1]] -= 1
            arr[nums[start+ 2]] -= 1
            start += 3
        return 100


        
```