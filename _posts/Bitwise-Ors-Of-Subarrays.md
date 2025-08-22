---
title: "Bitwise Ors Of Subarrays"
date: "2025-07-31T22:31:37+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 484 ms (17.70%) | Memory: 44.8 MB (68.90%) - LeetSync"
---

```python
class Solution(object):
    def subarrayBitwiseORs(self, A):
        ans = set()
        cur = {0}
        for x in A:
            cur = {x | y for y in cur} | {x}
            ans |= cur
        return len(ans)
```