---
title: "Count Subarrays Where Max Element Appears At Least K Times"
date: "2025-04-29T09:53:25+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 88 ms (45.85%) | Memory: 29.1 MB (99.54%) - LeetSync"
---

```python
class Solution:
    def countSubarrays(self, nums: List[int], k: int) -> int:
        max_element = max(nums)
        indexes_of_max_elements = []
        ans = 0

        for index, element in enumerate(nums):

            if element == max_element:
                indexes_of_max_elements.append(index)

            freq = len(indexes_of_max_elements)
            if freq >= k:
                ans += indexes_of_max_elements[-k] + 1

        return ans
```