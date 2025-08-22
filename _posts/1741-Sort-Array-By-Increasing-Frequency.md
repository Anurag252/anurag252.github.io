---
title: "./1741 Sort Array By Increasing Frequency"
date: "2024-07-23T21:34:05+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/sort-array-by-increasing-frequency">Sort Array by Increasing Frequency</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given an array of integers <code>nums</code>, sort the array in <strong>increasing</strong> order based on the frequency of the values. If multiple values have the same frequency, sort them in <strong>decreasing</strong> order.</p>

<p>Return the <em>sorted array</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,1,2,2,2,3]
<strong>Output:</strong> [3,1,1,2,2,2]
<strong>Explanation:</strong> &#39;3&#39; has a frequency of 1, &#39;1&#39; has a frequency of 2, and &#39;2&#39; has a frequency of 3.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,3,1,3,2]
<strong>Output:</strong> [1,3,3,2,2]
<strong>Explanation:</strong> &#39;2&#39; and &#39;3&#39; both have a frequency of 2, so they are sorted in decreasing order.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [-1,1,-6,4,5,-6,1,4,1]
<strong>Output:</strong> [5,-1,4,4,-6,-6,1,1,1]</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 100</code></li>
	<li><code>-100 &lt;= nums[i] &lt;= 100</code></li>
</ul>"
---

```python
class Solution:
    def frequencySort(self, nums: List[int]) -> List[int]:
        h = {}
        for k in nums:
            if k in h:
                h[k] = h[k] + 1
            else:
                h[k] = 1
        m =[]
        for k in h:
            m.append((k, h[k]))
        sign = ""
            
        m.sort(key=lambda x: (x[1], -x[0])) 
        
        result =[]
        for k in m:
            for l in range(k[1]):
                result.append(k[0])
        return result

            
        
        
```