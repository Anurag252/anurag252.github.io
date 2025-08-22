---
            title: "3201 Distribute Candies Among Children Ii"
            date: "2025-06-01T14:49:21+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Distribute Candies Among Children II](https://leetcode.com/problems/distribute-candies-among-children-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two positive integers n and limit.

Return *the **total number** of ways to distribute *n *candies among *3* children such that no child gets more than *limit* candies.*

 

Example 1:

```

**Input:** n = 5, limit = 2
**Output:** 3
**Explanation:** There are 3 ways to distribute 5 candies such that no child gets more than 2 candies: (1, 2, 2), (2, 1, 2) and (2, 2, 1).

```

Example 2:

```

**Input:** n = 3, limit = 3
**Output:** 10
**Explanation:** There are 10 ways to distribute 3 candies such that no child gets more than 3 candies: (0, 0, 3), (0, 1, 2), (0, 2, 1), (0, 3, 0), (1, 0, 2), (1, 1, 1), (1, 2, 0), (2, 0, 1), (2, 1, 0) and (3, 0, 0).

```

 

**Constraints:**

	1 <= n <= 106
	1 <= limit <= 106

{% raw %}


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


            

        


{% endraw %}
```
