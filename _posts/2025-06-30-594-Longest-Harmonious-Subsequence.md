---
title: "594 Longest Harmonious Subsequence"
date: "2025-06-30T09:30:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Longest Harmonious Subsequence](https://leetcode.com/problems/longest-harmonious-subsequence) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  We define a harmonious array as an array where the difference between its maximum value and its minimum value is **exactly** 1.
  
  Given an integer array nums, return the length of its longest harmonious subsequence among all its possible subsequences.
  
   
  
  Example 1:
  
  **Input:** nums = [1,3,2,2,5,2,3,7]
  
  **Output:** 5
  
  **Explanation:**
  
  The longest harmonious subsequence is [3,2,2,2,3].
  
  Example 2:
  
  **Input:** nums = [1,2,3,4]
  
  **Output:** 2
  
  **Explanation:**
  
  The longest harmonious subsequences are [1,2], [2,3], and [3,4], all of which have a length of 2.
  
  Example 3:
  
  **Input:** nums = [1,1,1,1]
  
  **Output:** 0
  
  **Explanation:**
  
  No harmonic subsequence exists.
  
   
  
  **Constraints:**
  
  	1 <= nums.length <= 2 * 104
  	-109 <= nums[i] <= 109
---

```python
class Solution:
    def findLHS(self, nums: List[int]) -> int:
        """
        lhs[i] = lhs[i-1] + 1, lhs[]
        again I would like to sort, does order matter in ans ?
        no

        """

        

        nums.sort()
        
        ans = 0
        res = 0
        print(nums)
        count = 0
        mp = {}

        for k in nums:
            if k in mp:
                mp[k] += 1
            else:
                mp[k]  = 1
        print(mp)
        arr = list(set(nums))
        arr.sort()
        prev = arr[0]
        for i, k in enumerate(arr):
            print(i, k , ans, mp[prev], mp[k])
            if k - prev == 1:
                ans = max(ans, mp[prev] + mp[k])
            prev = k
        return ans

        for i, k in enumerate(nums):
            print(ans, res,  prev, count,i)
            if k - prev == 0:
                res += 1

            if k - prev == 1:
                count += 1
                res += 1
            elif k - prev > 1:
                if count > 0:
                    ans = max(ans, res)
                prev = nums[i-1]
                res = count + 1
                count = 0
        if count > 0:
            ans = max(ans, res)
        print(ans, res,  prev, count)
        return ans





        
        
        res = 0
        ans = 0
        prev = arr[0][1]
        prev_new = 0

        prev_indx = 0
        print(arr)
        for i, k in enumerate(arr):
            print(prev_new, prev, prev_indx, res, ans)
            if prev != k[1] and prev == arr[prev_new][1]:
                prev_new = i
            if k[1] - prev <= 1 and prev_indx >= k[0]:
                prev_indx = k[0]
                res += 1
            else:
                ans = max(ans, res)
                res = 0
                prev = arr[prev_new][1]
                prev_indx = k[0]
                
        return ans



        
```