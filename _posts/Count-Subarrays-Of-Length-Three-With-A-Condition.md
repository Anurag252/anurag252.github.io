---
title: "Count Subarrays Of Length Three With A Condition"
date: "2025-04-27T09:38:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 11 ms (26.53%) | Memory: 17.7 MB (74.08%) - LeetSync"
---

```python
class Solution:
    def countSubarrays(self, nums: List[int]) -> int:
        left = 0
        right = 2
        res = 0
        while(right < len(nums)):
            if 2 * (nums[left] + nums[right]) == nums[left + 1]:
                res += 1
            left += 1
            right += 1

        return res

        
```