---
title: "Number Of 1 Bits"
date: "2024-05-15T22:32:43+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 30 ms (88.72%) | Memory: 16.7 MB (8.26%) - LeetSync"
---

```python
class Solution:
    def hammingWeight(self, n: int) -> int:
        t = 1
        count = 0
        while(n > 0):
            print(n)
            result = n & 1
            if result == 1:
                count = count + 1
            n=n >> 1
        return count

        
```