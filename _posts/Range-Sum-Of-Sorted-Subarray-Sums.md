---
title: "Range Sum Of Sorted Subarray Sums"
date: "2024-08-04T05:18:36+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 240 ms (43.36%) | Memory: 39.8 MB (60.62%) - LeetSync"
---

```python
class Solution:
    def rangeSum(self, nums: List[int], n: int, left: int, right: int) -> int:
        i = 0
        j = 0
        arr = []
        while i < len(nums):
            j = i
            sum1 = 0
            while j < len(nums):
                sum1 += nums[j]
                arr.append(sum1)
                j += 1
            i += 1
        
        arr.sort()
        k = arr[left-1:right]
        x = sum(k)
        return x %  (pow(10,9) + 7)




        
```