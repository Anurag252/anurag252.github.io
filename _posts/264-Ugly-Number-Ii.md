---
title: "./264 Ugly Number Ii"
date: "2024-08-18T10:49:48+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/ugly-number-ii">Ugly Number II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>An <strong>ugly number</strong> is a positive integer whose prime factors are limited to <code>2</code>, <code>3</code>, and <code>5</code>.</p>

<p>Given an integer <code>n</code>, return <em>the</em> <code>n<sup>th</sup></code> <em><strong>ugly number</strong></em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 10
<strong>Output:</strong> 12
<strong>Explanation:</strong> [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 1
<strong>Output:</strong> 1
<strong>Explanation:</strong> 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 1690</code></li>
</ul>"
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