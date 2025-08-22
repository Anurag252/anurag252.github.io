---
title: "2394 Count Subarrays With Score Less Than K"
date: "2025-04-29T08:28:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Count Subarrays With Score Less Than K](https://leetcode.com/problems/count-subarrays-with-score-less-than-k) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  The **score** of an array is defined as the **product** of its sum and its length.
  
  	For example, the score of [1, 2, 3, 4, 5] is (1 + 2 + 3 + 4 + 5) * 5 = 75.
  
  Given a positive integer array nums and an integer k, return *the **number of non-empty subarrays** of* nums *whose score is **strictly less** than* k.
  
  A **subarray** is a contiguous sequence of elements within an array.
  
   
  
  Example 1:
  
  ```
  
  **Input:** nums = [2,1,4,3,5], k = 10
  **Output:** 6
  **Explanation:**
  The 6 subarrays having scores less than 10 are:
  - [2] with score 2 * 1 = 2.
  - [1] with score 1 * 1 = 1.
  - [4] with score 4 * 1 = 4.
  - [3] with score 3 * 1 = 3. 
  - [5] with score 5 * 1 = 5.
  - [2,1] with score (2 + 1) * 2 = 6.
  Note that subarrays such as [1,4] and [4,3,5] are not considered because their scores are 10 and 36 respectively, while we need scores strictly less than 10.
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [1,1,1], k = 5
  **Output:** 5
  **Explanation:**
  Every subarray except [1,1,1] has a score less than 5.
  [1,1,1] has a score (1 + 1 + 1) * 3 = 9, which is greater than 5.
  Thus, there are 5 subarrays having scores less than 5.
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= nums.length <= 105
  	1 <= nums[i] <= 105
  	1 <= k <= 1015
---

```python
class Solution:
    def countSubarrays(self, nums: List[int], k: int) -> int:

        left = 0
        s = sum(nums)
        total = 0
        res = 0
        right = 0

        while(left < len(nums)):
            while right < len(nums) and (total + nums[right]) * (right - left + 1) < k:
                total += nums[right]
                right += 1

            # After expansion, [left, right-1] are all valid
            res += right - left

            # Move left forward
            total -= nums[left]
            left += 1
        return res

        



        right = len(nums) - 1
        
        while(left < len(nums)):
            if s * (right - left + 1) >= k: # still large
                s -= nums[right]
                right -= 1
                if right < 0:
                    left += 1
                    s = left
                    right = left
            else:
                # found max < k

                res += right - left + 1 # nums of subarray
                s -= nums[left]
                left += 1
                while(s * (right - left + 1) <= k and right < len(nums)-1):
                    right += 1
                    s += nums[right]
        return res


        
```