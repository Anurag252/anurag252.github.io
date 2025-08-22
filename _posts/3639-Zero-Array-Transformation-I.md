---
title: "3639 Zero Array Transformation I"
date: "2025-05-21T07:59:04+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Zero Array Transformation I](https://leetcode.com/problems/zero-array-transformation-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given an integer array nums of length n and a 2D array queries, where queries[i] = [li, ri].
  
  For each queries[i]:
  
  	Select a subset of indices within the range [li, ri] in nums.
  	Decrement the values at the selected indices by 1.
  
  A **Zero Array** is an array where all elements are equal to 0.
  
  Return true if it is *possible* to transform nums into a **Zero Array **after processing all the queries sequentially, otherwise return false.
  
  &nbsp;
  
  Example 1:
  
  **Input:** nums = [1,0,1], queries = [[0,2]]
  
  **Output:** true
  
  **Explanation:**
  
  	**For i = 0:**
  
  		Select the subset of indices as [0, 2] and decrement the values at these indices by 1.
  		The array will become [0, 0, 0], which is a Zero Array.
  
  Example 2:
  
  **Input:** nums = [4,3,2,1], queries = [[1,3],[0,2]]
  
  **Output:** false
  
  **Explanation:**
  
  	**For i = 0:**
  
  		Select the subset of indices as [1, 2, 3] and decrement the values at these indices by 1.
  		The array will become [4, 2, 1, 0].
  
  	**For i = 1:**
  
  		Select the subset of indices as [0, 1, 2] and decrement the values at these indices by 1.
  		The array will become [3, 1, 0, 0], which is not a Zero Array.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= nums.length &lt;= 105
  	0 &lt;= nums[i] &lt;= 105
  	1 &lt;= queries.length &lt;= 105
  	queries[i].length == 2
  	0 &lt;= li &lt;= ri &lt; nums.length
---

```python
class Solution:
    def isZeroArray(self, nums: List[int], queries: List[List[int]]) -> bool:
        """
        every element has x numbers of reductions 
        to find the number of reductions, process all elements and find the number of reductions
        it will be slow if we just apply the chnages one by one
        another way could be put -1 at the start and + 1 at the end

        """
        arr = [0] * len(nums)

        for k in queries:
            arr[k[0]] += 1
            if k[1] + 1 < len(nums):
                arr[k[1] + 1] -= 1
            

        subs = 0
        for i , k in enumerate(nums):
            subs += arr[i]
            if nums[i] != 0:
                nums[i] -= min(nums[i], subs)
            
            
        print(nums, arr)
        for k in nums:
            if k != 0:
                return False
        return True
            

```