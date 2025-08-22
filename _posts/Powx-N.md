---
title: "Powx N"
date: "2024-06-06T07:50:14+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 33 ms (71.98%) | Memory: 16.5 MB (61.92%) - LeetSync"
---

```python
class Solution:
    def __init__(self):
        self.dt = {}

    def myPow(self, x: float, n: int) -> float:
        multiplier = 1
        if n < 0:
            return 1/self.calc(x, -n) 
        return self.calc(x, n) 
        


    def calc(self, x: float, n : int) -> int:
        if (str(x) + "$" + str(n)) in self.dt:
            return self.dt[str(x) + "$" + str(n)]

        
        if n <= 0:
            return 1
        if n == 1:
            return x
        result = 0
        if n % 2 == 0:
            result = self.calc(x, n/2) * self.calc(x, n/2)
        else:
            result = self.calc(x, (n+1)/2) * self.calc(x, (n-1)/2)
        self.dt[str(x) + "$" + str(n)] = result
        return result

      
```