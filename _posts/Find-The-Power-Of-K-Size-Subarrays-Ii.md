---
title: "Find The Power Of K Size Subarrays Ii"
date: "2024-11-16T11:02:50+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 184 ms (14.28%) | Memory: 33.5 MB (13.82%) - LeetSync"
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