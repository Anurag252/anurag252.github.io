---
title: "Take Gifts From The Richest Pile"
date: "2024-12-12T08:19:38+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 2 ms (91.28%) | Memory: 17.5 MB (13.92%) - LeetSync"
---

```python
class Solution:
    def pickGifts(self, gifts: List[int], k: int) -> int:
        q = []
        for m in gifts:
            heapq.heappush(q, -m)
        
        while(k > 0):
            gift = -heapq.heappop(q)
            heapq.heappush(q, -floor(sqrt(gift)))
            k -= 1
        return -sum(q)

        
```