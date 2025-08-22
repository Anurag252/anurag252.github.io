---
title: "Domino And Tromino Tiling"
date: "2025-05-05T20:26:29+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.8 MB (69.39%) - LeetSync"
---

```python
class Solution:
    def numTilings(self, n: int) -> int:
        MOD = 10**9 + 7
        dp = [0] * (n + 1)
        dp[0] = 1
        if n >= 1:
            dp[1] = 1
        if n >= 2:
            dp[2] = 2

        for i in range(3, n + 1):
            dp[i] = (2 * dp[i - 1] + dp[i - 3]) % MOD

        return dp[n]

```