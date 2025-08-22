---
title: "Rank Transform Of An Array"
date: "2024-10-02T06:04:15+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 267 ms (16.20%) | Memory: 34 MB (69.75%) - LeetSync"
---

```python
class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        arr_cpy = arr.copy()
        arr.sort()
        #print(arr, arr_cpy)
        result = [0] * len(arr)
        dic = {}
        temp = 0

        for idx, k in enumerate(arr) :
            if idx > 0 and k == arr[idx-1]:
                continue
            else:
                temp +=1
                dic[k] = temp

        for idx, k in enumerate(arr_cpy) :
            result[idx] = dic[k]

        return result
            

            


        
```