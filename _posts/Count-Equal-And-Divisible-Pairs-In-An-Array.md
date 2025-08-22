---
title: "Count Equal And Divisible Pairs In An Array"
date: "2025-04-17T22:20:50+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 31 ms (14.90%) | Memory: 17.6 MB (96.06%) - LeetSync"
---

```python
class Solution:
    def countPairs(self, nums: List[int], k: int) -> int:
        n = len(nums)
        res = 0  # number of pairs meeting the requirements
        for i in range(n - 1):
            for j in range(i + 1, n):
                if (i * j) % k == 0 and nums[i] == nums[j]:
                    res += 1
        return res
```