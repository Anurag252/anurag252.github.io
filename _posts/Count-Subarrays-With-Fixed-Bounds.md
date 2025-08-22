---
title: "Count Subarrays With Fixed Bounds"
date: "2025-04-26T13:13:50+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 143 ms (71.73%) | Memory: 29.4 MB (7.60%) - LeetSync"
---

```python
class Solution:
    def countSubarrays(self, nums: List[int], minK: int, maxK: int) -> int:
        # consider the elements mark min and max
        # also mark lower and upper numbers as 0  
        # now we need sub arrays that include min amd max - a....b...c...d -> d - a 
        # other possibility is a .... b ....d....c -? no subarray 
        for i, k in enumerate(nums):
            if k < minK or k > maxK:
                nums[i] = 0

        left = 0
        right = 0
        founda = -1  # Index of last minK
        foundb = -1  # Index of last maxK
        res = 0
        nums = [0] + nums + [0]  # Add boundary zeros

        for i in range(len(nums)):
            if nums[i] == 0:
                left = i
                founda = -1
                foundb = -1
            else:
                if nums[i] == minK:
                    founda = i
                if nums[i] == maxK:
                    foundb = i
                if founda != -1 and foundb != -1:
                    res += min(founda, foundb) - left

        return res
        

            

            

            

        
```