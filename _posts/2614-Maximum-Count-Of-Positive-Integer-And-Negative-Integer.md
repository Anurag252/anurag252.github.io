---
title: "./2614 Maximum Count Of Positive Integer And Negative Integer"
date: "2025-03-12T10:28:00+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-count-of-positive-integer-and-negative-integer">Maximum Count of Positive Integer and Negative Integer</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given an array <code>nums</code> sorted in <strong>non-decreasing</strong> order, return <em>the maximum between the number of positive integers and the number of negative integers.</em></p>

<ul>
	<li>In other words, if the number of positive integers in <code>nums</code> is <code>pos</code> and the number of negative integers is <code>neg</code>, then return the maximum of <code>pos</code> and <code>neg</code>.</li>
</ul>

<p><strong>Note</strong> that <code>0</code> is neither positive nor negative.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [-2,-1,-1,1,2,3]
<strong>Output:</strong> 3
<strong>Explanation:</strong> There are 3 positive integers and 3 negative integers. The maximum count among them is 3.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [-3,-2,-1,0,0,1,2]
<strong>Output:</strong> 3
<strong>Explanation:</strong> There are 2 positive integers and 3 negative integers. The maximum count among them is 3.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [5,20,66,1314]
<strong>Output:</strong> 4
<strong>Explanation:</strong> There are 4 positive integers and 0 negative integers. The maximum count among them is 4.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 2000</code></li>
	<li><code>-2000 &lt;= nums[i] &lt;= 2000</code></li>
	<li><code>nums</code> is sorted in a <strong>non-decreasing order</strong>.</li>
</ul>

<p>&nbsp;</p>
<p><strong>Follow up:</strong> Can you solve the problem in <code>O(log(n))</code> time complexity?</p>"
---

```python
class Solution:
    def maximumCount(self, nums: List[int]) -> int:

        if len(nums) == 1:
            return 1 if nums[0] != 0 else 0
        res = 0
        left = 0
        right = len(nums)-1
        while(left + 1 < right):
            
            mid = (left + right) // 2
            if nums[mid] == 0:
                while( mid < len(nums) and nums[mid] == 0):
                    mid += 1
                right = mid
                mid -= 1
                while(mid >= 0 and nums[mid] == 0):
                    mid -= 1
                left = mid
                break

            if nums[mid] < 0:
                left = mid
            else:
                right = mid

        
        if right == len(nums) - 1 and nums[right] < 0: 
            return left + 1 + 1
        if left == 0 and nums[left] > 0:
            return len(nums) - right + 1

        return max(left + 1, len(nums) - right)



        
```