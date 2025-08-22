---
title: "./1500 Count Largest Group"
date: "2025-04-23T06:49:00+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-largest-group">Count Largest Group</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>You are given an integer <code>n</code>.</p>

<p>Each number from <code>1</code> to <code>n</code> is grouped according to the sum of its digits.</p>

<p>Return <em>the number of groups that have the largest size</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 13
<strong>Output:</strong> 4
<strong>Explanation:</strong> There are 9 groups in total, they are grouped according sum of its digits of numbers from 1 to 13:
[1,10], [2,11], [3,12], [4,13], [5], [6], [7], [8], [9].
There are 4 groups with largest size.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 2
<strong>Output:</strong> 2
<strong>Explanation:</strong> There are 2 groups [1], [2] of size 1.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 10<sup>4</sup></code></li>
</ul>"
---

```python
class Solution:
    def countLargestGroup(self, n: int) -> int:
        mp = {}

        for k in range(1,n+1):
            m = k
            res = 0
            while(k > 0):
                res += (k % 10)
                k = k // 10
            #print(res, k)
            if res in mp:
                mp[res].append(m)
            else:
                mp[res] = []
                mp[res].append(m)
        l  = 0
        print(mp)
        for k in mp:
            if len(mp[k]) > l:
                l = len(mp[k])
        ans = 0
        for k in mp:
            if len(mp[k]) == l:
                ans += 1

        return ans


        
```