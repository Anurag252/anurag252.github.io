---
title: "Minimum Number Of Pushes To Type Word Ii"
date: "2024-08-06T06:52:45+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 234 ms (19.33%) | Memory: 17.6 MB (36.75%) - LeetSync"
---

```python
class Solution:
    def minimumPushes(self, word: str) -> int:
        d = {}
        for k in word:
            if k in d:
                d[k] += 1
            else :
                d[k] = 1
        l = list(d.items())
        l.sort(reverse=True, key= lambda x : x[1])
        result = 0
        n = 8
        #print(l)
        for k in l:
            result += (k[1] * int(n/8))
            n += 1
        #print(result)
        return result
        
        
```