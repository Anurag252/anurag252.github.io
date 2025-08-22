---
title: "1298 Reverse Substrings Between Each Pair Of Parentheses"
date: "2024-07-11T06:41:17+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Reverse Substrings Between Each Pair of Parentheses](https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a string s that consists of lower case English letters and brackets.
  
  Reverse the strings in each pair of matching parentheses, starting from the innermost one.
  
  Your result should **not** contain any brackets.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** s = \"(abcd)\"
  **Output:** \"dcba\"
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"(u(love)i)\"
  **Output:** \"iloveu\"
  **Explanation:** The substring \"love\" is reversed first, then the whole string is reversed.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** s = \"(ed(et(oc))el)\"
  **Output:** \"leetcode\"
  **Explanation:** First, we reverse the substring \"oc\", then \"etco\", and finally, the whole string.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 2000
  	s only contains lower case English characters and parentheses.
  	It is guaranteed that all parentheses are balanced.
---

```python
class Solution:
    def reverseParentheses(self, s: str) -> str:
        stack = deque()
        for k in s:
            
            if k == ")":
                ls = []
                found = False
                while not found:
                    ls.append(stack.pop())
                    if ls[-1] == "(":
                        found = True
                del ls[-1]
                
                for v in ls:
                    stack.append(v)

            else:
                stack.append(k)
        return ''.join(stack)


```