---
title: "1058 Lexicographically Smallest Equivalent String"
date: "2025-06-05T23:08:33+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Lexicographically Smallest Equivalent String](https://leetcode.com/problems/lexicographically-smallest-equivalent-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given two strings of the same length s1 and s2 and a string baseStr.
  
  We say s1[i] and s2[i] are equivalent characters.
  
  	For example, if s1 = &quot;abc&quot; and s2 = &quot;cde&quot;, then we have &#39;a&#39; == &#39;c&#39;, &#39;b&#39; == &#39;d&#39;, and &#39;c&#39; == &#39;e&#39;.
  
  Equivalent characters follow the usual rules of any equivalence relation:
  
  	**Reflexivity:** &#39;a&#39; == &#39;a&#39;.
  	**Symmetry:** &#39;a&#39; == &#39;b&#39; implies &#39;b&#39; == &#39;a&#39;.
  	**Transitivity:** &#39;a&#39; == &#39;b&#39; and &#39;b&#39; == &#39;c&#39; implies &#39;a&#39; == &#39;c&#39;.
  
  For example, given the equivalency information from s1 = &quot;abc&quot; and s2 = &quot;cde&quot;, &quot;acd&quot; and &quot;aab&quot; are equivalent strings of baseStr = &quot;eed&quot;, and &quot;aab&quot; is the lexicographically smallest equivalent string of baseStr.
  
  Return *the lexicographically smallest equivalent string of *baseStr* by using the equivalency information from *s1* and *s2.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** s1 = \"parker\", s2 = \"morris\", baseStr = \"parser\"
  **Output:** \"makkek\"
  **Explanation:** Based on the equivalency information in s1 and s2, we can group their characters as [m,p], [a,o], [k,r,s], [e,i].
  The characters in each group are equivalent and sorted in lexicographical order.
  So the answer is \"makkek\".
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s1 = \"hello\", s2 = \"world\", baseStr = \"hold\"
  **Output:** \"hdld\"
  **Explanation: **Based on the equivalency information in s1 and s2, we can group their characters as [h,w], [d,e,o], [l,r].
  So only the second letter 'o' in baseStr is changed to 'd', the answer is \"hdld\".
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** s1 = \"leetcode\", s2 = \"programs\", baseStr = \"sourcecode\"
  **Output:** \"aauaaaaada\"
  **Explanation:** We group the equivalent characters in s1 and s2 as [a,o,e,r,s,c], [l,p], [g,t] and [d,m], thus all letters in baseStr except 'u' and 'd' are transformed to 'a', the answer is \"aauaaaaada\".
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s1.length, s2.length, baseStr &lt;= 1000
  	s1.length == s2.length
  	s1, s2, and baseStr consist of lowercase English letters.
---

```python
class Solution:
    def smallestEquivalentString(self, s1: str, s2: str, baseStr: str) -> str:
        mp = {}

        for k1, k2 in zip(s1,s2):
            if k1 in mp and k2 in mp:
                t = mp[k1].union(mp[k2])
                for m in t:
                    mp[m] = t
                continue

            if k1 in mp:
                t = mp[k1]
                t.add(k2)
                mp[k2] = t
                mp[k1] = t
                continue

            if k2 in mp:
                t = mp[k2]
                t.add(k1)
                mp[k1] = t
                mp[k2] = t
                continue

            t = set()
            t.add(k1)
            t.add(k2)
            mp[k1] = t
            mp[k2] = t


        res = ""
        for k in baseStr:
            if k in mp:
                ls = list(mp[k])
                ls.sort()
                res += ls[0]
            else:
                res += k
        return res


        
```