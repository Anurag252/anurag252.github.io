---
title: "Lexicographical Numbers"
date: "2025-06-08T18:06:30+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 109 ms (9.59%) | Memory: 21.2 MB (77.82%) - LeetSync"
---

```python
class Solution:
    def lexicalOrder(self, n: int) -> List[int]:

        def recurse(m):
            if m > n :
                return
            res = [m]
            for i in range(0,10):
                t = recurse(m * (10) + i)
                if t != None:
                    res += t
            return res
        a = []
        for m in range(1,10):   
            l = recurse(m)
            if l != None:
                a += l
        return a
        
```