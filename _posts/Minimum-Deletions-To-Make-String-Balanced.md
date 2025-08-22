---
title: "Minimum Deletions To Make String Balanced"
date: "2024-07-30T06:38:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 797 ms (11.67%) | Memory: 22.2 MB (13.67%) - LeetSync"
---

```python
class Solution:
    def minimumDeletions(self, s: str) -> int:
        la = [0] * len(s)
        lb = [0] * len(s)
        i = 0
        temp = 0
        for k in s:
            la[i] = temp
            if k == 'b':
                temp += 1
            
            i += 1
        j = len(s) - 1
        temp = 0
        for k in range(len(s)):
            lb[j] = temp
            if s[len(s) -k-1] == 'a':
                temp += 1
            
            j -= 1
        
        
        result = 100000
        for k in range(len(s)):
            result = min(result, la[k] + lb[k])
        return result


        # for every a at i , find number of bs to left
        # for every b at i , find number of as to right. 
        # navigate each array one by one, 
        # we can remove any element and then all numbers to left or right reduce by 1,
        # we can remove the number altogather
        #0,0,b,1,b,b,3,0
        #a,a,2,a,1,1,a,0
        
```