---
title: "Median Of Two Sorted Arrays"
date: "2024-05-31T18:54:00+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 76 ms (79.94%) | Memory: 16.9 MB (78.49%) - LeetSync"
---

```python
class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        i = 0
        j = 0
        newarr = [None] * (len(nums1) + len(nums2))
        t = 0
        while t < len(newarr):
            if i < len(nums1) and j < len(nums2)  and nums1[i] < nums2[j]:
                newarr[t] = nums1[i]
                t = t + 1
                i = i + 1

            elif j < len(nums2)  and i < len(nums1) and   nums1[i] > nums2[j]:
                newarr[t] = nums2[j]
                t = t + 1
                j = j + 1

            elif j < len(nums2):
                newarr[t] = nums2[j]
                t = t + 1
                j = j + 1

            elif i < len(nums1):
                newarr[t] = nums1[i]
                t = t + 1
                i = i + 1
        print(newarr)
        if len(newarr) % 2 == 1:
            return newarr[int(len(newarr)/2)]
        else:
            a = ceil((len(newarr)-1)/2)
            b = floor((len(newarr)-1)/2)
            return (newarr[a] + newarr[b])/2
        return 0.0



```