---
title: "2704 Maximum Difference By Remapping A Digit"
date: "2025-06-14T08:38:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Difference by Remapping a Digit](https://leetcode.com/problems/maximum-difference-by-remapping-a-digit) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  You are given an integer num. You know that Bob will sneakily **remap** one of the 10 possible digits (0 to 9) to another digit.
  
  Return *the difference between the maximum and minimum&nbsp;values Bob can make by remapping&nbsp;**exactly** **one** digit in *num.
  
  **Notes:**
  
  	When Bob remaps a digit d1&nbsp;to another digit d2, Bob replaces all occurrences of d1&nbsp;in num&nbsp;with d2.
  	Bob can remap a digit to itself, in which case num&nbsp;does not change.
  	Bob can remap different digits for obtaining minimum and maximum values respectively.
  	The resulting number after remapping can contain leading zeroes.
  
  &nbsp;
  
  **Example 1:**
  
  ```
  
  **Input:** num = 11891
  **Output:** 99009
  **Explanation:** 
  To achieve the maximum value, Bob can remap the digit 1 to the digit 9 to yield 99899.
  To achieve the minimum value, Bob can remap the digit 1 to the digit 0, yielding 890.
  The difference between these two numbers is 99009.
  
  ```
  
  **Example 2:**
  
  ```
  
  **Input:** num = 90
  **Output:** 99
  **Explanation:**
  The maximum value that can be returned by the function is 99 (if 0 is replaced by 9) and the minimum value that can be returned by the function is 0 (if 9 is replaced by 0).
  Thus, we return 99.
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= num &lt;= 108
---

```python
class Solution:
    def minMaxDifference(self, num: int) -> int:
        first = 0
        last = 0
        t = str(num)
        print(t.split())
        for i, k in enumerate(list(t)):
            if k != '9':
                first = k
                break
        newnum = []
        newnum1 = []
        for i, k in enumerate(list(t)):
            if k == first:
                newnum.append('9')
            else:
                newnum.append(k)
        last = t[0]
        for i, k in enumerate(list(t)):
            if k == last:
                newnum1.append('0')
            else:
                newnum1.append(k)
        #print(newnum, first, newnum1)
        return int("".join(newnum)) - int("".join(newnum1))





        
```