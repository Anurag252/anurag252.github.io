---
title: "Find Champion Ii"
date: "2024-11-26T08:08:58+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 12 ms (44.37%) | Memory: 17.6 MB (94.59%) - LeetSync"
---

```python
class Solution:
    def findChampion(self, n: int, edges: List[List[int]]) -> int:
        teams = [0] * n

        for k in edges:
            teams[k[1]] = 1
        #print(teams)
        result = -1
        for i, k in enumerate(teams):
            if k == 0 and result == -1:
                result = i
            
            elif k == 0 and result != -1:
                return -1

        return result


        
```