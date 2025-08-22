---
title: "Solving Questions With Brainpower"
date: "2025-04-01T15:50:46+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 67 ms (88.57%) | Memory: 56.8 MB (98.81%) - LeetSync"
---

```python
class Solution:
    def mostPoints(self, questions: List[List[int]]) -> int:
        n = len(questions)
        dp = [0] * (n + 1)  # dp[i] = max points starting from i

        for i in range(n - 1, -1, -1):
            points, skip = questions[i]
            take = points + (dp[i + skip + 1] if i + skip + 1 < n else 0)
            skip = dp[i + 1]
            dp[i] = max(take, skip)

        return dp[0]

```