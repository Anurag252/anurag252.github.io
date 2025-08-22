---
title: "Number Of Sub Arrays With Odd Sum"
date: "2025-02-25T06:09:47+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 260 ms (5.11%) | Memory: 31.2 MB (5.11%) - LeetSync"
---

```python
class Solution:
    def numOfSubarrays(self, arr: List[int]) -> int:
        # odd sum is odd + even, but odd + odd is even
        # prefix sum can give sum till n
        # but diff between i and j of prefix sum may not work fo 10^5 input
        # if we have an even at i in prefix sum, we need a preious odd
        # if we have an add at i in prefix sum, we need a preious even
        # so at every i , if its even see total odd at i-1 , add diff to result

        pref_sum = []
        temp = 0
        for k in arr:
            temp += k
            pref_sum.append(temp)
        
        odds = []
        evens = []
        odd = 0
        even = 0
        for k in pref_sum:
            if k % 2 == 0:
                even += 1
            else:
                odd += 1 # check zero
            odds.append(odd)
            evens.append(even)
        
        res = 0
        for i, k in enumerate(pref_sum):
            if i == 0:
                continue
            if k % 2 == 0:
                res += odds[i-1]
            else:
                res += evens[i-1]
            res = res % (pow(10,9)+ 7)

        return (res + odd) % (pow(10,9) + 7)
        


        
```