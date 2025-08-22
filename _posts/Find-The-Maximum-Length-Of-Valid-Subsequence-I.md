---
title: "Find The Maximum Length Of Valid Subsequence I"
date: "2025-07-16T09:18:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 65 ms (59.69%) | Memory: 39.2 MB (33.33%) - LeetSync"
---

```python
class Solution:
    def maximumLength(self, nums: List[int]) -> int:
        """
        only two possibilities -
        sum is either odd or even
        T[n] = T[n-i] + 1 , if a[n-i] + a[n] == k[n-i]
        what if find two sequences 
        sum all odds and sum all evens
        odd sum is achieved if one number is odd and other even 
        even is achived if both are even or both are odd
        idea is 
        for odd :- if curr is odd find next even , and vice versa
        for even :- if curr is even find next odd
        """

        odd_sum = 0
        even_sum = 0
        curr_even = True
        curr_odd = True

        for k in nums:
            if curr_odd and k % 2 == 0:
                odd_sum += 1

            if curr_even and k % 2 == 1:
                odd_sum += 1
            if k % 2 == 0:
                curr_even = True
                curr_odd = False
            else:
                curr_odd = True
                curr_even = False
                # current is even

        curr_even = 0
        curr_odd = 0
        temp = 0
        for k in nums:
            if k % 2 == 0:
                curr_even += 1
            else:
                curr_odd += 1
        even_sum = max(curr_even, curr_odd)
        return max(odd_sum, even_sum)
```