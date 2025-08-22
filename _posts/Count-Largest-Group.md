---
title: "Count Largest Group"
date: "2025-04-23T06:49:00+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 27 ms (73.75%) | Memory: 18.5 MB (7.50%) - LeetSync"
---

```python
class Solution:
    def countLargestGroup(self, n: int) -> int:
        mp = {}

        for k in range(1,n+1):
            m = k
            res = 0
            while(k > 0):
                res += (k % 10)
                k = k // 10
            #print(res, k)
            if res in mp:
                mp[res].append(m)
            else:
                mp[res] = []
                mp[res].append(m)
        l  = 0
        print(mp)
        for k in mp:
            if len(mp[k]) > l:
                l = len(mp[k])
        ans = 0
        for k in mp:
            if len(mp[k]) == l:
                ans += 1

        return ans


        
```