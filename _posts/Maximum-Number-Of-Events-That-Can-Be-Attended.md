---
title: "Maximum Number Of Events That Can Be Attended"
date: "2025-07-07T13:47:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 158 ms (43.81%) | Memory: 53.2 MB (55.74%) - LeetSync"
---

```python
class Solution:
    def maxEvents(self, events: List[List[int]]) -> int:
        n = len(events)
        max_day = max(event[1] for event in events)
        events.sort()
        pq = []
        ans, j = 0, 0
        for i in range(1, max_day + 1):
            while j < n and events[j][0] <= i:
                heapq.heappush(pq, events[j][1])
                j += 1
            while pq and pq[0] < i:
                heapq.heappop(pq)
            if pq:
                heapq.heappop(pq)
                ans += 1

        return ans
```