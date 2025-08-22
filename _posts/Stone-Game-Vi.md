---
title: "Stone Game Vi"
date: "2024-06-03T09:50:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1063 ms (11.82%) | Memory: 28.5 MB (66.82%) - LeetSync"
---

```python
class Solution:
    def stoneGameVI(self, aliceValues: List[int], bobValues: List[int]) -> int:
        new_list = []
        for k,l in zip(aliceValues, bobValues):
            new_list.append((k , l))
        print(new_list)
        new_list.sort(key = lambda  x : sum(x), reverse = True )
        print(new_list)
        a = 0
        b = 0
        is_odd = True
        for k in new_list:
            if is_odd:
                a= a + k[0]
                is_odd = False
            else:
                b = b + k[1]
                is_odd = True
        if a > b:
            return 1
        if a < b :
            return -1
        return 0

        
```