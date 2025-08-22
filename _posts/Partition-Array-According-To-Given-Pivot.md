---
title: "Partition Array According To Given Pivot"
date: "2025-03-03T05:42:29+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 43 ms (33.71%) | Memory: 34.7 MB (33.03%) - LeetSync"
---

```python
class Solution:
    def pivotArray(self, nums: List[int], pivot: int) -> List[int]:
        less = []
        grt =[]
        pvt = []
        res =[]

        for k in nums:
            if k < pivot :
                less.append(k)
            if k > pivot:
                grt.append(k)
            if k == pivot:
                pvt.append(k)

        for k in less:
            res.append(k)

        for k in pvt:
            res.append(k)


        for k in grt:
            res.append(k)

        return res

         
        

        
```