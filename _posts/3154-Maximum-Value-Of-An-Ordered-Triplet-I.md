---
title: "./3154 Maximum Value Of An Ordered Triplet I"
date: "2025-04-02T08:01:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-value-of-an-ordered-triplet-i">Maximum Value of an Ordered Triplet I</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>You are given a <strong>0-indexed</strong> integer array <code>nums</code>.</p>

<p>Return <em><strong>the maximum value over all triplets of indices</strong></em> <code>(i, j, k)</code> <em>such that</em> <code>i &lt; j &lt; k</code>. If all such triplets have a negative value, return <code>0</code>.</p>

<p>The <strong>value of a triplet of indices</strong> <code>(i, j, k)</code> is equal to <code>(nums[i] - nums[j]) * nums[k]</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [12,6,1,2,7]
<strong>Output:</strong> 77
<strong>Explanation:</strong> The value of the triplet (0, 2, 4) is (nums[0] - nums[2]) * nums[4] = 77.
It can be shown that there are no ordered triplets of indices with a value greater than 77. 
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,10,3,4,19]
<strong>Output:</strong> 133
<strong>Explanation:</strong> The value of the triplet (1, 2, 4) is (nums[1] - nums[2]) * nums[4] = 133.
It can be shown that there are no ordered triplets of indices with a value greater than 133.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3]
<strong>Output:</strong> 0
<strong>Explanation:</strong> The only ordered triplet of indices (0, 1, 2) has a negative value of (nums[0] - nums[1]) * nums[2] = -3. Hence, the answer would be 0.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>3 &lt;= nums.length &lt;= 100</code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>6</sup></code></li>
</ul>"
---

```python
class Solution:
    def maximumTripletValue(self, nums: List[int]) -> int:
        pos = [0] * len(nums)
        pos1 = [0] * len(nums)
        mn = [0] * len(nums)
        
        temp1 = 0
        temp2 = 0
        temp3 = 1000
        for i, k in enumerate(nums[::-1]):
            if temp1 < k:
                temp1 = k
            pos[len(nums) - i-1] = temp1
        
        for i, k in enumerate(nums):
            if temp2 < k:
                temp2 = k
            pos1[i] = temp2

        for i, k in enumerate(nums[::-1]):
            if temp3 > k:
                temp3 = k
            mn[len(nums) - i-1] = temp3
            
        print(pos, pos1, mn)
        mx = 0

        for i , k in enumerate(nums):
            if i - 1 >= 0 and i + 1 < len(nums):
                mx = max(mx, (pos1[i-1] - k) * pos[i+1])
        return mx

        
```