---
title: "Divide Array Into Arrays With Max Difference"
date: "2025-06-18T16:04:44+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 99 ms (19.83%) | Memory: 33.5 MB (12.24%) - LeetSync"
---

```python
class Solution:
    def divideArray(self, nums: List[int], k: int) -> List[List[int]]:
        """
        a sorted array will be most closely fit

        """
        n = len(nums)
        nums.sort()
        res = []
        mul = 0
        for k1 in range(0, n//3):
            arr = []
            for m in range(0,3):
                arr.append(nums[mul + m])
            if arr[-1] - arr[0] > k:
                return []
            res.append(arr)
            mul += 3
        return res

        
```