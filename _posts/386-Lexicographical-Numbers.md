---
title: "./386 Lexicographical Numbers"
date: "2025-06-08T18:06:30+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/lexicographical-numbers">Lexicographical Numbers</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an integer <code>n</code>, return all the numbers in the range <code>[1, n]</code> sorted in lexicographical order.</p>

<p>You must write an algorithm that runs in&nbsp;<code>O(n)</code>&nbsp;time and uses <code>O(1)</code> extra space.&nbsp;</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre><strong>Input:</strong> n = 13
<strong>Output:</strong> [1,10,11,12,13,2,3,4,5,6,7,8,9]
</pre><p><strong class="example">Example 2:</strong></p>
<pre><strong>Input:</strong> n = 2
<strong>Output:</strong> [1,2]
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 5 * 10<sup>4</sup></code></li>
</ul>"
---

```python
class Solution:
    def lexicalOrder(self, n: int) -> List[int]:

        def recurse(m):
            if m > n :
                return
            res = [m]
            for i in range(0,10):
                t = recurse(m * (10) + i)
                if t != None:
                    res += t
            return res
        a = []
        for m in range(1,10):   
            l = recurse(m)
            if l != None:
                a += l
        return a
        
```