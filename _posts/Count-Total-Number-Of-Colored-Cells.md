---
title: "Count Total Number Of Colored Cells"
date: "2025-03-05T11:55:31+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 179 ms (18.80%) | Memory: 17.5 MB (94.74%) - LeetSync"
---

```python
class Solution:
    def coloredCells(self, n: int) -> int:
        """
        1, 4 +1, 8 + 4 + 1, 12 + 8 + 4 + 1
        """
        k = 0
        for i in range(1, n+1):
            if i == 1:
                k += i
            else:
                k += 4*(i-1)
        return k
        if n == 1:
            return 1

        return 4*(n-1) + self.coloredCells(n-1)
```