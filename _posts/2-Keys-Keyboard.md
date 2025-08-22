---
title: "2 Keys Keyboard"
date: "2024-08-19T08:15:28+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 250 ms (29.16%) | Memory: 21.3 MB (23.58%) - LeetSync"
---

```python
class Solution:
    def __init__(self):
        self.cache = {}
    def minSteps(self, n: int, lastchar : str = "", screen = "A") -> int:
        if (lastchar, screen) in self.cache:
            return self.cache[(lastchar, screen)]
        if n == len(screen) :
            return 0
        if n < len(screen):
            return 1000000
        if lastchar == "":
            if n == 1:
                return 0
            v = 2 + self.minSteps(n, "A", screen +  "A")
            self.cache[(lastchar, screen)] = v
            return v
        else:
            v =  min(1 + self.minSteps(n, lastchar, screen +  lastchar), 
                2 + self.minSteps(n, screen, screen +  screen))
            self.cache[(lastchar, screen)] = v
            return v
        
```