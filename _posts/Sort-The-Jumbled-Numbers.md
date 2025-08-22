---
title: "Sort The Jumbled Numbers"
date: "2024-07-24T06:23:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 883 ms (86.96%) | Memory: 23 MB (76.63%) - LeetSync"
---

```python
class Solution:
    def sortJumbled(self, mapping: List[int], nums: List[int]) -> List[int]:

        def srt(x):
            result = 0
            mul = 1
            if x == 0:
                return mapping[0]
            while x > 0:
                y = x%10
                result = result + mul*mapping[y]
                mul = mul * 10
                x = int(x /10)
            return result
        nums=sorted(nums,reverse=False, key=srt)
        return nums
            

        
```