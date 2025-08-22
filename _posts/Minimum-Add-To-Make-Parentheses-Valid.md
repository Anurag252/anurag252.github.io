---
title: "Minimum Add To Make Parentheses Valid"
date: "2024-10-09T07:24:07+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 35 ms (55.22%) | Memory: 16.5 MB (71.14%) - LeetSync"
---

```python
class Solution:
    def minAddToMakeValid(self, s: str) -> int:
        arr = []
        for k in s:
            if k == ")" and len(arr) > 0 and  arr[-1] == "(":
                arr.pop()
            else:
                arr.append(k)
        return len(arr)
                

    #"()))(("

```