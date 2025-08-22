---
title: "957 Minimum Add To Make Parentheses Valid"
date: "2024-10-09T07:24:07+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Minimum Add to Make Parentheses Valid](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  A parentheses string is valid if and only if:
  
  	It is the empty string,
  	It can be written as AB (A concatenated with B), where A and B are valid strings, or
  	It can be written as (A), where A is a valid string.
  
  You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.
  
  	For example, if s = &quot;()))&quot;, you can insert an opening parenthesis to be &quot;(**(**)))&quot; or a closing parenthesis to be &quot;())**)**)&quot;.
  
  Return *the minimum number of moves required to make *s* valid*.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** s = \"())\"
  **Output:** 1
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"(((\"
  **Output:** 3
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 1000
  	s[i] is either &#39;(&#39; or &#39;)&#39;.
---

```python
class Solution:
    def minAddToMakeValid(self, s: str) -> int:
        arr = []
        for k in s:
            if k == ")" and len(arr) > 0 and  arr[-1] == "(":
                arr.pop()
            else:
                arr.append(k)
        return len(arr)
                

    #"()))(("

```