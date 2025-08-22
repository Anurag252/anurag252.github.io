---
title: "Delete Characters To Make Fancy String"
date: "2024-11-01T19:23:18+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 155 ms (100.00%) | Memory: 18.4 MB (83.28%) - LeetSync"
---

```python
class Solution:
    def makeFancyString(self, s: str) -> str:

        curr = ""
        count = 0
        res = []

        for k in s:
            if k == curr:
                count += 1
            else:
                curr = k
                count = 1

            if count < 3:
                res.append(k)
        return "".join(res)

        
```