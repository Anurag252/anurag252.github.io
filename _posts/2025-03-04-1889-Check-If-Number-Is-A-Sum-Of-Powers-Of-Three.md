---
            title: "1889 Check If Number Is A Sum Of Powers Of Three"
            date: "2025-03-04T15:05:55+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Check if Number is a Sum of Powers of Three](https://leetcode.com/problems/check-if-number-is-a-sum-of-powers-of-three) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer n, return true *if it is possible to represent *n* as the sum of distinct powers of three.* Otherwise, return false.

An integer y is a power of three if there exists an integer x such that y == 3x.

 

Example 1:

```

**Input:** n = 12
**Output:** true
**Explanation:** 12 = 31 + 32

```

Example 2:

```

**Input:** n = 91
**Output:** true
**Explanation:** 91 = 30 + 32 + 34

```

Example 3:

```

**Input:** n = 21
**Output:** false

```

 

**Constraints:**

	1 <= n <= 107

            {% raw %}
            ```python
            class Solution:
    def checkPowersOfThree(self, n: int) -> bool:
        
        mp = set()
        cache = {}

        def recurse(n, mp):
            if n < 0:
                return False
            #print(cache)
            if n in cache:
                return cache[n]
            if n == 0:
                return True
            
            k = 0
            while math.pow(3,k) <= n:
                if k in mp:
                    k += 1
                    continue
                mp.add(k)
                if recurse(n-math.pow(3,k) , mp):
                    cache[n] = True
                    return True
                mp.remove(k)
                k += 1
            cache[n] = False
            return False
        res = recurse(n, mp)
        #print(cache)
        return res

        
            {% endraw %}
            