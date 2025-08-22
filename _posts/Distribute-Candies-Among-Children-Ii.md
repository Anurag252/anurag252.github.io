---
title: "Distribute Candies Among Children Ii"
date: "2025-06-01T14:49:21+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 5476 ms (6.17%) | Memory: 17.9 MB (15.75%) - LeetSync"
---

```python
class Solution:
    def distributeCandies(self, n: int, limit: int) -> int:


        """
        maybe maths way is faster
        first child can get candies in 0,1,2,3.... min(limit,n) ways
        second child can get candies in 0,1,2,3.... min(limit,n) - k ways
        x+y+z = n
        x < limit, y < limit, z = n - x - y (< limit)
        min z is from (n - 2*limit to limit) other two have max 
        z is from n - 2*limit to limit ,  x and y 
        for every val, x is y - limit as min to limit as max
        """
        res = 0
        for z in range(max(0, n - 2 * limit), min(limit, n) + 1):
            remaining = n - z
            x_min = max(0, remaining - limit)
            x_max = min(limit, remaining)
            res += max(0, x_max - x_min + 1)
        return res
        res = 0
        for z in range(n - 2*limit, limit + 1):
            res += (2*limit - z-1)
        return res



        @cache
        def distribute(candies, a,b,c, limit):
            if candies < 0:
                return 0
            if candies == 0:
                return 1
            if a and b and c:
                return 0 # everyone got candies but their sum is not n
            count = 0
            if a == False:
                for i in range(0,limit+1):
                    count += distribute(candies - i, True, False, False, limit)
                return count

            if b == False:
                for i in range(0,limit+1):
                    count += distribute(candies - i, True, True, False, limit)
                return count

            if c == False:
                for i in range(0,limit+1):
                    count += distribute(candies - i, True, True, True, limit)
                return count

        return distribute(n, False, False, False, limit)


            

        
```