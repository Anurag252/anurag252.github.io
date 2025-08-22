---
title: "Maximum Number Of Events That Can Be Attended Ii"
date: "2025-07-08T10:18:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 660 ms (76.37%) | Memory: 78.6 MB (73.08%) - LeetSync"
---

```python
class Solution:
    def maxValue(self, events: List[List[int]], k: int) -> int:        
        events.sort()
        n = len(events)
        starts = [start for start, end, value in events]
        dp = [[-1] * n for _ in range(k + 1)]
        
        def dfs(cur_index, count):
            if count == 0 or cur_index == n:
                return 0
            if dp[count][cur_index] != -1:
                return dp[count][cur_index]

            # Find the nearest available event after attending event 0.

            next_index = bisect_right(starts, events[cur_index][1])
            dp[count][cur_index] = max(dfs(cur_index + 1, count), events[cur_index][2] + dfs(next_index, count - 1))
            return dp[count][cur_index]
        
        return dfs(0, k)
```