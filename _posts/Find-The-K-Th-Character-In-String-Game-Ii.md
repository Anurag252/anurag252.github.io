---
title: "Find The K Th Character In String Game Ii"
date: "2025-07-05T14:50:28+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.8 MB (82.86%) - LeetSync"
---

```python
class Solution:
    def kthCharacter(self, k: int, operations: List[int]) -> str:
        ans = 0
        while k != 1:
            t = k.bit_length() - 1
            if (1 << t) == k:
                t -= 1
            k -= 1 << t
            if operations[t]:
                ans += 1
        return chr(ord("a") + (ans % 26))
```