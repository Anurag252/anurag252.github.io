---
title: "./3394 Minimum Array End"
date: "2024-11-09T09:04:30+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-array-end">Minimum Array End</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given two integers <code>n</code> and <code>x</code>. You have to construct an array of <strong>positive</strong> integers <code>nums</code> of size <code>n</code> where for every <code>0 &lt;= i &lt; n - 1</code>, <code>nums[i + 1]</code> is <strong>greater than</strong> <code>nums[i]</code>, and the result of the bitwise <code>AND</code> operation between all elements of <code>nums</code> is <code>x</code>.</p>

<p>Return the <strong>minimum</strong> possible value of <code>nums[n - 1]</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">n = 3, x = 4</span></p>

<p><strong>Output:</strong> <span class="example-io">6</span></p>

<p><strong>Explanation:</strong></p>

<p><code>nums</code> can be <code>[4,5,6]</code> and its last element is 6.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">n = 2, x = 7</span></p>

<p><strong>Output:</strong> <span class="example-io">15</span></p>

<p><strong>Explanation:</strong></p>

<p><code>nums</code> can be <code>[7,15]</code> and its last element is 15.</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n, x &lt;= 10<sup>8</sup></code></li>
</ul>"
---

```python
class Solution:
    def minEnd(self, n: int, x: int) -> int:
        # Identify positions of zero bits in `x`
        zero_positions = []
        bit_position = 0
        temp_x = x

        # Record all positions where `x` has zero bits
        while temp_x > 0 or bit_position < 64:  # Considering 32-bit integers for general cases
            if (temp_x & 1) == 0:
                zero_positions.append(bit_position)
            temp_x >>= 1
            bit_position += 1

        # Generate the nth valid number by filling zero bit positions in all combinations up to `n`
        result = x
        for i in range(len(zero_positions)):
            # If the i-th bit in `n-1` is set, we flip the corresponding zero bit position in `result`
            if (n - 1) & (1 << i):
                result |= (1 << zero_positions[i])

        return result

```