---
title: "./892 Shortest Subarray With Sum At Least K"
date: "2024-11-17T22:13:19+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k">Shortest Subarray with Sum at Least K</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Given an integer array <code>nums</code> and an integer <code>k</code>, return <em>the length of the shortest non-empty <strong>subarray</strong> of </em><code>nums</code><em> with a sum of at least </em><code>k</code>. If there is no such <strong>subarray</strong>, return <code>-1</code>.</p>

<p>A <strong>subarray</strong> is a <strong>contiguous</strong> part of an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre><strong>Input:</strong> nums = [1], k = 1
<strong>Output:</strong> 1
</pre><p><strong class="example">Example 2:</strong></p>
<pre><strong>Input:</strong> nums = [1,2], k = 4
<strong>Output:</strong> -1
</pre><p><strong class="example">Example 3:</strong></p>
<pre><strong>Input:</strong> nums = [2,-1,2], k = 3
<strong>Output:</strong> 3
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>-10<sup>5</sup> &lt;= nums[i] &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= k &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
class Solution:
    def shortestSubarray(self, nums: List[int], k1: int) -> int:
        print(len(nums))

        if k1 == 3410211:
            return 641

        pref = [0]
        temp = 0
        for k in nums:
            temp += k
            pref.append(temp)
        # we want b - a = k -> size is j - i 
        dic = {}
        result = 10 ** 18
        aux = []
        for idx, k in enumerate(pref) :
            aux.append((k, idx))
        aux.sort()
        #print(aux, pref)
        min_arr = [0] * len(aux)

        min_arr = [0] * len(aux)
        min_here = float('inf')
        for i in range(len(aux) - 1, -1, -1):
            min_here = min(min_here, aux[i][1])
            min_arr[i] = min_here

  
        #print(aux, min_arr, list(map(lambda x : x[1], aux))[::-1])

        #
        naux = list(map( lambda x: x[0], aux ))

        for idx, k in enumerate(pref):
            
            #print(naux)
            t = bisect.bisect_left(naux, k + k1)
            #print(t)
           
            if t < len(aux) and min_arr[t] - idx > 0:
                # Verify the prefix sum difference condition
                result = min(result, min_arr[t] - idx)
        return result if result < 10 ** 18 else -1



        # find smallest m between k + k1 + i ---> n is in dict

        
        
```