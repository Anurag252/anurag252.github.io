---
title: "Count Good Triplets"
date: "2025-04-14T07:12:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 204 ms (75.14%) | Memory: 18.2 MB (6.59%) - LeetSync"
---

```python
class Solution:
    def countGoodTriplets(self, arr: List[int], a: int, b: int, c: int) -> int:
        res = []
        for i, k in enumerate(arr):
            for j,l in enumerate(arr[i+1:]):
                diff = abs(k - l)
                if diff <= a:
                    res.append((i,i+1+j))
        ans = 0
        #print(res)
        for p in res:
            for k,m in enumerate(arr[p[1]+1:]):
                if abs(arr[p[1]] - m) <= b and abs(arr[p[0]]-m) <= c:
                    ans += 1
        return ans


        print(res)

        
```