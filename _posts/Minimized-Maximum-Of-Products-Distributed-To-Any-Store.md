---
title: "Minimized Maximum Of Products Distributed To Any Store"
date: "2024-11-14T20:02:28+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 550 ms (81.90%) | Memory: 28.7 MB (73.44%) - LeetSync"
---

```python
from typing import List
from math import ceil

class Solution:
    def minimizedMaximum(self, n: int, quantities: List[int]) -> int:
        # Binary search to find the minimum possible maximum quantity per store
        left, right = 1, max(quantities)
        
        def canDistribute(maxQuantity: int) -> bool:
            # Calculate the number of stores needed if maxQuantity is the maximum each store can have
            stores_needed = sum(ceil(q / maxQuantity) for q in quantities)
            return stores_needed <= n
        
        while left < right:
            mid = (left + right) // 2
            if canDistribute(mid):
                right = mid  # Try for a smaller maximum
            else:
                left = mid + 1  # Increase the maximum quantity
        
        return left

```