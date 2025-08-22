---
title: "Type Of Triangle"
date: "2025-05-19T21:43:43+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.7 MB (80.13%) - LeetSync"
---

```python
class Solution:
    def triangleType(self, nums: List[int]) -> str:
        nums.sort()
        if nums[0] + nums[1] <= nums[2]:
            return "none"

        if nums[0] == nums[1] == nums[2]:
            return "equilateral"

        if nums[0] == nums[1] or nums[1] == nums[2] or nums[0] == nums[2]:
            return "isosceles"

        return "scalene"
        
```