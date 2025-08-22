---
title: "./900 Reordered Power Of 2"
date: "2025-08-11T09:30:33+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/reordered-power-of-2">Reordered Power of 2</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer <code>n</code>. We reorder the digits in any order (including the original order) such that the leading digit is not zero.</p>

<p>Return <code>true</code> <em>if and only if we can do this so that the resulting number is a power of two</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 1
<strong>Output:</strong> true
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 10
<strong>Output:</strong> false
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
class Solution:
    def reorderedPowerOf2(self, n: int) -> bool:
        l = list(str(n))
        res = []
        l.sort(key= lambda x : -int(x))
        print(l)
        k = 1
        while(k <= int("".join(l)) ):
            b = list(str(k))
            b.sort(key= lambda x : -int(x))
            if "".join(b) == "".join(l):
                return True
            k *= 2
        return False



        ln = len(str(n))

        def recurse(l):
            if len(l) == 0:
                return []
            if len(l) == 2:
                return [l[0] + l[1], l[1] + l[0]]
            if len(l) == 1:
                return [l[0]]
            res = set()
            for i,k in enumerate(l):
                a = recurse(l[:i])
                b = recurse(l[i+1:])
                print(a,b)
                if len(a) == 0:
                    a.append("")
                if len(b) == 0:
                    b.append("")
                for m in a:
                    for n1 in b:
                        res.add(m + l[i] + n1)
                for m in b:
                    for n1 in a:
                        res.add(m + l[i] + n1)
            print(res)
            return res
        for k in recurse(l):

            if  ln == len(str(int(k))):
                print(k)
                return True
        return False
        


        
```