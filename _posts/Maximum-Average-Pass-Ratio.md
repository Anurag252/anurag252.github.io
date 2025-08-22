---
title: "Maximum Average Pass Ratio"
date: "2024-12-15T11:01:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1363 ms (15.33%) | Memory: 54.3 MB (37.04%) - LeetSync"
---

```python
class Solution:
    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:
        if len(classes) == 0:
            return 0
        h = []
        for idx, k in enumerate(classes):
            heapq.heappush(h, ( -(k[1] - k[0]) / (k[1] * k[1] + k[1]), idx ))
        
        """
        a/b
        a + 1/b + 1
        a/b - (a + 1)/(b + 1)
        ab +a - ab -b / (bb + b)

        (b-a) / (bb +b)
        """
        
        while(extraStudents > 0):
            #h.sort(key=lambda x : -(x[1] - x[0]) / (x[1] * x[1] + x[1]))
            item1, idx = heapq.heappop(h)
            #print(h)
            classes[idx][0] += 1
            classes[idx][1] += 1
            heapq.heappush(h, (-(classes[idx][1] - classes[idx][0]) / (classes[idx][1] * classes[idx][1] + classes[idx][1]) , idx))
            extraStudents -= 1
        result = 0
        
        for k in h:
            result += (classes[k[1]][0]/classes[k[1]][1] * 100)
        #print(h, result)
        return (result / len(h)) / 100


        # at each level find the max change that can occur by adding one student
"""
        0.5 0.6 1
        0.66 0.6 1
        0.5 0.66
        """
```