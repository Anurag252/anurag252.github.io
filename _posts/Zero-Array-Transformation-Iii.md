---
title: "Zero Array Transformation Iii"
date: "2025-05-22T22:13:55+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 190 ms (94.53%) | Memory: 62.5 MB (15.63%) - LeetSync"
---

```python
class Solution:
    def maxRemoval(self, nums: List[int], queries: List[List[int]]) -> int:
        queries.sort(key=lambda x: x[0])
        heap = []
        deltaArray = [0] * (len(nums) + 1)
        operations = 0
        j = 0
        for i, num in enumerate(nums):
            operations += deltaArray[i]
            while j < len(queries) and queries[j][0] == i:
                heappush(heap, -queries[j][1])
                j += 1
            while operations < num and heap and -heap[0] >= i:
                operations += 1
                deltaArray[-heappop(heap) + 1] -= 1
            if operations < num:
                return -1
        return len(heap)
```