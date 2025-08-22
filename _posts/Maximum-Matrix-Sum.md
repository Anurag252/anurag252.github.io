---
title: "Maximum Matrix Sum"
date: "2024-11-24T12:12:22+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 91 ms (52.07%) | Memory: 25 MB (72.10%) - LeetSync"
---

```python
class Solution:
    def maxMatrixSum(self, matrix: List[List[int]]) -> int:
        total_sum = 0
        min_abs_val = float("inf")
        negative_count = 0

        for row in matrix:
            for val in row:
                total_sum += abs(val)
                if val < 0:
                    negative_count += 1
                min_abs_val = min(min_abs_val, abs(val))

        # Adjust if the count of negative numbers is odd
        if negative_count % 2 != 0:
            total_sum -= 2 * min_abs_val

        return total_sum
```