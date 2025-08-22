---
title: "Make Sum Divisible By P"
date: "2024-10-03T08:49:43+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 489 ms (5.06%) | Memory: 47.1 MB (5.06%) - LeetSync"
---

```python
class Solution:
    def minSubarray(self, nums: List[int], p: int) -> int:
        prefix_sum = []
        suffix_sum = []
        temp = 0
        for k in nums:
            temp += k
            prefix_sum.append(temp%p)
            
        #prefix_sum.append(temp)

        temp = 0
        for k in nums[::-1]:
            temp += k
            suffix_sum.append(temp%p)
            
        #suffix_sum.append(temp)

        map = {}
        result = 10**5
        for idx,k in enumerate(prefix_sum):
            if k == 0:
                result = min(result, len(nums) - idx-1)
            if k in map:
                map[k].append(idx)
            else:
                map[k] = [idx]
           
        for idx,k in enumerate(suffix_sum[::-1]):
            if k == 0:
                result = min(result, idx)
            if p-k in map:
                for m in map[p-k]:
                    if m < idx:
                        result = min(result, idx-m-1)
        return result if result < 10 ** 5 else -1





        
```