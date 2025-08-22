---
title: "./2868 Continuous Subarrays"
date: "2024-12-15T10:18:30+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/continuous-subarrays">Continuous Subarrays</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> integer array <code>nums</code>. A subarray of <code>nums</code> is called <strong>continuous</strong> if:</p>

<ul>
	<li>Let <code>i</code>, <code>i + 1</code>, ..., <code>j</code><sub> </sub>be the indices in the subarray. Then, for each pair of indices <code>i &lt;= i<sub>1</sub>, i<sub>2</sub> &lt;= j</code>, <code><font face="monospace">0 &lt;=</font> |nums[i<sub>1</sub>] - nums[i<sub>2</sub>]| &lt;= 2</code>.</li>
</ul>

<p>Return <em>the total number of <strong>continuous</strong> subarrays.</em></p>

<p>A subarray is a contiguous <strong>non-empty</strong> sequence of elements within an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [5,4,2,4]
<strong>Output:</strong> 8
<strong>Explanation:</strong> 
Continuous subarray of size 1: [5], [4], [2], [4].
Continuous subarray of size 2: [5,4], [4,2], [2,4].
Continuous subarray of size 3: [4,2,4].
Thereare no subarrys of size 4.
Total continuous subarrays = 4 + 3 + 1 = 8.
It can be shown that there are no more continuous subarrays.
</pre>

<p>&nbsp;</p>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3]
<strong>Output:</strong> 6
<strong>Explanation:</strong> 
Continuous subarray of size 1: [1], [2], [3].
Continuous subarray of size 2: [1,2], [2,3].
Continuous subarray of size 3: [1,2,3].
Total continuous subarrays = 3 + 2 + 1 = 6.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python

class Solution:
    def continuousSubarrays(self, nums: List[int]) -> int:
        
        left = 0
        right = 0
        arr = {}
        result = 0



        def valid_range(n, arr):
            
            if len(arr) == 0:
                arr[n] = 1
                return True
            #print(arr1, arr1[0], arr1[-1])
            if max(arr.keys()) - n <= 2 and  n - min(arr.keys()) <= 2:
                if n in arr:
                    arr[n] += 1
                else:
                    arr[n] = 1
                return True
            return False 

        while(left < len(nums) and right < len(nums)):
            #print(left, right, arr)
            if valid_range(nums[right], arr):
                result += right - left + 1
                right += 1
            else:
                #result += add(right - left)
                #print(nums[left], arr.index(nums[left]))
                arr[nums[left]] -= 1
                if arr[nums[left]] == 0:
                    del arr[nums[left]]
                left += 1
        #print(arr, left, right)
        #result += add(right - left)
        return result
```