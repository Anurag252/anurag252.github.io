---
title: "Find Subsequence Of Length K With The Largest Sum"
date: "2025-06-28T09:37:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 23 ms (9.26%) | Memory: 17.9 MB (78.57%) - LeetSync"
---

```python
class Solution:
    def maxSubsequence(self, nums: List[int], k: int) -> List[int]:
        """
        an element x is part of largest subseq of len k-1 ending at curr - i
        T[i,k] = max(T[ i-x, k - 1] + a[i]) for all x so that sum (T[i-x], k-1)
        then just traverse back
        """
        arr = []
        for i in range(len(nums)):
            if len(arr) < k:
                arr.append(nums[i])
            else :
                temp = 100000
                idx = -1
                for j, n in enumerate(arr):
                    if temp > n:
                        temp = n
                        idx = j
                if temp < nums[i]:
                    arr.pop(idx)
                    arr.append(nums[i])
                    #print(arr)
        return arr



            
    



```