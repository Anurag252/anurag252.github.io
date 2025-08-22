---
title: "1756 Minimum Deletions To Make String Balanced"
date: "2024-07-30T06:38:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Minimum Deletions to Make String Balanced](https://leetcode.com/problems/minimum-deletions-to-make-string-balanced) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a string s consisting only of characters 'a' and 'b'​​​​.
  
  You can delete any number of characters in s to make s **balanced**. s is **balanced** if there is no pair of indices (i,j) such that i < j and s[i] = 'b' and s[j]= 'a'.
  
  Return *the **minimum** number of deletions needed to make *s* **balanced***.
  
   
  
  Example 1:
  
  ```
  
  **Input:** s = \"aababbab\"
  **Output:** 2
  **Explanation:** You can either:
  Delete the characters at 0-indexed positions 2 and 6 (\"aababbab\" -> \"aaabbb\"), or
  Delete the characters at 0-indexed positions 3 and 6 (\"aababbab\" -> \"aabbbb\").
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"bbaaaaabb\"
  **Output:** 2
  **Explanation:** The only solution is to delete the first two characters.
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= s.length <= 105
  	s[i] is 'a' or 'b'​​.
---

```python
class Solution:
    def minimumDeletions(self, s: str) -> int:
        la = [0] * len(s)
        lb = [0] * len(s)
        i = 0
        temp = 0
        for k in s:
            la[i] = temp
            if k == 'b':
                temp += 1
            
            i += 1
        j = len(s) - 1
        temp = 0
        for k in range(len(s)):
            lb[j] = temp
            if s[len(s) -k-1] == 'a':
                temp += 1
            
            j -= 1
        
        
        result = 100000
        for k in range(len(s)):
            result = min(result, la[k] + lb[k])
        return result


        # for every a at i , find number of bs to left
        # for every b at i , find number of as to right. 
        # navigate each array one by one, 
        # we can remove any element and then all numbers to left or right reduce by 1,
        # we can remove the number altogather
        #0,0,b,1,b,b,3,0
        #a,a,2,a,1,1,a,0
        
```