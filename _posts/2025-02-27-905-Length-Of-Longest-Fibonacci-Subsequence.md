---
title: "905 Length Of Longest Fibonacci Subsequence"
date: "2025-02-27T22:37:01+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Length of Longest Fibonacci Subsequence](https://leetcode.com/problems/length-of-longest-fibonacci-subsequence) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  A sequence x1, x2, ..., xn is *Fibonacci-like* if:
  
  	n >= 3
  	xi + xi+1 == xi+2 for all i + 2 <= n
  
  Given a **strictly increasing** array arr of positive integers forming a sequence, return *the **length** of the longest Fibonacci-like subsequence of* arr. If one does not exist, return 0.
  
  A **subsequence** is derived from another sequence arr by deleting any number of elements (including none) from arr, without changing the order of the remaining elements. For example, [3, 5, 8] is a subsequence of [3, 4, 5, 6, 7, 8].
  
   
  
  Example 1:
  
  ```
  
  **Input:** arr = [1,2,3,4,5,6,7,8]
  **Output:** 5
  **Explanation:** The longest subsequence that is fibonacci-like: [1,2,3,5,8].
  ```
  
  Example 2:
  
  ```
  
  **Input:** arr = [1,3,7,11,12,14,18]
  **Output:** 3
  **Explanation**:** **The longest subsequence that is fibonacci-like: [1,11,12], [3,11,14] or [7,11,18].
  ```
  
   
  
  **Constraints:**
  
  	3 <= arr.length <= 1000
  	1 <= arr[i] < arr[i + 1] <= 109
---

```python
class Solution:
    def lenLongestFibSubseq(self, arr: List[int]) -> int:
        """
        so T[n] = means longest subsequence till n
        T[n] = T[i] + 1 if a[i] + a[j] = a[n] 
        an element can be part of two subsequences and hence we need to store both 
        len, two indexes that sums upto this number
        T[n] = T[n-i] + 1 if arr[n-i] + a[n-i] == arr[n], a[i] = n-i
             = 0
        a number can be a result of two different fib sequences , we need to take longer
        idea here is that we do prev[j] + arr[j] 
        """

        
        mp = {}
        n = len(arr)
        for i, k in enumerate(arr):
            mp[k] = i

        dp = [[0] * n for _ in range(n)]
        max_len = 0


        for i in range(len(arr)):
            for j  in range(i):
                x = arr[i] - arr[j]  
                if x in mp and mp[x] < j:  
                    k = mp[x]
                    dp[j][i] = dp[k][j] + 1 if dp[k][j] else 3  # Ensure length starts from 2
                    max_len = max(max_len, dp[j][i])
        return max_len

        

        @cache
        def recurse(i, k1)->int:
            if i == 0:
                return 0
            k2 = arr[i]
            m = 0
            if k1-k2 < k2 and k1- k2 in mp:
                m = max(m, 1 + recurse(mp[k1-k2], k2))
            return m

        l = 0
        for i, k1 in enumerate(arr):
            for j, k2 in enumerate(arr[:i]):
                t = recurse(j, k1) 
                l = max(l, 2 + t) 
        return l if l > 2 else 0
        
            


                    







        
```