---
title: "./3789 Maximize Subarrays After Removing One Conflicting Pair"
date: "2025-07-26T23:12:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximize-subarrays-after-removing-one-conflicting-pair">Maximize Subarrays After Removing One Conflicting Pair</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>You are given an integer <code>n</code> which represents an array <code>nums</code> containing the numbers from 1 to <code>n</code> in order. Additionally, you are given a 2D array <code>conflictingPairs</code>, where <code>conflictingPairs[i] = [a, b]</code> indicates that <code>a</code> and <code>b</code> form a conflicting pair.</p>

<p>Remove <strong>exactly</strong> one element from <code>conflictingPairs</code>. Afterward, count the number of <span data-keyword="subarray-nonempty">non-empty subarrays</span> of <code>nums</code> which do not contain both <code>a</code> and <code>b</code> for any remaining conflicting pair <code>[a, b]</code>.</p>

<p>Return the <strong>maximum</strong> number of subarrays possible after removing <strong>exactly</strong> one conflicting pair.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">n = 4, conflictingPairs = [[2,3],[1,4]]</span></p>

<p><strong>Output:</strong> <span class="example-io">9</span></p>

<p><strong>Explanation:</strong></p>

<ul>
	<li>Remove <code>[2, 3]</code> from <code>conflictingPairs</code>. Now, <code>conflictingPairs = [[1, 4]]</code>.</li>
	<li>There are 9 subarrays in <code>nums</code> where <code>[1, 4]</code> do not appear together. They are <code>[1]</code>, <code>[2]</code>, <code>[3]</code>, <code>[4]</code>, <code>[1, 2]</code>, <code>[2, 3]</code>, <code>[3, 4]</code>, <code>[1, 2, 3]</code> and <code>[2, 3, 4]</code>.</li>
	<li>The maximum number of subarrays we can achieve after removing one element from <code>conflictingPairs</code> is 9.</li>
</ul>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">n = 5, conflictingPairs = [[1,2],[2,5],[3,5]]</span></p>

<p><strong>Output:</strong> <span class="example-io">12</span></p>

<p><strong>Explanation:</strong></p>

<ul>
	<li>Remove <code>[1, 2]</code> from <code>conflictingPairs</code>. Now, <code>conflictingPairs = [[2, 5], [3, 5]]</code>.</li>
	<li>There are 12 subarrays in <code>nums</code> where <code>[2, 5]</code> and <code>[3, 5]</code> do not appear together.</li>
	<li>The maximum number of subarrays we can achieve after removing one element from <code>conflictingPairs</code> is 12.</li>
</ul>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= n &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= conflictingPairs.length &lt;= 2 * n</code></li>
	<li><code>conflictingPairs[i].length == 2</code></li>
	<li><code>1 &lt;= conflictingPairs[i][j] &lt;= n</code></li>
	<li><code>conflictingPairs[i][0] != conflictingPairs[i][1]</code></li>
</ul>"
---

```python
class Solution:
    def maxSubarrays(self, n: int, conflictingPairs: List[List[int]]) -> int:
        bMin1 = [2**31 - 1] * (n + 1)
        bMin2 = [2**31 - 1] * (n + 1)
        for pair in conflictingPairs:
            a = min(pair[0], pair[1])
            b = max(pair[0], pair[1])
            if bMin1[a] > b:
                bMin2[a] = bMin1[a]
                bMin1[a] = b
            elif bMin2[a] > b:
                bMin2[a] = b
        res = 0
        ib1 = n
        b2 = 0x3FFFFFFF
        delCount = [0] * (n + 1)
        for i in range(n, 0, -1):
            if bMin1[ib1] > bMin1[i]:
                b2 = min(b2, bMin1[ib1])
                ib1 = i
            else:
                b2 = min(b2, bMin1[i])
            res += min(bMin1[ib1], n + 1) - i
            delCount[ib1] += min(min(b2, bMin2[ib1]), n + 1) - min(
                bMin1[ib1], n + 1
            )
        return res + max(delCount)
```