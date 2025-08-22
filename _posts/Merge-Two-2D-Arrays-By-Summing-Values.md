---
title: "Merge Two 2D Arrays By Summing Values"
date: "2025-03-02T08:43:20+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3 ms (24.17%) | Memory: 18 MB (62.54%) - LeetSync"
---

```python
class Solution:
    def mergeArrays(self, nums1: List[List[int]], nums2: List[List[int]]) -> List[List[int]]:
        mp = {}

        mx = 0

        for k in nums1:
            mp[k[0]] = k[1]
            mx = max(mx, k[0])

        for k in nums2:
            if k[0] not in mp:
                mp[k[0]] = k[1]
            else:
                mp[k[0]] += k[1]
            mx = max(mx, k[0])
        
        res = []

        for k in range(1,mx+1):
            if k in mp:
                res.append([k, mp[k]])
        return res


```