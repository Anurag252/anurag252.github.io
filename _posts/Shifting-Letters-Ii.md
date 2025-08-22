---
title: "Shifting Letters Ii"
date: "2025-01-05T07:32:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 183 ms (10.03%) | Memory: 41.6 MB (13.37%) - LeetSync"
---

```python
class Solution:
    def shiftingLetters(self, s: str, shifts: List[List[int]]) -> str:
        arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

        arr1 = [0] * (len(s)+1)
        s1 = []

        shifts.sort(key=lambda x : (x[0], x[1]) )
        print(shifts)
        a = -1
        b = -1
        curr = 0

        for (k0, k1,k2) in shifts:
            arr1[k0] += (1 if k2 > 0 else -1)
            arr1[k1+1] += (-1 if k2 > 0 else 1)
            
            """
            if k2 == 0:
                for m in range(k0,k1+1):
                    arr1[m] -= 1
            else:
                for m in range(k0,k1+1):
                    arr1[m] += 1
            """
        pref = []
        temp = 0
        for a in arr1:
            temp += a
            pref.append(temp)


        def repl(idm, idx, curr):
            return arr[(idx + pref[idm]) % 26]
        curr = 0
        for idm, k in enumerate(s):
            idx = ord(k) - ord('a')
            s1.append(repl(idm, idx, curr))
        return "".join(s1)
            

        
```