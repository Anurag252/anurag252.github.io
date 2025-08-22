---
title: "3445 Lexicographically Minimum String After Removing Stars"
date: "2025-06-07T22:22:04+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Lexicographically Minimum String After Removing Stars](https://leetcode.com/problems/lexicographically-minimum-string-after-removing-stars) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a string s. It may contain any number of &#39;*&#39; characters. Your task is to remove all &#39;*&#39; characters.
  
  While there is a &#39;*&#39;, do the following operation:
  
  	Delete the leftmost &#39;*&#39; and the **smallest** non-&#39;*&#39; character to its *left*. If there are several smallest characters, you can delete any of them.
  
  Return the lexicographically smallest resulting string after removing all &#39;*&#39; characters.
  
  &nbsp;
  
  Example 1:
  
  **Input:** s = &quot;aaba*&quot;
  
  **Output:** &quot;aab&quot;
  
  **Explanation:**
  
  We should delete one of the &#39;a&#39; characters with &#39;*&#39;. If we choose s[3], s becomes the lexicographically smallest.
  
  Example 2:
  
  **Input:** s = &quot;abc&quot;
  
  **Output:** &quot;abc&quot;
  
  **Explanation:**
  
  There is no &#39;*&#39; in the string.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 105
  	s consists only of lowercase English letters and &#39;*&#39;.
  	The input is generated such that it is possible to delete all &#39;*&#39; characters.
---

```python
class Solution:
    def clearStars(self, s: str) -> str:
        arr = [0] * 26
        mp = {}
        st =[]
        for k in s:
            if k == "*":
                to_be_removed = ""
                for i, a in enumerate(arr):
                    if a > 0:
                        arr[i] -= 1
                        to_be_removed = chr(i + 97)
                        break
                
                index = mp[to_be_removed][-1]
                st[index] = "#"
                if len(mp[to_be_removed][:-1]) == 0:
                    del mp[to_be_removed]
                else:
                    mp[to_be_removed] = mp[to_be_removed][:-1]
                #print(st,mp, to_be_removed)
            else:
                st.append(k)
                if k in mp:
                    mp[k].append(len(st)-1)
                else:
                    mp[k] = [len(st)-1]
                #print(ord(k)-97)
                arr[ord(k)-97] += 1
        res = ""
        for k in st:
            if k != "#":
                res += k

        return res


        
```