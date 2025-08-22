---
title: "./4 Median Of Two Sorted Arrays"
date: "2024-05-31T18:54:00+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/median-of-two-sorted-arrays">Median of Two Sorted Arrays</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Given two sorted arrays <code>nums1</code> and <code>nums2</code> of size <code>m</code> and <code>n</code> respectively, return <strong>the median</strong> of the two sorted arrays.</p>

<p>The overall run time complexity should be <code>O(log (m+n))</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums1 = [1,3], nums2 = [2]
<strong>Output:</strong> 2.00000
<strong>Explanation:</strong> merged array = [1,2,3] and median is 2.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums1 = [1,2], nums2 = [3,4]
<strong>Output:</strong> 2.50000
<strong>Explanation:</strong> merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>nums1.length == m</code></li>
	<li><code>nums2.length == n</code></li>
	<li><code>0 &lt;= m &lt;= 1000</code></li>
	<li><code>0 &lt;= n &lt;= 1000</code></li>
	<li><code>1 &lt;= m + n &lt;= 2000</code></li>
	<li><code>-10<sup>6</sup> &lt;= nums1[i], nums2[i] &lt;= 10<sup>6</sup></code></li>
</ul>"
---

```python
class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        i = 0
        j = 0
        newarr = [None] * (len(nums1) + len(nums2))
        t = 0
        while t < len(newarr):
            if i < len(nums1) and j < len(nums2)  and nums1[i] < nums2[j]:
                newarr[t] = nums1[i]
                t = t + 1
                i = i + 1

            elif j < len(nums2)  and i < len(nums1) and   nums1[i] > nums2[j]:
                newarr[t] = nums2[j]
                t = t + 1
                j = j + 1

            elif j < len(nums2):
                newarr[t] = nums2[j]
                t = t + 1
                j = j + 1

            elif i < len(nums1):
                newarr[t] = nums1[i]
                t = t + 1
                i = i + 1
        print(newarr)
        if len(newarr) % 2 == 1:
            return newarr[int(len(newarr)/2)]
        else:
            a = ceil((len(newarr)-1)/2)
            b = floor((len(newarr)-1)/2)
            return (newarr[a] + newarr[b])/2
        return 0.0



```