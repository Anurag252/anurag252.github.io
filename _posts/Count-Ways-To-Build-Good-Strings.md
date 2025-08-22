---
title: "Count Ways To Build Good Strings"
date: "2024-12-30T09:26:39+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 139 ms (59.81%) | Memory: 22.1 MB (66.77%) - LeetSync"
---

```python
class Solution:
    def countGoodStrings(self, low: int, high: int, zero: int, one: int) -> int:


        """
        T[j] = 1 + T[j-zero] + T[j-one] if j >= low
             = 0 if j > high
             = T[j-zero] + T[j-one]
        """

        
        T = [0] * (high+1)
        T[zero] += 1
        T[one] += 1

        for i in range(min(zero,one),high+1):
            if i == min(zero,one):
                continue
            if i > high+1:
                T[i] = 0
                continue
            if i >= low+1:
                T[i] += T[i-zero] + T[i-one]
                T[i] = T[i] % (10 ** 9 + 7)
                continue
            T[i] += T[i-zero] + T[i-one]
            T[i] = T[i] % (10 ** 9 + 7)
        return sum(T[low:high+2]) % (10 ** 9 + 7)
            

        @cache
        def recurse(count, l):
            if l > high:
                return 0
            if l >= low:
                return 1 + recurse(count , l + zero) + recurse(count , l + one) 
            return recurse(count , l + zero) + recurse(count , l + one)

        return recurse(0, 0) % (10 ** 9 + 7)
        
```