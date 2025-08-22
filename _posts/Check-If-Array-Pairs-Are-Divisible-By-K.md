---
title: "Check If Array Pairs Are Divisible By K"
date: "2024-10-01T09:12:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 508 ms (51.15%) | Memory: 30.6 MB (27.88%) - LeetSync"
---

```python
class Solution:
    def canArrange(self, arr: List[int], k: int) -> bool:
        dic = {}
        for m in arr:
                if m%k == 0:
                    continue
                if m%k in dic:
                    dic[m%k] += 1
                else:
                    dic[m%k] = 1
        for m,v in dic.items():
            if m == k/2 and k % 2 == 0 and v % 2 != 0:
                return False
            if k-m not in dic or v != dic[k-m]:
                return False

        return True


            

        
```