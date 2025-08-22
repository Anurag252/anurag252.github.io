---
title: "2891 Maximum Beauty Of An Array After Applying Operation"
date: "2024-12-11T09:00:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Beauty of an Array After Applying Operation](https://leetcode.com/problems/maximum-beauty-of-an-array-after-applying-operation) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a **0-indexed** array nums and a **non-negative** integer k.
  
  In one operation, you can do the following:
  
  	Choose an index i that **hasn&#39;t been chosen before** from the range [0, nums.length - 1].
  	Replace nums[i] with any integer from the range [nums[i] - k, nums[i] + k].
  
  The **beauty** of the array is the length of the longest subsequence consisting of equal elements.
  
  Return *the **maximum** possible beauty of the array *nums* after applying the operation any number of times.*
  
  **Note** that you can apply the operation to each index **only once**.
  
  A&nbsp;**subsequence** of an array is a new array generated from the original array by deleting some elements (possibly none) without changing the order of the remaining elements.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** nums = [4,6,1,2], k = 2
  **Output:** 3
  **Explanation:** In this example, we apply the following operations:
  - Choose index 1, replace it with 4 (from range [4,8]), nums = [4,4,1,2].
  - Choose index 3, replace it with 4 (from range [0,4]), nums = [4,4,1,4].
  After the applied operations, the beauty of the array nums is 3 (subsequence consisting of indices 0, 1, and 3).
  It can be proven that 3 is the maximum possible length we can achieve.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [1,1,1,1], k = 10
  **Output:** 4
  **Explanation:** In this example we don't have to apply any operations.
  The beauty of the array nums is 4 (whole array).
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= nums.length &lt;= 105
  	0 &lt;= nums[i], k &lt;= 105
---

```python
class Solution:
    def maximumBeauty(self, nums: List[int], k: int) -> int:

        arr = []

        for m in nums:
            arr.append((m-k,m+k))
        arr.sort(key=lambda x: x[0])
        #print(arr)

        res = 0
        for idx,m in enumerate(arr):
            left = idx
            right = len(arr)-1
            while(left < right):
                mid = ceil((left + right) / 2)
                #print(left, right, mid)
                if arr[mid][0] <= m[1] :
                    left = mid
                else :
                    right = mid -1
            res = max(res, left - idx + 1)
            #print(res)
        return res


        
```