---
title: "Most Beautiful Item For Each Query"
date: "2024-11-12T12:18:43+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 293 ms (34.15%) | Memory: 67.3 MB (54.30%) - LeetSync"
---

```python
from typing import List

class Solution:
    def maximumBeauty(self, items: List[List[int]], queries: List[int]) -> List[int]:
        # Sort items by their price in ascending order, then by beauty in descending order
        items.sort()
        
        # Precompute the maximum beauty up to each price
        max_beauty = []
        current_max_beauty = 0
        for price, beauty in items:
            current_max_beauty = max(current_max_beauty, beauty)
            max_beauty.append((price, current_max_beauty))
        
        # Function to find the maximum beauty within the price limit using binary search
        def find_max_beauty(price_limit: int) -> int:
            left, right = 0, len(max_beauty) - 1
            while left <= right:
                mid = left + (right - left) // 2
                if max_beauty[mid][0] <= price_limit:
                    left = mid + 1
                else:
                    right = mid - 1
            return max_beauty[right][1] if right >= 0 else 0
        
        # Answer each query using binary search on max_beauty
        ans = []
        for query in queries:
            ans.append(find_max_beauty(query))
        
        return ans

```