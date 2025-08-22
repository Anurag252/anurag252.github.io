---
title: "Shortest Subarray To Be Removed To Make Array Sorted"
date: "2024-11-15T09:56:10+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 9 ms (91.89%) | Memory: 30.1 MB (98.13%) - LeetSync"
---

```python
class Solution:
    def findLengthOfShortestSubarray(self, arr: List[int]) -> int:
        right = len(arr) - 1
        while right > 0 and arr[right] >= arr[right - 1]:
            right -= 1

        ans = right
        left = 0
        while left < right and (left == 0 or arr[left - 1] <= arr[left]):
            # find next valid number after arr[left]
            while right < len(arr) and arr[left] > arr[right]:
                right += 1
            # save length of removed subarray
            ans = min(ans, right - left - 1)
            left += 1
        return ans
```