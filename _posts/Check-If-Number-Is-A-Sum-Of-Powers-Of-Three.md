---
title: "Check If Number Is A Sum Of Powers Of Three"
date: "2025-03-04T15:05:55+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3238 ms (5.58%) | Memory: 85.7 MB (18.33%) - LeetSync"
---

```python
class Solution:
    def checkPowersOfThree(self, n: int) -> bool:
        
        mp = set()
        cache = {}

        def recurse(n, mp):
            if n < 0:
                return False
            #print(cache)
            if n in cache:
                return cache[n]
            if n == 0:
                return True
            
            k = 0
            while math.pow(3,k) <= n:
                if k in mp:
                    k += 1
                    continue
                mp.add(k)
                if recurse(n-math.pow(3,k) , mp):
                    cache[n] = True
                    return True
                mp.remove(k)
                k += 1
            cache[n] = False
            return False
        res = recurse(n, mp)
        #print(cache)
        return res

        
```