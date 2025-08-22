---
title: "./2699 Count The Number Of Fair Pairs"
date: "2025-04-19T22:40:57+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-the-number-of-fair-pairs">Count the Number of Fair Pairs</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a <strong>0-indexed</strong> integer array <code>nums</code> of size <code>n</code> and two integers <code>lower</code> and <code>upper</code>, return <em>the number of fair pairs</em>.</p>

<p>A pair <code>(i, j)</code> is <b>fair </b>if:</p>

<ul>
	<li><code>0 &lt;= i &lt; j &lt; n</code>, and</li>
	<li><code>lower &lt;= nums[i] + nums[j] &lt;= upper</code></li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [0,1,7,4,4,5], lower = 3, upper = 6
<strong>Output:</strong> 6
<strong>Explanation:</strong> There are 6 fair pairs: (0,3), (0,4), (0,5), (1,3), (1,4), and (1,5).
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,7,9,2,5], lower = 11, upper = 11
<strong>Output:</strong> 1
<strong>Explanation:</strong> There is a single fair pair: (2,3).
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>nums.length == n</code></li>
	<li><code><font face="monospace">-10<sup>9</sup></font>&nbsp;&lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
	<li><code><font face="monospace">-10<sup>9</sup>&nbsp;&lt;= lower &lt;= upper &lt;= 10<sup>9</sup></font></code></li>
</ul>"
---

```python
class Solution:
    def lower_bound(self, nums, low, high, element):
        while low <= high:
            mid = low + ((high - low) // 2)
            if nums[mid] >= element:
                high = mid - 1
            else:
                low = mid + 1
        return low

    def countFairPairs(self, nums, lower, upper):
        nums.sort()
        ans = 0
        for i in range(len(nums)):
            # Assume we have picked nums[i] as the first pair element.

            # `low` indicates the number of possible pairs with sum < lower.
            low = self.lower_bound(nums, i + 1, len(nums) - 1, lower - nums[i])

            # `high` indicates the number of possible pairs with sum <= upper.
            high = self.lower_bound(
                nums, i + 1, len(nums) - 1, upper - nums[i] + 1
            )

            # Their difference gives the number of elements with sum in the
            # given range.
            ans += high - low

        return ans
```