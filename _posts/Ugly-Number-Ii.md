---
title: "Ugly Number Ii"
date: "2024-08-18T10:49:48+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 218 ms (12.94%) | Memory: 17 MB (6.11%) - LeetSync"
---

```python
class Solution:
    def nthUglyNumber(self, n: int) -> int:
        s = set()
        h = [1]
        temp =[1]
        while (len(h) <= 2*n):
            elem = heapq.heappop(temp)
            #print(elem)
            if elem*2 not in s:
                heapq.heappush(h, elem*2)
                heapq.heappush(temp, elem*2)
                s.add(elem*2)
            if elem*3 not in s:
                heapq.heappush(h, elem*3)
                heapq.heappush(temp, elem*3)
                s.add(elem*3)
            if elem*5 not in s:
                heapq.heappush(h, elem*5)
                heapq.heappush(temp, elem*5)
                s.add(elem*5)
        h.sort()
        #print(h)
        return h[n-1]


        
        # 2n, 2n + 2 (n > 1), 3n, 3n + 3 (n > 1), 5n, 5n + 5

        

        
```