---
title: "Kth Distinct String In An Array"
date: "2024-08-05T05:40:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 72 ms (51.05%) | Memory: 16.9 MB (7.74%) - LeetSync"
---

```python
class Solution:
    def kthDistinct(self, arr: List[str], n: int) -> str:
        mp = {}
        nmp = {}
        i = 0
        for k in arr:
            if k not in mp and k not in nmp:
                mp[k]=i
            elif k in mp:
                del mp[k]
                nmp[k]=1
            i += 1
        a = list(mp.items())
        a.sort(reverse=False, key=lambda x : x[1])
        return "" if n - 1 >= len(a) else a[n-1][0]
        
```