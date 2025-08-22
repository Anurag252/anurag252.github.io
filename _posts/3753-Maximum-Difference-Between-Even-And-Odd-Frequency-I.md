---
title: "3753 Maximum Difference Between Even And Odd Frequency I"
date: "2025-06-10T06:54:45+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Difference Between Even and Odd Frequency I](https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  You are given a string s consisting of lowercase English letters. 
  
  Your task is to find the **maximum** difference diff = a1 - a2 between the frequency of characters a1 and a2 in the string such that:
  
  	a1 has an **odd frequency** in the string.
  	a2 has an **even frequency** in the string.
  
  Return this **maximum** difference.
  
  &nbsp;
  
  Example 1:
  
  **Input:** s = &quot;aaaaabbc&quot;
  
  **Output:** 3
  
  **Explanation:**
  
  	The character &#39;a&#39; has an **odd frequency** of 5, and &#39;b&#39; has an **even frequency** of 2.
  	The maximum difference is 5 - 2 = 3.
  
  Example 2:
  
  **Input:** s = &quot;abcabcab&quot;
  
  **Output:** 1
  
  **Explanation:**
  
  	The character &#39;a&#39; has an **odd frequency** of 3, and &#39;c&#39; has an **even frequency** of 2.
  	The maximum difference is 3 - 2 = 1.
  
  &nbsp;
  
  **Constraints:**
  
  	3 &lt;= s.length &lt;= 100
  	s consists only of lowercase English letters.
  	s contains at least one character with an odd frequency and one with an even frequency.
---

```python
class Solution:
    def maxDifference(self, s: str) -> int:
        mp = {}

        for k in s:
            if k not in mp:
                mp[k] = 0
            mp[k] += 1
        even = 100000
        odd = 0
        for k, v in mp.items():
            if v % 2 == 0:
                even = min(even, v)
            else:
                odd = max(odd, v)
        return odd - even

        
```