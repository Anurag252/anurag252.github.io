---
title: "1502 Construct K Palindrome Strings"
date: "2025-01-11T07:30:23+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Construct K Palindrome Strings](https://leetcode.com/problems/construct-k-palindrome-strings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given a string s and an integer k, return true *if you can use all the characters in *s* to construct *k* palindrome strings or *false* otherwise*.
  
   
  
  Example 1:
  
  ```
  
  **Input:** s = \"annabelle\", k = 2
  **Output:** true
  **Explanation:** You can construct two palindromes using all characters in s.
  Some possible constructions \"anna\" + \"elble\", \"anbna\" + \"elle\", \"anellena\" + \"b\"
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"leetcode\", k = 3
  **Output:** false
  **Explanation:** It is impossible to construct 3 palindromes using all the characters of s.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** s = \"true\", k = 4
  **Output:** true
  **Explanation:** The only possible solution is to put each character in a separate string.
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= s.length <= 105
  	s consists of lowercase English letters.
  	1 <= k <= 105
---

```python
class Solution:
    def canConstruct(self, s: str, k: int) -> bool:

        dt = {}
        count_one = 0
        for m in s:
            if m not in dt:
                dt[m] = 0
            dt[m] += 1
        
        for v in dt.values():
            if v % 2 == 1:
                count_one += 1
        
        if k > len(s) or k - count_one < 0:
            return False
        return True

        
```