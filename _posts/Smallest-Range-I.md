---
title: "Smallest Range I"
date: "2024-05-07T00:17:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 94 ms (76.39%) | Memory: 17.8 MB (86.73%) - LeetSync"
---

```python
class Solution:
    def smallestRangeI(self, nums: List[int], k: int) -> int:
        min_num = min(nums)
        max_num = max(nums)
        mean_num = (max_num - min_num )/2
        if mean_num < k:
            return 0
        else:
            return max_num - k - min_num - k



```