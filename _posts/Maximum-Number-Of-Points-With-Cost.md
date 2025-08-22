---
title: "Maximum Number Of Points With Cost"
date: "2024-08-17T07:31:15+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1591 ms (37.56%) | Memory: 64.6 MB (5.85%) - LeetSync"
---

```python
class Solution:
    def __init__(self):
        self.cache = {}
    def maxPoints(self, points: List[List[int]]) -> int:
        n, m = len(points), len(points[0])
        cache = {}

        def precompute_max_arrays(dp_row):
            max_left = [0] * m
            max_right = [0] * m

            max_left[0] = dp_row[0]
            for c in range(1, m):
                max_left[c] = max(max_left[c - 1], dp_row[c] + c)

            max_right[-1] = dp_row[-1] - (m - 1)
            for c in range(m - 2, -1, -1):
                max_right[c] = max(max_right[c + 1], dp_row[c] - c)

            return max_left, max_right

        def dp(r):
            if r in cache:
                return cache[r]
            if r == n - 1:
                return points[r]

            # Get DP row for the next row
            dp_next_row = dp(r + 1)
            max_left, max_right = precompute_max_arrays(dp_next_row)

            current_dp = [0] * m
            for c in range(m):
                current_dp[c] = points[r][c] + max(max_left[c] - c, max_right[c] + c)

            cache[r] = current_dp
            return current_dp

        # Compute result by taking the maximum of the first row
        return max(dp(0))

```