---
title: "./2432 Number Of Zero Filled Subarrays"
date: "2025-08-19T13:59:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/number-of-zero-filled-subarrays">Number of Zero-Filled Subarrays</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an integer array <code>nums</code>, return <em>the number of <strong>subarrays</strong> filled with </em><code>0</code>.</p>

<p>A <strong>subarray</strong> is a contiguous non-empty sequence of elements within an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,3,0,0,2,0,0,4]
<strong>Output:</strong> 6
<strong>Explanation:</strong> 
There are 4 occurrences of [0] as a subarray.
There are 2 occurrences of [0,0] as a subarray.
There is no occurrence of a subarray with a size more than 2 filled with 0. Therefore, we return 6.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [0,0,0,2,0,0]
<strong>Output:</strong> 9
<strong>Explanation:
</strong>There are 5 occurrences of [0] as a subarray.
There are 3 occurrences of [0,0] as a subarray.
There is 1 occurrence of [0,0,0] as a subarray.
There is no occurrence of a subarray with a size more than 3 filled with 0. Therefore, we return 9.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,10,2019]
<strong>Output:</strong> 0
<strong>Explanation:</strong> There is no subarray filled with 0. Therefore, we return 0.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>-10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
class Solution:
    def zeroFilledSubarray(self, nums: List[int]) -> int:
        """
        count the number of contiguous 0s
        and store then in arr
        sum all values from 1 to n
        """
        res = []
        prev = False
        temp = 0
        for k in nums:
            if k == 0:
                temp += 1
            else:
                res.append(temp)
                temp = 0
        if temp > 0:
            res.append(temp)
        ans = 0
        print(res)
        for k in res:
            ans += int((k*(k+1))/2)
        return ans




        
```