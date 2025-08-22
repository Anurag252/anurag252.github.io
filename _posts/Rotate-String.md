---
title: "Rotate String"
date: "2024-11-03T10:00:15+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3 ms (6.30%) | Memory: 16.5 MB (40.35%) - LeetSync"
---

```python
class Solution:
    def rotateString(self, s: str, goal: str) -> bool:
        

        for idx, k in enumerate(s):
            if (s[idx:] + s[:idx]) == goal:
                return True
        return False
```