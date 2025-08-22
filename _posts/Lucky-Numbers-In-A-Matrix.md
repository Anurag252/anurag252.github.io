---
title: "Lucky Numbers In A Matrix"
date: "2024-07-19T05:15:30+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 118 ms (27.26%) | Memory: 16.9 MB (15.89%) - LeetSync"
---

```python
class Solution:
    def luckyNumbers (self, matrix: List[List[int]]) -> List[int]:
        result =[]
        d = set()
        for k in matrix:
            d.add(min(k))
        elem = 0
        for l in range(len(matrix[0])):
            elem = 0
            for k in range(len(matrix)):
                elem = max(matrix[k][l], elem)
            if elem in d:
                result.append(elem)
        return result


            

        
```