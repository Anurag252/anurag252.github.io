---
title: "Rearranging Fruits"
date: "2025-08-02T22:32:47+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 164 ms (5.10%) | Memory: 43.2 MB (75.16%) - LeetSync"
---

```python
class Solution:
    def minCost(self, basket1: List[int], basket2: List[int]) -> int:
        freq = Counter()
        m = float("inf")
        for b1 in basket1:
            freq[b1] += 1
            m = min(m, b1)
        for b2 in basket2:
            freq[b2] -= 1
            m = min(m, b2)

        merge = []
        for k, c in freq.items():
            if c % 2 != 0:
                return -1
            merge.extend([k] * (abs(c) // 2))

        if not merge:
            return 0
        merge.sort()
        return sum(min(2 * m, x) for x in merge[: len(merge) // 2])
```