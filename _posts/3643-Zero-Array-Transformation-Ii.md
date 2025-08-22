---
title: "./3643 Zero Array Transformation Ii"
date: "2025-03-13T11:01:29+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/zero-array-transformation-ii">Zero Array Transformation II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer array <code>nums</code> of length <code>n</code> and a 2D array <code>queries</code> where <code>queries[i] = [l<sub>i</sub>, r<sub>i</sub>, val<sub>i</sub>]</code>.</p>

<p>Each <code>queries[i]</code> represents the following action on <code>nums</code>:</p>

<ul>
	<li>Decrement the value at each index in the range <code>[l<sub>i</sub>, r<sub>i</sub>]</code> in <code>nums</code> by <strong>at most</strong> <code>val<sub>i</sub></code>.</li>
	<li>The amount by which each value is decremented<!-- notionvc: b232c9d9-a32d-448c-85b8-b637de593c11 --> can be chosen <strong>independently</strong> for each index.</li>
</ul>

<p>A <strong>Zero Array</strong> is an array with all its elements equal to 0.</p>

<p>Return the <strong>minimum</strong> possible <strong>non-negative</strong> value of <code>k</code>, such that after processing the first <code>k</code> queries in <strong>sequence</strong>, <code>nums</code> becomes a <strong>Zero Array</strong>. If no such <code>k</code> exists, return -1.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [2,0,2], queries = [[0,2,1],[0,2,1],[1,1,3]]</span></p>

<p><strong>Output:</strong> <span class="example-io">2</span></p>

<p><strong>Explanation:</strong></p>

<ul>
	<li><strong>For i = 0 (l = 0, r = 2, val = 1):</strong>

	<ul>
		<li>Decrement values at indices <code>[0, 1, 2]</code> by <code>[1, 0, 1]</code> respectively.</li>
		<li>The array will become <code>[1, 0, 1]</code>.</li>
	</ul>
	</li>
	<li><strong>For i = 1 (l = 0, r = 2, val = 1):</strong>
	<ul>
		<li>Decrement values at indices <code>[0, 1, 2]</code> by <code>[1, 0, 1]</code> respectively.</li>
		<li>The array will become <code>[0, 0, 0]</code>, which is a Zero Array. Therefore, the minimum value of <code>k</code> is 2.</li>
	</ul>
	</li>
</ul>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [4,3,2,1], queries = [[1,3,2],[0,2,1]]</span></p>

<p><strong>Output:</strong> <span class="example-io">-1</span></p>

<p><strong>Explanation:</strong></p>

<ul>
	<li><strong>For i = 0 (l = 1, r = 3, val = 2):</strong>

	<ul>
		<li>Decrement values at indices <code>[1, 2, 3]</code> by <code>[2, 2, 1]</code> respectively.</li>
		<li>The array will become <code>[4, 1, 0, 0]</code>.</li>
	</ul>
	</li>
	<li><strong>For i = 1 (l = 0, r = 2, val<span style="font-size: 13.3333px;"> </span>= 1):</strong>
	<ul>
		<li>Decrement values at indices <code>[0, 1, 2]</code> by <code>[1, 1, 0]</code> respectively.</li>
		<li>The array will become <code>[3, 0, 0, 0]</code>, which is not a Zero Array.</li>
	</ul>
	</li>
</ul>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>0 &lt;= nums[i] &lt;= 5 * 10<sup>5</sup></code></li>
	<li><code>1 &lt;= queries.length &lt;= 10<sup>5</sup></code></li>
	<li><code>queries[i].length == 3</code></li>
	<li><code>0 &lt;= l<sub>i</sub> &lt;= r<sub>i</sub> &lt; nums.length</code></li>
	<li><code>1 &lt;= val<sub>i</sub> &lt;= 5</code></li>
</ul>"
---

```python
class Solution:
    def minZeroArray(self, nums: List[int], queries: List[List[int]]) -> int:
        n = len(nums)
        left, right = 0, len(queries)

        # Zero array isn't formed after all queries are processed
        if not self.can_form_zero_array(nums, queries, right):
            return -1

        # Binary Search
        while left <= right:
            middle = left + (right - left) // 2
            if self.can_form_zero_array(nums, queries, middle):
                right = middle - 1
            else:
                left = middle + 1

        # Return earliest query that zero array can be formed
        return left

    def can_form_zero_array(
        self, nums: List[int], queries: List[List[int]], k: int
    ) -> bool:
        n = len(nums)
        total_sum = 0
        difference_array = [0] * (n + 1)

        # Process query
        for query_index in range(k):
            start, end, val = queries[query_index]

            # Process start and end of range
            difference_array[start] += val
            difference_array[end + 1] -= val

        # Check if zero array can be formed
        for num_index in range(n):
            total_sum += difference_array[num_index]
            if total_sum < nums[num_index]:
                return False
        return True
```