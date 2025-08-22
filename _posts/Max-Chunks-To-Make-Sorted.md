---
title: "Max Chunks To Make Sorted"
date: "2024-12-19T18:14:21+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 211 ms (100.00%) | Memory: 17.7 MB (14.45%) - LeetSync"
---

```python
class Solution:
    def maxChunksToSorted(self, arr: List[int]) -> int:

        def partition(arr):
            arr1 = copy.deepcopy(arr)
            arr1.sort()
            if len(arr) == 0:
                return (0, arr)
            if len(arr) == 1:
                return (1, arr)
            
            result = 1
            

            for idx, k in enumerate(arr):
                if len(arr[0:idx+1]) == 0 or len(arr[idx+1:]) == 0:
                    continue
                
                a,b = partition(arr[0:idx+1])
                c,d = partition(arr[idx+1:])
                if b + d == arr1 :
                    #print(arr1, a,c)
                    result = max(result,a + c)
            return (result, arr1)
        return partition(arr)[0]


        
```