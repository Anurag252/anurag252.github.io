---
title: "Number Complement"
date: "2024-08-22T06:57:53+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 41 ms (14.09%) | Memory: 16.5 MB (14.64%) - LeetSync"
---

```python
class Solution:
    def findComplement(self, num: int) -> int:
        result = 0
        i = 0
        while num > 0:
            t = num & 1
            num = num >> 1
            t = not t
            for k in range(i):
                t = t << 1
            result = result | t
            i += 1
        return result


        
```