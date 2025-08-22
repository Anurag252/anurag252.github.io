---
title: "Find Longest Special Substring That Occurs Thrice Ii"
date: "2024-12-11T16:37:48+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 770 ms (52.42%) | Memory: 20.1 MB (50.40%) - LeetSync"
---

```python
class Solution:
    def maximumLength(self, s: str) -> int:
        f = {}
        i = 0
        while(i < len(s)):
            j = i + 1
            while j < len(s) and s[j] == s[i]:
                j += 1
            if s[i] in f:
                if len(f[s[i]]) >= 3:
                    if f[s[i]][0]  == min(f[s[i]]):
                        f[s[i]][0] = j - i
                    elif f[s[i]][1]  == min(f[s[i]]):
                        f[s[i]][1] = j - i
                    else:
                        f[s[i]][2] = j - i
                else:
                    f[s[i]].append(j - i)
            else :
                f[s[i]] = []
                f[s[i]].append(j - i)
            i = j
        print(f)
        res = -1
        for v in f.values():
            if sum(v) >= 3:
                res = max(1, res)
                v.sort()
                if len(v) == 3 and v[1] < v[2]:
                    res = max(res, max(v[2]-2, v[1]))
                elif len(v) == 2 and v[0] < v[1]:
                    res = max(res, max(v[1]-2, v[0]))
                elif len(v) == 1 :
                    res = max(res, v[0]-2)
                else :
                    print(v)
                    if len(v) >= 3 and len(set(v)) == 1:
                        res = max(res, max(v))
                        continue
                    if len(v) >= 3 and len(set(v)) == 2:
                        res = max(res, max(v)-1)
                        continue
                    if len(v) < 3 and len(set(v)) == 1:
                        res = max(res, max(v)-1)
                        continue
                    if len(v) < 3 and len(set(v)) == 2:
                        res = max(res, max(v)-1)
                        continue
                #ans is always max(v) - 1 0r max(v)-2

        return res






"""
        4 -3 + 1
        min(num of continuos occurence) -  3 + 1
        aaaa aaa aa
        aa 
        4,3,2
        """
```