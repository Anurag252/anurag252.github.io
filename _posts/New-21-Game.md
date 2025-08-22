---
title: "New 21 Game"
date: "2025-08-17T19:16:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 23 ms (72.90%) | Memory: 18.4 MB (29.68%) - LeetSync"
---

```python
class Solution:
    def new21Game(self, n: int, k: int, maxPts: int) -> float:
        if k == 0 or n >= k + maxPts:
            return 1.0

        dp = [0.0] * (n + 1)
        dp[0] = 1.0
        window_sum = 1.0  # sum of last maxPts dp values
        result = 0.0

        for i in range(1, n + 1):
            dp[i] = window_sum / maxPts
            if i < k:  # still drawing
                window_sum += dp[i]
            else:  # stopped (≥k)
                result += dp[i]

            # shrink window
            if i - maxPts >= 0:
                window_sum -= dp[i - maxPts]

        return result

```