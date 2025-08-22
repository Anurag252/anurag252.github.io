---
title: "Find Score Of An Array After Marking All Elements"
date: "2024-12-13T08:08:16+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 630 ms (29.46%) | Memory: 44.1 MB (25.40%) - LeetSync"
---

```python
class Solution:
    def findScore(self, nums: List[int]) -> int:
        s = set()

        h = []

        for idx, k in enumerate(nums):
            heapq.heappush(h, (k, idx))
        score = 0
        while(len(h) > 0):
            item = heapq.heappop(h)
            if item[1] not in s:
                s.add(item[1])
                s.add(item[1] + 1)
                s.add(item[1] - 1)
                score += item[0]
        return score

        
```