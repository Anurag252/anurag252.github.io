---
title: "Kth Largest Element In A Stream"
date: "2024-08-12T05:54:53+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 74 ms (83.10%) | Memory: 20.5 MB (53.25%) - LeetSync"
---

```python
class KthLargest:

    def __init__(self, k: int, nums: List[int]):
        self.h = []
        self.limit = k
        for l in nums:
            heapq.heappush(self.h, l)
        
        

    def add(self, val: int) -> int:
        heapq.heappush(self.h, val)
        while len(self.h) > self.limit:
            heapq.heappop(self.h)
        return self.h[0]
        

        


# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)
```