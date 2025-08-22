---
title: "./2527 Count Subarrays With Fixed Bounds"
date: "2025-04-26T13:13:50+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-subarrays-with-fixed-bounds">Count Subarrays With Fixed Bounds</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>You are given an integer array <code>nums</code> and two integers <code>minK</code> and <code>maxK</code>.</p>

<p>A <strong>fixed-bound subarray</strong> of <code>nums</code> is a subarray that satisfies the following conditions:</p>

<ul>
	<li>The <strong>minimum</strong> value in the subarray is equal to <code>minK</code>.</li>
	<li>The <strong>maximum</strong> value in the subarray is equal to <code>maxK</code>.</li>
</ul>

<p>Return <em>the <strong>number</strong> of fixed-bound subarrays</em>.</p>

<p>A <strong>subarray</strong> is a <strong>contiguous</strong> part of an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,3,5,2,7,5], minK = 1, maxK = 5
<strong>Output:</strong> 2
<strong>Explanation:</strong> The fixed-bound subarrays are [1,3,5] and [1,3,5,2].
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,1,1,1], minK = 1, maxK = 1
<strong>Output:</strong> 10
<strong>Explanation:</strong> Every subarray of nums is a fixed-bound subarray. There are 10 possible subarrays.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i], minK, maxK &lt;= 10<sup>6</sup></code></li>
</ul>"
---

```python
class Solution:
    def countSubarrays(self, nums: List[int], minK: int, maxK: int) -> int:
        # consider the elements mark min and max
        # also mark lower and upper numbers as 0  
        # now we need sub arrays that include min amd max - a....b...c...d -> d - a 
        # other possibility is a .... b ....d....c -? no subarray 
        for i, k in enumerate(nums):
            if k < minK or k > maxK:
                nums[i] = 0

        left = 0
        right = 0
        founda = -1  # Index of last minK
        foundb = -1  # Index of last maxK
        res = 0
        nums = [0] + nums + [0]  # Add boundary zeros

        for i in range(len(nums)):
            if nums[i] == 0:
                left = i
                founda = -1
                foundb = -1
            else:
                if nums[i] == minK:
                    founda = i
                if nums[i] == maxK:
                    foundb = i
                if founda != -1 and foundb != -1:
                    res += min(founda, foundb) - left

        return res
        

            

            

            

        
```