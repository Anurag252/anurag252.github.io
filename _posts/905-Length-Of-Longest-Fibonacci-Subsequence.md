---
title: "./905 Length Of Longest Fibonacci Subsequence"
date: "2025-02-27T22:37:01+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/length-of-longest-fibonacci-subsequence">Length of Longest Fibonacci Subsequence</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>A sequence <code>x<sub>1</sub>, x<sub>2</sub>, ..., x<sub>n</sub></code> is <em>Fibonacci-like</em> if:</p>

<ul>
	<li><code>n &gt;= 3</code></li>
	<li><code>x<sub>i</sub> + x<sub>i+1</sub> == x<sub>i+2</sub></code> for all <code>i + 2 &lt;= n</code></li>
</ul>

<p>Given a <b>strictly increasing</b> array <code>arr</code> of positive integers forming a sequence, return <em>the <strong>length</strong> of the longest Fibonacci-like subsequence of</em> <code>arr</code>. If one does not exist, return <code>0</code>.</p>

<p>A <strong>subsequence</strong> is derived from another sequence <code>arr</code> by deleting any number of elements (including none) from <code>arr</code>, without changing the order of the remaining elements. For example, <code>[3, 5, 8]</code> is a subsequence of <code>[3, 4, 5, 6, 7, 8]</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> arr = [1,2,3,4,5,6,7,8]
<strong>Output:</strong> 5
<strong>Explanation:</strong> The longest subsequence that is fibonacci-like: [1,2,3,5,8].</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> arr = [1,3,7,11,12,14,18]
<strong>Output:</strong> 3
<strong>Explanation</strong>:<strong> </strong>The longest subsequence that is fibonacci-like: [1,11,12], [3,11,14] or [7,11,18].</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>3 &lt;= arr.length &lt;= 1000</code></li>
	<li><code>1 &lt;= arr[i] &lt; arr[i + 1] &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
class Solution:
    def lenLongestFibSubseq(self, arr: List[int]) -> int:
        """
        so T[n] = means longest subsequence till n
        T[n] = T[i] + 1 if a[i] + a[j] = a[n] 
        an element can be part of two subsequences and hence we need to store both 
        len, two indexes that sums upto this number
        T[n] = T[n-i] + 1 if arr[n-i] + a[n-i] == arr[n], a[i] = n-i
             = 0
        a number can be a result of two different fib sequences , we need to take longer
        idea here is that we do prev[j] + arr[j] 
        """

        
        mp = {}
        n = len(arr)
        for i, k in enumerate(arr):
            mp[k] = i

        dp = [[0] * n for _ in range(n)]
        max_len = 0


        for i in range(len(arr)):
            for j  in range(i):
                x = arr[i] - arr[j]  
                if x in mp and mp[x] < j:  
                    k = mp[x]
                    dp[j][i] = dp[k][j] + 1 if dp[k][j] else 3  # Ensure length starts from 2
                    max_len = max(max_len, dp[j][i])
        return max_len

        

        @cache
        def recurse(i, k1)->int:
            if i == 0:
                return 0
            k2 = arr[i]
            m = 0
            if k1-k2 < k2 and k1- k2 in mp:
                m = max(m, 1 + recurse(mp[k1-k2], k2))
            return m

        l = 0
        for i, k1 in enumerate(arr):
            for j, k2 in enumerate(arr[:i]):
                t = recurse(j, k1) 
                l = max(l, 2 + t) 
        return l if l > 2 else 0
        
            


                    







        
```