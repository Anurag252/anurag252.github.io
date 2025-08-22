---
title: "2144 Maximum Difference Between Increasing Elements"
date: "2025-06-16T11:37:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Difference Between Increasing Elements](https://leetcode.com/problems/maximum-difference-between-increasing-elements) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Given a **0-indexed** integer array nums of size n, find the **maximum difference** between nums[i] and nums[j] (i.e., nums[j] - nums[i]), such that 0 &lt;= i &lt; j &lt; n and nums[i] &lt; nums[j].
  
  Return *the **maximum difference**. *If no such i and j exists, return -1.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** nums = [7,**1**,**5**,4]
  **Output:** 4
  **Explanation:**
  The maximum difference occurs with i = 1 and j = 2, nums[j] - nums[i] = 5 - 1 = 4.
  Note that with i = 1 and j = 0, the difference nums[j] - nums[i] = 7 - 1 = 6, but i > j, so it is not valid.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [9,4,3,2]
  **Output:** -1
  **Explanation:**
  There is no i and j such that i < j and nums[i] < nums[j].
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** nums = [**1**,5,2,**10**]
  **Output:** 9
  **Explanation:**
  The maximum difference occurs with i = 0 and j = 3, nums[j] - nums[i] = 10 - 1 = 9.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	n == nums.length
  	2 &lt;= n &lt;= 1000
  	1 &lt;= nums[i] &lt;= 109
---

```python
class Solution:
    def maximumDifference(self, nums: List[int]) -> int:
        min_arr =[]
        max_arr = []
        min_till_here = 10000000000
        max_till_here = 0
        for k in nums:
            min_till_here = min(k, min_till_here)
            min_arr.append(min_till_here)
            
        
        for k in nums[::-1]:
            max_till_here = max(k, max_till_here)
            max_arr.append(max_till_here)


        ans = -1
        for k1, k2 in zip(min_arr, max_arr[::-1]):
            if k2 > k1:
                ans = max(ans, k2-k1)
        return ans


```