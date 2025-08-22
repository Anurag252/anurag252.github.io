---
title: "Check If N And Its Double Exist"
date: "2024-12-01T10:44:02+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.4 MB (5.25%) - LeetSync"
---

```python
class Solution:
    def checkIfExist(self, arr: List[int]) -> bool:
        dic = set()

        for k in arr:
            
            if k in dic:
                return True
            
            #print(dic)
            if k % 2 == 0: 
                dic.add(int(k//2))
            dic.add(k*2)
        
        return False



            

        
```