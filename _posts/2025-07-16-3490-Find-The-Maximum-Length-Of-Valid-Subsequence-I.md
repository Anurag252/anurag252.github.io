---
title: "3490 Find The Maximum Length Of Valid Subsequence I"
date: "2025-07-16T09:18:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Find the Maximum Length of Valid Subsequence I](https://leetcode.com/problems/find-the-maximum-length-of-valid-subsequence-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)You are given an integer array nums.
  
  A subsequence sub of nums with length x is called **valid** if it satisfies:
  
  	(sub[0] + sub[1]) % 2 == (sub[1] + sub[2]) % 2 == ... == (sub[x - 2] + sub[x - 1]) % 2.
  
  Return the length of the **longest** **valid** subsequence of nums.
  
  A **subsequence** is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.
  
   
  
  Example 1:
  
  **Input:** nums = [1,2,3,4]
  
  **Output:** 4
  
  **Explanation:**
  
  The longest valid subsequence is [1, 2, 3, 4].
  
  Example 2:
  
  **Input:** nums = [1,2,1,1,2,1,2]
  
  **Output:** 6
  
  **Explanation:**
  
  The longest valid subsequence is [1, 2, 1, 2, 1, 2].
  
  Example 3:
  
  **Input:** nums = [1,3]
  
  **Output:** 2
  
  **Explanation:**
  
  The longest valid subsequence is [1, 3].
  
   
  
  **Constraints:**
  
  	2 <= nums.length <= 2 * 105
  	1 <= nums[i] <= 107
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