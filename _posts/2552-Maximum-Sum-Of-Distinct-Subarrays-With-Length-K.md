---
title: "./2552 Maximum Sum Of Distinct Subarrays With Length K"
date: "2024-11-19T09:03:25+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k">Maximum Sum of Distinct Subarrays With Length K</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer array <code>nums</code> and an integer <code>k</code>. Find the maximum subarray sum of all the subarrays of <code>nums</code> that meet the following conditions:</p>

<ul>
	<li>The length of the subarray is <code>k</code>, and</li>
	<li>All the elements of the subarray are <strong>distinct</strong>.</li>
</ul>

<p>Return <em>the maximum subarray sum of all the subarrays that meet the conditions</em><em>.</em> If no subarray meets the conditions, return <code>0</code>.</p>

<p><em>A <strong>subarray</strong> is a contiguous non-empty sequence of elements within an array.</em></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,5,4,2,9,9,9], k = 3
<strong>Output:</strong> 15
<strong>Explanation:</strong> The subarrays of nums with length 3 are:
- [1,5,4] which meets the requirements and has a sum of 10.
- [5,4,2] which meets the requirements and has a sum of 11.
- [4,2,9] which meets the requirements and has a sum of 15.
- [2,9,9] which does not meet the requirements because the element 9 is repeated.
- [9,9,9] which does not meet the requirements because the element 9 is repeated.
We return 15 because it is the maximum subarray sum of all the subarrays that meet the conditions
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [4,4,4], k = 3
<strong>Output:</strong> 0
<strong>Explanation:</strong> The subarrays of nums with length 3 are:
- [4,4,4] which does not meet the requirements because the element 4 is repeated.
We return 0 because no subarrays meet the conditions.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= k &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>5</sup></code></li>
</ul>"
---

```python
class Solution:
    def maximumSubarraySum(self, nums: List[int], k: int) -> int:
        s = sum(nums[:k])
        dic = {}
        for m in nums[:k]:
            if m not in dic:
                dic[m] = 1
            else:
                dic[m] += 1
        
        print(nums[:k])
        start = 0
        ans = 0
        
        while(start + k < len(nums) ):
            #print(s, sum(arr))
            if len(dic) == k:
                ans = max(ans, s)
            s -= nums[start]
            dic[nums[start]] -= 1
            if dic[nums[start]] == 0:
                del dic[nums[start]]
 
            s += nums[start + k]
            if nums[start + k] not in dic:
                dic[nums[start + k]] = 1
            else:
                dic[nums[start + k]] += 1
            start += 1
            

        if len(dic) == k:
                ans = max(ans, s)
        return ans


```