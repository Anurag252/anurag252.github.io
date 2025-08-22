---
title: "./3490 Find The Maximum Length Of Valid Subsequence I"
date: "2025-07-16T09:18:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-the-maximum-length-of-valid-subsequence-i">Find the Maximum Length of Valid Subsequence I</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr>You are given an integer array <code>nums</code>.
<p>A <span data-keyword="subsequence-array">subsequence</span> <code>sub</code> of <code>nums</code> with length <code>x</code> is called <strong>valid</strong> if it satisfies:</p>

<ul>
	<li><code>(sub[0] + sub[1]) % 2 == (sub[1] + sub[2]) % 2 == ... == (sub[x - 2] + sub[x - 1]) % 2.</code></li>
</ul>

<p>Return the length of the <strong>longest</strong> <strong>valid</strong> subsequence of <code>nums</code>.</p>

<p>A <strong>subsequence</strong> is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [1,2,3,4]</span></p>

<p><strong>Output:</strong> <span class="example-io">4</span></p>

<p><strong>Explanation:</strong></p>

<p>The longest valid subsequence is <code>[1, 2, 3, 4]</code>.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [1,2,1,1,2,1,2]</span></p>

<p><strong>Output:</strong> 6</p>

<p><strong>Explanation:</strong></p>

<p>The longest valid subsequence is <code>[1, 2, 1, 2, 1, 2]</code>.</p>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [1,3]</span></p>

<p><strong>Output:</strong> <span class="example-io">2</span></p>

<p><strong>Explanation:</strong></p>

<p>The longest valid subsequence is <code>[1, 3]</code>.</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= nums.length &lt;= 2 * 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>7</sup></code></li>
</ul>"
---

```python
class Solution:
    def maximumLength(self, nums: List[int]) -> int:
        """
        only two possibilities -
        sum is either odd or even
        T[n] = T[n-i] + 1 , if a[n-i] + a[n] == k[n-i]
        what if find two sequences 
        sum all odds and sum all evens
        odd sum is achieved if one number is odd and other even 
        even is achived if both are even or both are odd
        idea is 
        for odd :- if curr is odd find next even , and vice versa
        for even :- if curr is even find next odd
        """

        odd_sum = 0
        even_sum = 0
        curr_even = True
        curr_odd = True

        for k in nums:
            if curr_odd and k % 2 == 0:
                odd_sum += 1

            if curr_even and k % 2 == 1:
                odd_sum += 1
            if k % 2 == 0:
                curr_even = True
                curr_odd = False
            else:
                curr_odd = True
                curr_even = False
                # current is even

        curr_even = 0
        curr_odd = 0
        temp = 0
        for k in nums:
            if k % 2 == 0:
                curr_even += 1
            else:
                curr_odd += 1
        even_sum = max(curr_even, curr_odd)
        return max(odd_sum, even_sum)
```