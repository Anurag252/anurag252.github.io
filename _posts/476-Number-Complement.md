---
title: "476 Number Complement"
date: "2024-08-22T06:57:53+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Number Complement](https://leetcode.com/problems/number-complement) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  The **complement** of an integer is the integer you get when you flip all the 0&#39;s to 1&#39;s and all the 1&#39;s to 0&#39;s in its binary representation.
  
  	For example, The integer 5 is &quot;101&quot; in binary and its **complement** is &quot;010&quot; which is the integer 2.
  
  Given an integer num, return *its complement*.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** num = 5
  **Output:** 2
  **Explanation:** The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** num = 1
  **Output:** 0
  **Explanation:** The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= num &lt; 231
  
  &nbsp;
  
  **Note:** This question is the same as 1009: [https://leetcode.com/problems/complement-of-base-10-integer/](https://leetcode.com/problems/complement-of-base-10-integer/)
---

```python
class Solution:
    def findComplement(self, num: int) -> int:
        result = 0
        i = 0
        while num > 0:
            t = num & 1
            num = num >> 1
            t = not t
            for k in range(i):
                t = t << 1
            result = result | t
            i += 1
        return result


        
```