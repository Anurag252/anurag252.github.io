---
title: "Minimum Equal Sum Of Two Arrays After Replacing Zeros"
date: "2025-05-10T22:20:08+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 852 ms (58.72%) | Memory: 34.8 MB (82.55%) - LeetSync"
---

```python
class Solution:
    def minSum(self, nums1: List[int], nums2: List[int]) -> int:
        
        num_of_zeros_a = 0
        num_of_zeros_b = 0

        for k in nums1:
            if k == 0:
                num_of_zeros_a += 1

        for k in nums2:
            if k == 0:
                num_of_zeros_b += 1

        """
            its not possible if one side is > and other side does not have 0
        """
        if num_of_zeros_b == 0 and num_of_zeros_a == 0 and sum(nums1) != sum(nums2):
            return -1
        
        if sum(nums1) + num_of_zeros_a > sum(nums2) + num_of_zeros_b:
            if num_of_zeros_b == 0 and num_of_zeros_a > 0:
                return -1
            return sum(nums1) + num_of_zeros_a
        else:
            if num_of_zeros_a == 0 and num_of_zeros_b > 0:
                return -1
            return sum(nums2) + num_of_zeros_b


        
```