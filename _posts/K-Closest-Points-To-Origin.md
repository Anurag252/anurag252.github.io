---
title: "K Closest Points To Origin"
date: "2024-05-05T23:22:59+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 618 ms (30.94%) | Memory: 23.1 MB (21.94%) - LeetSync"
---

```python
class Solution:
    import heapq
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        arr = []
        heapq.heapify(arr)
        for item in points:
            dist = item[0]*item[0] + item[1]*item[1]
            heapq.heappush(arr, (dist, item))
        result = []
        for i in range(k):
            (dist, item) = heapq.heappop(arr)
            print(item)
            result.append(item)
        
        return result
        
```