---
title: "689 Maximum Sum Of 3 Non Overlapping Subarrays"
date: "2024-12-28T12:21:54+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Sum of 3 Non-Overlapping Subarrays](https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  Given an integer array nums and an integer k, find three non-overlapping subarrays of length k with maximum sum and return them.
  
  Return the result as a list of indices representing the starting position of each interval (**0-indexed**). If there are multiple answers, return the lexicographically smallest one.
  
   
  
  Example 1:
  
  ```
  
  **Input:** nums = [1,2,1,2,6,7,5,1], k = 2
  **Output:** [0,3,5]
  **Explanation:** Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
  We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [1,2,1,2,1,2,1,2,1], k = 2
  **Output:** [0,2,4]
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= nums.length <= 2 * 104
  	1 <= nums[i] < 216
  	1 <= k <= floor(nums.length / 3)
---

```python
from typing import List

class Solution:
    def maxSumOfThreeSubarrays(self, nums: List[int], k: int) -> List[int]:
        # Step 1: Calculate the sums of all subarrays of size k
        n = len(nums)
        h = [0] * (n - k + 1)
        curr_sum = sum(nums[:k])
        h[0] = curr_sum
        for i in range(k, n):
            curr_sum += nums[i] - nums[i - k]
            h[i - k + 1] = curr_sum
        
        # Step 2: DP to find max sums for 1, 2, and 3 subarrays
        dp = [[0] * 4 for _ in range(len(h) + 1)]
        idx = [[-1] * 4 for _ in range(len(h) + 1)]
        
        for i in range(1, len(h) + 1):
            for j in range(1, 4):
                # Don't take the current subarray
                if dp[i - 1][j] >= dp[i - k][j - 1] + h[i - 1]:
                    dp[i][j] = dp[i - 1][j]
                    idx[i][j] = idx[i - 1][j]
                else:
                    # Take the current subarray
                    dp[i][j] = dp[i - k][j - 1] + h[i - 1]
                    idx[i][j] = i - 1
        
        # Step 3: Backtrack to find the indices
        result = []
        j = 3
        i = len(h)
        while j > 0:
            if idx[i][j] != -1:
                result.append(idx[i][j])
                i = idx[i][j] - k + 1
            j -= 1
        
        return result[::-1]


"""
        T[i,3] = max(T[i-k,2] + S[i], T[i-1, 3]) 
        T[i,2] = (T[i-k]+ s[i], T[i-1, 2])
        T[i] = max(T[i-1] , S[i])
        """


        
```