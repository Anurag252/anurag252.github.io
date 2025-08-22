---
title: "./594 Longest Harmonious Subsequence"
date: "2025-06-30T09:30:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/longest-harmonious-subsequence">Longest Harmonious Subsequence</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>We define a harmonious array as an array where the difference between its maximum value and its minimum value is <b>exactly</b> <code>1</code>.</p>

<p>Given an integer array <code>nums</code>, return the length of its longest harmonious <span data-keyword="subsequence-array">subsequence</span> among all its possible subsequences.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [1,3,2,2,5,2,3,7]</span></p>

<p><strong>Output:</strong> <span class="example-io">5</span></p>

<p><strong>Explanation:</strong></p>

<p>The longest harmonious subsequence is <code>[3,2,2,2,3]</code>.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [1,2,3,4]</span></p>

<p><strong>Output:</strong> <span class="example-io">2</span></p>

<p><strong>Explanation:</strong></p>

<p>The longest harmonious subsequences are <code>[1,2]</code>, <code>[2,3]</code>, and <code>[3,4]</code>, all of which have a length of 2.</p>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">nums = [1,1,1,1]</span></p>

<p><strong>Output:</strong> <span class="example-io">0</span></p>

<p><strong>Explanation:</strong></p>

<p>No harmonic subsequence exists.</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 2 * 10<sup>4</sup></code></li>
	<li><code>-10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
class Solution:
    def findLHS(self, nums: List[int]) -> int:
        """
        lhs[i] = lhs[i-1] + 1, lhs[]
        again I would like to sort, does order matter in ans ?
        no

        """

        

        nums.sort()
        
        ans = 0
        res = 0
        print(nums)
        count = 0
        mp = {}

        for k in nums:
            if k in mp:
                mp[k] += 1
            else:
                mp[k]  = 1
        print(mp)
        arr = list(set(nums))
        arr.sort()
        prev = arr[0]
        for i, k in enumerate(arr):
            print(i, k , ans, mp[prev], mp[k])
            if k - prev == 1:
                ans = max(ans, mp[prev] + mp[k])
            prev = k
        return ans

        for i, k in enumerate(nums):
            print(ans, res,  prev, count,i)
            if k - prev == 0:
                res += 1

            if k - prev == 1:
                count += 1
                res += 1
            elif k - prev > 1:
                if count > 0:
                    ans = max(ans, res)
                prev = nums[i-1]
                res = count + 1
                count = 0
        if count > 0:
            ans = max(ans, res)
        print(ans, res,  prev, count)
        return ans





        
        
        res = 0
        ans = 0
        prev = arr[0][1]
        prev_new = 0

        prev_indx = 0
        print(arr)
        for i, k in enumerate(arr):
            print(prev_new, prev, prev_indx, res, ans)
            if prev != k[1] and prev == arr[prev_new][1]:
                prev_new = i
            if k[1] - prev <= 1 and prev_indx >= k[0]:
                prev_indx = k[0]
                res += 1
            else:
                ans = max(ans, res)
                res = 0
                prev = arr[prev_new][1]
                prev_indx = k[0]
                
        return ans



        
```