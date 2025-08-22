---
title: "Find The Power Of K Size Subarrays I"
date: "2024-11-16T10:59:48+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 16.9 MB (21.46%) - LeetSync"
---

```python
class Solution:
    def resultsArray(self, nums: List[int], k: int) -> List[int]:

        left = 0
        right = 1
        result = []
        prev = False
        count = 1
        if len(nums) == 1:
            return nums

        if k == 1:
            return nums
        while(right < len(nums)):
            if nums[right] == nums[right-1] + 1:
                count += 1
                if count == k:
                    left += 1
                    count -= 1
                    result.append(nums[right])
            else:
                for a in range(0, right - left):
                    #print(a)
                    result.append(-1)
                left = right
                count = 1
            
            right += 1
        return result[:len(nums) - k + 1]








        
```