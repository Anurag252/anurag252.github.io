---
title: "3621 Minimum Operations To Make Array Values Equal To K"
date: "2025-04-09T14:02:58+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Minimum Operations to Make Array Values Equal to K](https://leetcode.com/problems/minimum-operations-to-make-array-values-equal-to-k) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  You are given an integer array nums and an integer k.
  
  An integer h is called **valid** if all values in the array that are **strictly greater** than h are *identical*.
  
  For example, if nums = [10, 8, 10, 8], a **valid** integer is h = 9 because all nums[i] > 9 are equal to 10, but 5 is not a **valid** integer.
  
  You are allowed to perform the following operation on nums:
  
  	Select an integer h that is *valid* for the **current** values in nums.
  	For each index i where nums[i] > h, set nums[i] to h.
  
  Return the **minimum** number of operations required to make every element in nums **equal** to k. If it is impossible to make all elements equal to k, return -1.
  
   
  
  Example 1:
  
  **Input:** nums = [5,2,5,4,5], k = 2
  
  **Output:** 2
  
  **Explanation:**
  
  The operations can be performed in order using valid integers 4 and then 2.
  
  Example 2:
  
  **Input:** nums = [2,1,2], k = 2
  
  **Output:** -1
  
  **Explanation:**
  
  It is impossible to make all the values equal to 2.
  
  Example 3:
  
  **Input:** nums = [9,7,5,3], k = 1
  
  **Output:** 4
  
  **Explanation:**
  
  The operations can be performed using valid integers in the order 7, 5, 3, and 1.
  
   
  
  **Constraints:**
  
  	1 <= nums.length <= 100 
  	1 <= nums[i] <= 100
  	1 <= k <= 100
---

```python
class Solution:
    def minOperations(self, nums: List[int], k: int) -> int:
        # keep fetching the largest elements and keep changing them to 
        # h
        # at the end res is num of unique elements > k

        s = set(nums)
        count = 0
        c = 0
        if k > min(nums):
            return -1
        for m in nums:
            if m == k:
                c += 1
        if c == len(nums):
            return 0

        for m in s:
            if m > k:
                count += 1
            
            
       
        return count if count > 0 else -1

        
```