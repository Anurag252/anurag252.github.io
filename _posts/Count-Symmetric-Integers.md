---
title: "Count Symmetric Integers"
date: "2025-04-12T04:15:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 515 ms (78.98%) | Memory: 17.6 MB (99.39%) - LeetSync"
---

```python
class Solution:
    def countSymmetricIntegers(self, low: int, high: int) -> int:
        res = 0
        for k in range(low, high + 1):
            m = str(k)
            if len(m) % 2 != 0:
                continue
            a = m[0:len(m)//2]
            b = m[len(m)//2:]
            s1, s2 = 0,0
            for p in a:
                s1 += int(p)
            for p in b:
                s2 += int(p)
            if s1 == s2:
                res += 1

        return res
        
```