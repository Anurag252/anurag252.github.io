---
title: "Count The Number Of Good Subarrays"
date: "2025-04-16T09:02:56+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 208 ms (11.98%) | Memory: 34.5 MB (16.83%) - LeetSync"
---

```python
class Solution:
    def countGood(self, nums: List[int], k: int) -> int:
        n = len(nums)
        same, right = 0, -1
        cnt = Counter()
        ans = 0
        for left in range(n):
            while same < k and right + 1 < n:
                right += 1
                same += cnt[nums[right]]
                cnt[nums[right]] += 1
            if same >= k:
                ans += n - right
            cnt[nums[left]] -= 1
            same -= cnt[nums[left]]
        return ans
```