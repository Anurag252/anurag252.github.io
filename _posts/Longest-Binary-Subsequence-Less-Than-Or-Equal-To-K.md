---
title: "Longest Binary Subsequence Less Than Or Equal To K"
date: "2025-06-26T09:46:11+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1 ms (75.61%) | Memory: 17.9 MB (31.71%) - LeetSync"
---

```python
class Solution:
    def longestSubsequence(self, s: str, k: int) -> int:
        """
        we find the number and attach leading zeros
        the problem is we can have multiple such numbers, so we find the right most 
        number
        so essentially we find a rightmost subsequence that matches 
        k
        did not understand Q correctly, basically take all 0s
        and then take as many ones as possible
        is it possible that a zero can be left out and still get ans ? No
        as a zero before all ones must be taken and a zero after 1 cannot help get 2 1s
        """
        arr =[]
        m = k
        while(m > 0):
            arr.append(m % 2)
            m //= 2
        a = int("".join(map(str, arr[::-1])), 2)
        
        arr1 = []
        last_indx = len(s)
        for  k1 in s[::-1]:
            last_indx -= 1
            if k1 == "0":
                arr1.append(k1)
            elif k1 == "1":
                if len(arr1) > 0:
                    n = int("1" + "".join(map(str, arr1[::-1])), 2)
                else:
                    n = 0
                if n <= a:
                    arr1.append(k1)
                else:
                    break
        
        z = len(arr1)
        for k1 in s[:last_indx]:
            if k1 == "0":
                z += 1
        
        
        return z
        
        



        
```