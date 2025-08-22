---
title: "Maximum Xor For Each Query"
date: "2024-11-08T19:27:38+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 59 ms (53.57%) | Memory: 37.2 MB (5.52%) - LeetSync"
---

```python
class Solution:
    def getMaximumXor(self, nums: List[int], maximumBit: int) -> List[int]:
        largestnum = 2 ** maximumBit - 1
        res = []


        a =[nums[0]]

        for idx, k in enumerate(nums):
            if idx == 0:
                continue
            a.append(a[-1] ^ k)


        for l in a:
            res.append(largestnum - l)
        res.reverse()
        return res


```