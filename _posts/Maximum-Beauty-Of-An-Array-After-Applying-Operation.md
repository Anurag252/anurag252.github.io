---
title: "Maximum Beauty Of An Array After Applying Operation"
date: "2024-12-11T09:00:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1580 ms (5.12%) | Memory: 39 MB (11.38%) - LeetSync"
---

```python
class Solution:
    def maximumBeauty(self, nums: List[int], k: int) -> int:

        arr = []

        for m in nums:
            arr.append((m-k,m+k))
        arr.sort(key=lambda x: x[0])
        #print(arr)

        res = 0
        for idx,m in enumerate(arr):
            left = idx
            right = len(arr)-1
            while(left < right):
                mid = ceil((left + right) / 2)
                #print(left, right, mid)
                if arr[mid][0] <= m[1] :
                    left = mid
                else :
                    right = mid -1
            res = max(res, left - idx + 1)
            #print(res)
        return res


        
```