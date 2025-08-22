---
title: "./1694 Make Sum Divisible By P"
date: "2024-10-03T08:49:43+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/make-sum-divisible-by-p">Make Sum Divisible by P</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an array of positive integers <code>nums</code>, remove the <strong>smallest</strong> subarray (possibly <strong>empty</strong>) such that the <strong>sum</strong> of the remaining elements is divisible by <code>p</code>. It is <strong>not</strong> allowed to remove the whole array.</p>

<p>Return <em>the length of the smallest subarray that you need to remove, or </em><code>-1</code><em> if it&#39;s impossible</em>.</p>

<p>A <strong>subarray</strong> is defined as a contiguous block of elements in the array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [3,1,4,2], p = 6
<strong>Output:</strong> 1
<strong>Explanation:</strong> The sum of the elements in nums is 10, which is not divisible by 6. We can remove the subarray [4], and the sum of the remaining elements is 6, which is divisible by 6.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [6,3,5,2], p = 9
<strong>Output:</strong> 2
<strong>Explanation:</strong> We cannot remove a single element to get a sum divisible by 9. The best way is to remove the subarray [5,2], leaving us with [6,3] with sum 9.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3], p = 3
<strong>Output:</strong> 0
<strong>Explanation:</strong> Here the sum is 6. which is already divisible by 3. Thus we do not need to remove anything.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
	<li><code>1 &lt;= p &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
class Solution:
    def minSubarray(self, nums: List[int], p: int) -> int:
        prefix_sum = []
        suffix_sum = []
        temp = 0
        for k in nums:
            temp += k
            prefix_sum.append(temp%p)
            
        #prefix_sum.append(temp)

        temp = 0
        for k in nums[::-1]:
            temp += k
            suffix_sum.append(temp%p)
            
        #suffix_sum.append(temp)

        map = {}
        result = 10**5
        for idx,k in enumerate(prefix_sum):
            if k == 0:
                result = min(result, len(nums) - idx-1)
            if k in map:
                map[k].append(idx)
            else:
                map[k] = [idx]
           
        for idx,k in enumerate(suffix_sum[::-1]):
            if k == 0:
                result = min(result, idx)
            if p-k in map:
                for m in map[p-k]:
                    if m < idx:
                        result = min(result, idx-m-1)
        return result if result < 10 ** 5 else -1





        
```