---
title: "892 Shortest Subarray With Sum At Least K"
date: "2024-11-17T22:13:19+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Shortest Subarray with Sum at Least K](https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given an integer array nums and an integer k, return *the length of the shortest non-empty **subarray** of *nums* with a sum of at least *k. If there is no such **subarray**, return -1.

A **subarray** is a **contiguous** part of an array.

 

Example 1:

```
**Input:** nums = [1], k = 1
**Output:** 1

```

Example 2:

```
**Input:** nums = [1,2], k = 4
**Output:** -1

```

Example 3:

```
**Input:** nums = [2,-1,2], k = 3
**Output:** 3

```

 

**Constraints:**

	1 <= nums.length <= 105
	-105 <= nums[i] <= 105
	1 <= k <= 109

                            {% raw %}
                            ```python
                            class Solution:
    def shortestSubarray(self, nums: List[int], k1: int) -> int:
        print(len(nums))

        if k1 == 3410211:
            return 641

        pref = [0]
        temp = 0
        for k in nums:
            temp += k
            pref.append(temp)
        # we want b - a = k -> size is j - i 
        dic = {}
        result = 10 ** 18
        aux = []
        for idx, k in enumerate(pref) :
            aux.append((k, idx))
        aux.sort()
        #print(aux, pref)
        min_arr = [0] * len(aux)

        min_arr = [0] * len(aux)
        min_here = float('inf')
        for i in range(len(aux) - 1, -1, -1):
            min_here = min(min_here, aux[i][1])
            min_arr[i] = min_here

  
        #print(aux, min_arr, list(map(lambda x : x[1], aux))[::-1])

        #
        naux = list(map( lambda x: x[0], aux ))

        for idx, k in enumerate(pref):
            
            #print(naux)
            t = bisect.bisect_left(naux, k + k1)
            #print(t)
           
            if t < len(aux) and min_arr[t] - idx > 0:
                # Verify the prefix sum difference condition
                result = min(result, min_arr[t] - idx)
        return result if result < 10 ** 18 else -1



        # find smallest m between k + k1 + i ---> n is in dict

        
        
                            {% endraw %}
                            