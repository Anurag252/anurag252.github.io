---
title: "./1889 Check If Number Is A Sum Of Powers Of Three"
date: "2025-03-04T15:05:55+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/check-if-number-is-a-sum-of-powers-of-three">Check if Number is a Sum of Powers of Three</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an integer <code>n</code>, return <code>true</code> <em>if it is possible to represent </em><code>n</code><em> as the sum of distinct powers of three.</em> Otherwise, return <code>false</code>.</p>

<p>An integer <code>y</code> is a power of three if there exists an integer <code>x</code> such that <code>y == 3<sup>x</sup></code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 12
<strong>Output:</strong> true
<strong>Explanation:</strong> 12 = 3<sup>1</sup> + 3<sup>2</sup>
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 91
<strong>Output:</strong> true
<strong>Explanation:</strong> 91 = 3<sup>0</sup> + 3<sup>2</sup> + 3<sup>4</sup>
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> n = 21
<strong>Output:</strong> false
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 10<sup>7</sup></code></li>
</ul>"
---

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

        
```