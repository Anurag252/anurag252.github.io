---
title: "./3201 Distribute Candies Among Children Ii"
date: "2025-06-01T14:49:21+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/distribute-candies-among-children-ii">Distribute Candies Among Children II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given two positive integers <code>n</code> and <code>limit</code>.</p>

<p>Return <em>the <strong>total number</strong> of ways to distribute </em><code>n</code> <em>candies among </em><code>3</code><em> children such that no child gets more than </em><code>limit</code><em> candies.</em></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 5, limit = 2
<strong>Output:</strong> 3
<strong>Explanation:</strong> There are 3 ways to distribute 5 candies such that no child gets more than 2 candies: (1, 2, 2), (2, 1, 2) and (2, 2, 1).
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 3, limit = 3
<strong>Output:</strong> 10
<strong>Explanation:</strong> There are 10 ways to distribute 3 candies such that no child gets more than 3 candies: (0, 0, 3), (0, 1, 2), (0, 2, 1), (0, 3, 0), (1, 0, 2), (1, 1, 1), (1, 2, 0), (2, 0, 1), (2, 1, 0) and (3, 0, 0).
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 10<sup>6</sup></code></li>
	<li><code>1 &lt;= limit &lt;= 10<sup>6</sup></code></li>
</ul>"
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