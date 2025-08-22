---
title: "./2255 Minimum Swaps To Group All 1S Together Ii"
date: "2024-08-02T08:40:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii">Minimum Swaps to Group All 1's Together II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>A <strong>swap</strong> is defined as taking two <strong>distinct</strong> positions in an array and swapping the values in them.</p>

<p>A <strong>circular</strong> array is defined as an array where we consider the <strong>first</strong> element and the <strong>last</strong> element to be <strong>adjacent</strong>.</p>

<p>Given a <strong>binary</strong> <strong>circular</strong> array <code>nums</code>, return <em>the minimum number of swaps required to group all </em><code>1</code><em>&#39;s present in the array together at <strong>any location</strong></em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [0,1,0,1,1,0,0]
<strong>Output:</strong> 1
<strong>Explanation:</strong> Here are a few of the ways to group all the 1&#39;s together:
[0,<u>0</u>,<u>1</u>,1,1,0,0] using 1 swap.
[0,1,<u>1</u>,1,<u>0</u>,0,0] using 1 swap.
[1,1,0,0,0,0,1] using 2 swaps (using the circular property of the array).
There is no way to group all 1&#39;s together with 0 swaps.
Thus, the minimum number of swaps required is 1.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [0,1,1,1,0,0,1,1,0]
<strong>Output:</strong> 2
<strong>Explanation:</strong> Here are a few of the ways to group all the 1&#39;s together:
[1,1,1,0,0,0,0,1,1] using 2 swaps (using the circular property of the array).
[1,1,1,1,1,0,0,0,0] using 2 swaps.
There is no way to group all 1&#39;s together with 0 or 1 swaps.
Thus, the minimum number of swaps required is 2.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,1,0,0,1]
<strong>Output:</strong> 0
<strong>Explanation:</strong> All the 1&#39;s are already grouped together due to the circular property of the array.
Thus, the minimum number of swaps required is 0.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>nums[i]</code> is either <code>0</code> or <code>1</code>.</li>
</ul>"
---

```python
class Solution:
    def minSwaps(self, nums: List[int]) -> int:
        op1 = self.min_swaps_helper(nums, 0)  # Grouping all 0s together
        op2 = self.min_swaps_helper(nums, 1)  # Grouping all 1s together
        return min(op1, op2)

    def min_swaps_helper(self, data: List[int], val: int) -> int:
        length = len(data)
        right_suffix_sum = [0] * (length + 1)

        # Construct the suffix sum array for counting opposite values
        # (val ^ 1)
        for i in range(length - 1, -1, -1):
            right_suffix_sum[i] = right_suffix_sum[i + 1]
            if data[i] == (val ^ 1):
                right_suffix_sum[i] += 1

        # Total zeros in the array if `val` is 1 (or vice versa)
        total_swaps_needed = right_suffix_sum[0]
        # Track current number of required swaps in the current segment
        current_swap_count = 0
        minimum_swaps = (
            total_swaps_needed - right_suffix_sum[length - total_swaps_needed]
        )

        # Iterate to find the minimum swaps by sliding
        # the potential block of grouped `val`
        for i in range(total_swaps_needed):
            if data[i] == (val ^ 1):
                current_swap_count += 1
            remaining = total_swaps_needed - i - 1
            required_swaps = ((i + 1) - current_swap_count) + (
                remaining - right_suffix_sum[length - remaining]
            )
            minimum_swaps = min(minimum_swaps, required_swaps)
        return minimum_swaps
```