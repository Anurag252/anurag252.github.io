---
title: "494 Target Sum"
date: "2024-12-26T08:48:35+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Target Sum](https://leetcode.com/problems/target-sum) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given an integer array nums and an integer target.
  
  You want to build an **expression** out of nums by adding one of the symbols &#39;+&#39; and &#39;-&#39; before each integer in nums and then concatenate all the integers.
  
  	For example, if nums = [2, 1], you can add a &#39;+&#39; before 2 and a &#39;-&#39; before 1 and concatenate them to build the expression &quot;+2-1&quot;.
  
  Return the number of different **expressions** that you can build, which evaluates to target.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** nums = [1,1,1,1,1], target = 3
  **Output:** 5
  **Explanation:** There are 5 ways to assign symbols to make the sum of nums be target 3.
  -1 + 1 + 1 + 1 + 1 = 3
  +1 - 1 + 1 + 1 + 1 = 3
  +1 + 1 - 1 + 1 + 1 = 3
  +1 + 1 + 1 - 1 + 1 = 3
  +1 + 1 + 1 + 1 - 1 = 3
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [1], target = 1
  **Output:** 1
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= nums.length &lt;= 20
  	0 &lt;= nums[i] &lt;= 1000
  	0 &lt;= sum(nums[i]) &lt;= 1000
  	-1000 &lt;= target &lt;= 1000
---

```python
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        
        @cache
        def recurse(s, i):
            #print(s,i)
            if i == len(nums)-1:
                if s + nums[i] == target and s - nums[i] == target:
                    return 2
                if s + nums[i] == target or s - nums[i] == target:
                    return 1
                return 0
            res = 0
            
            res = recurse(s + nums[i], i + 1)
            res += recurse(s - nums[i], i + 1)
            
            return res
        return recurse(0, 0)


```