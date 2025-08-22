---
title: "Smallest Range Covering Elements From K Lists"
date: "2024-10-13T08:42:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 195 ms (52.72%) | Memory: 24.7 MB (10.67%) - LeetSync"
---

```python
from typing import List
import collections

class Solution:
    def smallestRange(self, nums: List[List[int]]) -> List[int]:
        arr = []
        for idx, sublist in enumerate(nums):
            for num in sublist:
                arr.append((num, idx))

        arr.sort()
        count = collections.Counter()
        left = 0
        result = [-10**5, 10**5]
        unique_count = 0

        for right in range(len(arr)):
            num, idx = arr[right]
            count[idx] += 1
            if count[idx] == 1:
                unique_count += 1

            while unique_count == len(nums):
                left_num, left_idx = arr[left]
                # Update result if the current range is smaller
                if num - left_num < result[1] - result[0]:
                    result = [left_num, num]

                # Decrease the count for the left element and move left pointer
                count[left_idx] -= 1
                if count[left_idx] == 0:
                    unique_count -= 1
                left += 1

        return result

```