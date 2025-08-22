---
title: "Lexicographically Smallest Equivalent String"
date: "2025-06-05T23:08:33+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 7 ms (50.12%) | Memory: 18 MB (41.03%) - LeetSync"
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