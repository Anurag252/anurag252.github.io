---
title: "3617 Find The Original Typed String I"
date: "2025-07-01T09:33:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Find the Original Typed String I](https://leetcode.com/problems/find-the-original-typed-string-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and **may** press a key for too long, resulting in a character being typed **multiple** times.
  
  Although Alice tried to focus on her typing, she is aware that she may still have done this **at most** *once*.
  
  You are given a string word, which represents the **final** output displayed on Alice&#39;s screen.
  
  Return the total number of *possible* original strings that Alice *might* have intended to type.
  
  &nbsp;
  
  Example 1:
  
  **Input:** word = &quot;abbcccc&quot;
  
  **Output:** 5
  
  **Explanation:**
  
  The possible strings are: &quot;abbcccc&quot;, &quot;abbccc&quot;, &quot;abbcc&quot;, &quot;abbc&quot;, and &quot;abcccc&quot;.
  
  Example 2:
  
  **Input:** word = &quot;abcd&quot;
  
  **Output:** 1
  
  **Explanation:**
  
  The only possible string is &quot;abcd&quot;.
  
  Example 3:
  
  **Input:** word = &quot;aaaa&quot;
  
  **Output:** 4
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= word.length &lt;= 100
  	word consists only of lowercase English letters.
---

```python
class Solution:
    def possibleStringCount(self, word: str) -> int:
        possibility = 1
        for i, k in enumerate(word):
            if i < len(word)-1 and word[i+1] == k:
                possibility += 1
        
        return possibility

        
```