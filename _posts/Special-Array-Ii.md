---
title: "Special Array Ii"
date: "2024-12-09T09:17:43+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 43 ms (65.28%) | Memory: 46.8 MB (34.82%) - LeetSync"
---

```python
class Solution:
    def isArraySpecial(self, nums: List[int], queries: List[List[int]]) -> List[bool]:
        arr = []

        for k in nums:
            arr.append(k % 2)
        arr2 = [0]
        for idx, k in enumerate(arr):
            if idx + 1 == len(arr):
                break
            arr2.append(k ^ arr[idx + 1])

        temp = 0
        arr1 = []
        for k in arr2:
            temp += k
            arr1.append(temp)
        #print(arr1, arr2, arr)
        result = []
        for k in queries:
            if arr1[k[1]] - arr1[k[0]] == k[1] - k[0]:
                result.append(True)
            else:
                result.append(False)
        return result

        """ 
        1+2 = 3 (od + ev = od)
        2 + 2 = 4 (ev + ev = ev)
        3 + 3 = (od + od = ev)
        diff + 1 ==
        1,0,1,0,0,1,0,1,0
          1,1,1,0,1,1,1,1
          """
```