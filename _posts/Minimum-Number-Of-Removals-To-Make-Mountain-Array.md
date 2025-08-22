---
title: "Minimum Number Of Removals To Make Mountain Array"
date: "2024-10-30T14:22:18+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1876 ms (34.88%) | Memory: 16.8 MB (31.03%) - LeetSync"
---

```python
class Solution:
    def minimumMountainRemovals(self, nums: List[int]) -> int:
        N = len(nums)

        lis_length = [1] * N
        lds_length = [1] * N

        # Stores the length of longest increasing subsequence that ends at i.
        for i in range(N):
            for j in range(i):
                if nums[i] > nums[j]:
                    lis_length[i] = max(lis_length[i], lis_length[j] + 1)

        # Stores the length of longest decreasing subsequence that starts at i.
        for i in range(N - 1, -1, -1):
            for j in range(i + 1, N):
                if nums[i] > nums[j]:
                    lds_length[i] = max(lds_length[i], lds_length[j] + 1)

        min_removals = float("inf")
        for i in range(N):
            if lis_length[i] > 1 and lds_length[i] > 1:
                min_removals = min(
                    min_removals, N - lis_length[i] - lds_length[i] + 1
                )

        return min_removals
```