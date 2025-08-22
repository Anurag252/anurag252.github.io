---
title: "Make String A Subsequence Using Cyclic Increments"
date: "2024-12-04T15:14:42+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 2497 ms (5.56%) | Memory: 17.9 MB (5.69%) - LeetSync"
---

```python
class Solution:
    def canMakeSubsequence(self, s1: str, s2: str) -> bool:
        arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','a']

        idx1 = 0
        idx2 = 0
        while(True):
            #print(s1, s2)
           
            if s1[idx1:] == s2[idx2:]:
                return True
            if len(s2[idx2:]) == 0:
                return True
            if len(s1[idx1:]) < len(s2[idx2:]):
                return False
            k1 = s1[idx1]
            k2 = s2[idx2]

           
            if k1 != k2 and arr[ord(k1) - 97 + 1] != arr[ord(k2) - 97]:
                    idx1 += 1
                    continue # skip the char

            if k1 == k2  :
                    idx1 += 1
                    idx2 += 1
                    continue
                #print(arr[ord(k1) - 97 + 1] , arr[ord(k2) - 97])
            if arr[ord(k1) - 97 + 1] == arr[ord(k2) - 97] :
                    idx1 += 1
                    idx2 += 1
                    continue
        


                




```