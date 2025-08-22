---
title: "Count And Say"
date: "2025-04-18T22:53:14+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 6 ms (78.80%) | Memory: 18 MB (20.58%) - LeetSync"
---

```python
class Solution:
    def countAndSay(self, n: int) -> str:
        
        def t(n):
            if n == 1:
                return "1"
            if n == 2:
                return "11"
            prev = ""
            c = 0
            res = ""
            l = t(n-1)
            for k in l:
                if prev == "":
                    prev = k
                    c = 1
                else:
                    if prev == k:
                        c += 1
                    else:
                        res += str(c) + prev
                        c = 1
                        prev = k
            res += str(c) + prev
            return res
        return t(n)


            



```