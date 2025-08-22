---
title: "632 Smallest Range Covering Elements From K Lists"
date: "2024-10-13T08:42:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Smallest Range Covering Elements from K Lists](https://leetcode.com/problems/smallest-range-covering-elements-from-k-lists) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  You have k lists of sorted integers in **non-decreasing order**. Find the **smallest** range that includes at least one number from each of the k lists.
  
  We define the range [a, b] is smaller than range [c, d] if b - a < d - c **or** a < c if b - a == d - c.
  
   
  
  Example 1:
  
  ```
  
  **Input:** nums = [[4,10,15,24,26],[0,9,12,20],[5,18,22,30]]
  **Output:** [20,24]
  **Explanation: **
  List 1: [4, 10, 15, 24,26], 24 is in range [20,24].
  List 2: [0, 9, 12, 20], 20 is in range [20,24].
  List 3: [5, 18, 22, 30], 22 is in range [20,24].
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [[1,2,3],[1,2,3],[1,2,3]]
  **Output:** [1,1]
  
  ```
  
   
  
  **Constraints:**
  
  	nums.length == k
  	1 <= k <= 3500
  	1 <= nums[i].length <= 50
  	-105 <= nums[i][j] <= 105
  	nums[i] is sorted in **non-decreasing** order.
---

```python
from typing import List
import collections

class Solution:
    def smallestRange(self, nums: List[List[int]]) -> List[int]:
        arr = []
        for idx, sublist in enumerate(nums):
            for num in sublist:
                arr.append((num, idx))

        arr.sort()
        count = collections.Counter()
        left = 0
        result = [-10**5, 10**5]
        unique_count = 0

        for right in range(len(arr)):
            num, idx = arr[right]
            count[idx] += 1
            if count[idx] == 1:
                unique_count += 1

            while unique_count == len(nums):
                left_num, left_idx = arr[left]
                # Update result if the current range is smaller
                if num - left_num < result[1] - result[0]:
                    result = [left_num, num]

                # Decrease the count for the left element and move left pointer
                count[left_idx] -= 1
                if count[left_idx] == 0:
                    unique_count -= 1
                left += 1

        return result

```