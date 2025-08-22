---
title: "Minimum Cost For Tickets"
date: "2024-12-31T08:45:04+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 4 ms (59.59%) | Memory: 18.1 MB (13.07%) - LeetSync"
---

```python
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        """
        T[i] = min(T[i-1] + a, T[i-7] + b,T[i-30] + c,T[i]) if i in days 
             = 
        = a + cost( max(i, k + 1))
        = b + cost(max(i + 6, k + 1))
        = c + cost(max(i + 29, k + 1))
         T[i,d] = min(a + T[d-1], b + T[d-7], c + T[d-30])
                    T[d-1]
        """
       


        freq = {}
        for i, k in enumerate(days):
            freq[k] = i

        T = [0] * 366

        for k, i in enumerate(range(min(days), max(days) + 1)):
            
            if i in freq:
                T[i] = (min(costs[0] + T[i-1] if i- 1 >= 0 else costs[0] , costs[1] + T[i-7] if i-7 >= 0 else costs[1], costs[2] + T[i-30] if i-30 >= 0 else costs[2]))
            else:
                T[i] = (T[i-1] if i-1 >= 0 else 0)
        T= T[min(days):max(days) + 1]
        return T[-1]


        m = max(days)
        @cache
        def recurse(i, p):
            if p > m :
                return 0
            if p not in freq:
                return recurse(i,p+1)
            return min(costs[0] +  recurse(i ,p+1) , costs[1] + recurse( i,p + 7), costs[2] + recurse( i,p + 30))
        return recurse(0, days[0])

        
```