---
title: "./1849 Maximum Absolute Sum Of Any Subarray"
date: "2025-02-26T07:13:44+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray">Maximum Absolute Sum of Any Subarray</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer array <code>nums</code>. The <strong>absolute sum</strong> of a subarray <code>[nums<sub>l</sub>, nums<sub>l+1</sub>, ..., nums<sub>r-1</sub>, nums<sub>r</sub>]</code> is <code>abs(nums<sub>l</sub> + nums<sub>l+1</sub> + ... + nums<sub>r-1</sub> + nums<sub>r</sub>)</code>.</p>

<p>Return <em>the <strong>maximum</strong> absolute sum of any <strong>(possibly empty)</strong> subarray of </em><code>nums</code>.</p>

<p>Note that <code>abs(x)</code> is defined as follows:</p>

<ul>
	<li>If <code>x</code> is a negative integer, then <code>abs(x) = -x</code>.</li>
	<li>If <code>x</code> is a non-negative integer, then <code>abs(x) = x</code>.</li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,-3,2,3,-4]
<strong>Output:</strong> 5
<strong>Explanation:</strong> The subarray [2,3] has absolute sum = abs(2+3) = abs(5) = 5.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,-5,1,-4,3,-2]
<strong>Output:</strong> 8
<strong>Explanation:</strong> The subarray [-5,1,-4] has absolute sum = abs(-5+1-4) = abs(-8) = 8.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>-10<sup>4</sup> &lt;= nums[i] &lt;= 10<sup>4</sup></code></li>
</ul>"
---

```python
class Solution:
    def maxAbsoluteSum(self, nums: List[int]) -> int:
        # idea is that every time a +ve appears
        # i include it in sum 
        # but if a negative appears , sum until previous number was better 
        # I start fresh ,-> no abs sum can have negative
        # prefix sum , take non absolute sums till index i
        # and then find  index j at max distt from it and find absolute.
        # 2,-3,-2,-6,-3,-5
        # 
        pref_sum = []
        temp = 0
        for k in nums:
            temp += k
            pref_sum.append(temp)

        max_arr = []
        min_arr =[]
        ma = -100000
        mi = 100000
        for i, k in enumerate(pref_sum):
            ma = max(ma, k)
            mi = min(mi, k)
            max_arr.append(ma)
            min_arr.append(mi)
        #print(pref_sum, max_arr, min_arr)
        res = 0
        for i, k in enumerate(pref_sum):
                res = max(res, abs(k - max_arr[i]) , abs(k - min_arr[i]), abs(k))
        return res


        
```