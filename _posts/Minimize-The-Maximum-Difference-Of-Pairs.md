---
title: "Minimize The Maximum Difference Of Pairs"
date: "2025-06-13T10:15:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 320 ms (90.28%) | Memory: 32.7 MB (40.08%) - LeetSync"
---

```python
from typing import List
from functools import cache

class Solution:
        def minimizeMax(self, A: List[int], p: int) -> int:
            A.sort()
            n = len(A)
            left, right = 0, A[-1] - A[0]
            while left < right:
                mid = (left + right) // 2
                k = 0
                i = 1
                while i < n:
                    if A[i] - A[i - 1] <= mid:
                        k += 1
                        i += 1
                    i += 1
                if k >= p:
                    right = mid
                else:
                    left = mid + 1
            return left
```