---
title: "3629 Total Characters In String After Transformations I"
date: "2025-05-13T23:00:56+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Total Characters in String After Transformations I](https://leetcode.com/problems/total-characters-in-string-after-transformations-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a string s and an integer t, representing the number of **transformations** to perform. In one **transformation**, every character in s is replaced according to the following rules:
  
  	If the character is &#39;z&#39;, replace it with the string &quot;ab&quot;.
  	Otherwise, replace it with the **next** character in the alphabet. For example, &#39;a&#39; is replaced with &#39;b&#39;, &#39;b&#39; is replaced with &#39;c&#39;, and so on.
  
  Return the **length** of the resulting string after **exactly** t transformations.
  
  Since the answer may be very large, return it **modulo** 109 + 7.
  
  &nbsp;
  
  Example 1:
  
  **Input:** s = &quot;abcyy&quot;, t = 2
  
  **Output:** 7
  
  **Explanation:**
  
  	**First Transformation (t = 1)**:
  
  		&#39;a&#39; becomes &#39;b&#39;
  		&#39;b&#39; becomes &#39;c&#39;
  		&#39;c&#39; becomes &#39;d&#39;
  		&#39;y&#39; becomes &#39;z&#39;
  		&#39;y&#39; becomes &#39;z&#39;
  		String after the first transformation: &quot;bcdzz&quot;
  
  	**Second Transformation (t = 2)**:
  
  		&#39;b&#39; becomes &#39;c&#39;
  		&#39;c&#39; becomes &#39;d&#39;
  		&#39;d&#39; becomes &#39;e&#39;
  		&#39;z&#39; becomes &quot;ab&quot;
  		&#39;z&#39; becomes &quot;ab&quot;
  		String after the second transformation: &quot;cdeabab&quot;
  
  	**Final Length of the string**: The string is &quot;cdeabab&quot;, which has 7 characters.
  
  Example 2:
  
  **Input:** s = &quot;azbk&quot;, t = 1
  
  **Output:** 5
  
  **Explanation:**
  
  	**First Transformation (t = 1)**:
  
  		&#39;a&#39; becomes &#39;b&#39;
  		&#39;z&#39; becomes &quot;ab&quot;
  		&#39;b&#39; becomes &#39;c&#39;
  		&#39;k&#39; becomes &#39;l&#39;
  		String after the first transformation: &quot;babcl&quot;
  
  	**Final Length of the string**: The string is &quot;babcl&quot;, which has 5 characters.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 105
  	s consists only of lowercase English letters.
  	1 &lt;= t &lt;= 105
---

```python
class Solution:
    def lengthAfterTransformations(self, s: str, t: int) -> int:
        mod = 10**9 + 7
        cnt = [0] * 26
        for ch in s:
            cnt[ord(ch) - ord("a")] += 1
        for round in range(t):
            nxt = [0] * 26
            nxt[0] = cnt[25]
            nxt[1] = (cnt[25] + cnt[0]) % mod
            for i in range(2, 26):
                nxt[i] = cnt[i - 1]
            cnt = nxt
        ans = sum(cnt) % mod
        return ans
```