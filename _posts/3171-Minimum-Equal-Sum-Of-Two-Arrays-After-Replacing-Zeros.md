---
title: "./3171 Minimum Equal Sum Of Two Arrays After Replacing Zeros"
date: "2025-05-10T22:20:08+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-equal-sum-of-two-arrays-after-replacing-zeros">Minimum Equal Sum of Two Arrays After Replacing Zeros</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given two arrays <code>nums1</code> and <code>nums2</code> consisting of positive integers.</p>

<p>You have to replace <strong>all</strong> the <code>0</code>&#39;s in both arrays with <strong>strictly</strong> positive integers such that the sum of elements of both arrays becomes <strong>equal</strong>.</p>

<p>Return <em>the <strong>minimum</strong> equal sum you can obtain, or </em><code>-1</code><em> if it is impossible</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums1 = [3,2,0,1,0], nums2 = [6,5,0]
<strong>Output:</strong> 12
<strong>Explanation:</strong> We can replace 0&#39;s in the following way:
- Replace the two 0&#39;s in nums1 with the values 2 and 4. The resulting array is nums1 = [3,2,2,1,4].
- Replace the 0 in nums2 with the value 1. The resulting array is nums2 = [6,5,1].
Both arrays have an equal sum of 12. It can be shown that it is the minimum sum we can obtain.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums1 = [2,0,2,0], nums2 = [1,4]
<strong>Output:</strong> -1
<strong>Explanation:</strong> It is impossible to make the sum of both arrays equal.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums1.length, nums2.length &lt;= 10<sup>5</sup></code></li>
	<li><code>0 &lt;= nums1[i], nums2[i] &lt;= 10<sup>6</sup></code></li>
</ul>"
---

```python
class Solution:
    def minSum(self, nums1: List[int], nums2: List[int]) -> int:
        
        num_of_zeros_a = 0
        num_of_zeros_b = 0

        for k in nums1:
            if k == 0:
                num_of_zeros_a += 1

        for k in nums2:
            if k == 0:
                num_of_zeros_b += 1

        """
            its not possible if one side is > and other side does not have 0
        """
        if num_of_zeros_b == 0 and num_of_zeros_a == 0 and sum(nums1) != sum(nums2):
            return -1
        
        if sum(nums1) + num_of_zeros_a > sum(nums2) + num_of_zeros_b:
            if num_of_zeros_b == 0 and num_of_zeros_a > 0:
                return -1
            return sum(nums1) + num_of_zeros_a
        else:
            if num_of_zeros_a == 0 and num_of_zeros_b > 0:
                return -1
            return sum(nums2) + num_of_zeros_b


        
```