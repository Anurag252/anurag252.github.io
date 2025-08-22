---
title: "Construct K Palindrome Strings"
date: "2025-01-11T07:30:23+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 75 ms (5.73%) | Memory: 18.1 MB (34.36%) - LeetSync"
---

```python
class Solution:
    def canConstruct(self, s: str, k: int) -> bool:

        dt = {}
        count_one = 0
        for m in s:
            if m not in dt:
                dt[m] = 0
            dt[m] += 1
        
        for v in dt.values():
            if v % 2 == 1:
                count_one += 1
        
        if k > len(s) or k - count_one < 0:
            return False
        return True

        
```