---
title: "1656 Count Good Triplets"
date: "2025-04-14T07:12:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Count Good Triplets](https://leetcode.com/problems/count-good-triplets) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Given an array of integers arr, and three integers a, b and c. You need to find the number of good triplets.
  
  A triplet (arr[i], arr[j], arr[k]) is **good** if the following conditions are true:
  
  	0 <= i < j < k < arr.length
  	|arr[i] - arr[j]| <= a
  	|arr[j] - arr[k]| <= b
  	|arr[i] - arr[k]| <= c
  
  Where |x| denotes the absolute value of x.
  
  Return* the number of good triplets*.
  
   
  
  Example 1:
  
  ```
  
  **Input:** arr = [3,0,1,1,9,7], a = 7, b = 2, c = 3
  **Output:** 4
  **Explanation:** There are 4 good triplets: [(3,0,1), (3,0,1), (3,1,1), (0,1,1)].
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** arr = [1,1,2,2,3], a = 0, b = 0, c = 1
  **Output:** 0
  **Explanation: **No triplet satisfies all conditions.
  
  ```
  
   
  
  **Constraints:**
  
  	3 <= arr.length <= 100
  	0 <= arr[i] <= 1000
  	0 <= a, b, c <= 1000
---

```python
class Solution:
    def countGoodTriplets(self, arr: List[int], a: int, b: int, c: int) -> int:
        res = []
        for i, k in enumerate(arr):
            for j,l in enumerate(arr[i+1:]):
                diff = abs(k - l)
                if diff <= a:
                    res.append((i,i+1+j))
        ans = 0
        #print(res)
        for p in res:
            for k,m in enumerate(arr[p[1]+1:]):
                if abs(arr[p[1]] - m) <= b and abs(arr[p[0]]-m) <= c:
                    ans += 1
        return ans


        print(res)

        
```