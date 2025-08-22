---
title: "Minimum String Length After Removing Substrings"
date: "2024-10-07T11:40:00+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 54 ms (12.59%) | Memory: 16.9 MB (7.81%) - LeetSync"
---

```python
class Solution:
    def minLength(self, s: str) -> int:
        @cache
        def test(s):
            #print(s)
            if "AB" not in s and "CD" not in s:
                return len(s)
            result = 100
            s = s.replace("AB","")
            s = s.replace("CD","")
            return min(result, test(s))
        return test(s)

        
```