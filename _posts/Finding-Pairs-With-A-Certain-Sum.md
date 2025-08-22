---
title: "Finding Pairs With A Certain Sum"
date: "2025-07-06T07:55:46+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 663 ms (5.11%) | Memory: 85.9 MB (9.12%) - LeetSync"
---

```python
class FindSumPairs:

    def __init__(self, nums1: List[int], nums2: List[int]):
        """
        sort nums1
        for each nums1 < total , find in nums2 tot-i
        as # of elements in nums1 < 1000, then count runs in 1000
        """
        self.arr1 = nums1
        self.arr2 = {}
        self.arr3 = {}
        for i,  k in enumerate(nums2):
            self.arr3[i] = k
        for i,k in enumerate(nums2):
            if k in self.arr2:
                self.arr2[k].append(i)
            else:
                self.arr2[k] = [i]

    def add(self, index: int, val: int) -> None:
        k = self.arr3[index]
        if k + val in self.arr2:
            self.arr2[k + val].append(index)
        else:
            self.arr2[k + val] = [index]
        self.arr2[k].remove(index)
        self.arr3[index] = k + val
        

        

    def count(self, tot: int) -> int:
        res = 0
        for k in self.arr1:
            if tot - k in self.arr2:
                res += len(self.arr2[tot-k])
        return res
        


# Your FindSumPairs object will be instantiated and called as such:
# obj = FindSumPairs(nums1, nums2)
# obj.add(index,val)
# param_2 = obj.count(tot)
```