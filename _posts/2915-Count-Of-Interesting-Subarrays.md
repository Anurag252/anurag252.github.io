---
title: "./2915 Count Of Interesting Subarrays"
date: "2025-04-25T12:14:09+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-of-interesting-subarrays">Count of Interesting Subarrays</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> integer array <code>nums</code>, an integer <code>modulo</code>, and an integer <code>k</code>.</p>

<p>Your task is to find the count of subarrays that are <strong>interesting</strong>.</p>

<p>A <strong>subarray</strong> <code>nums[l..r]</code> is <strong>interesting</strong> if the following condition holds:</p>

<ul>
	<li>Let <code>cnt</code> be the number of indices <code>i</code> in the range <code>[l, r]</code> such that <code>nums[i] % modulo == k</code>. Then, <code>cnt % modulo == k</code>.</li>
</ul>

<p>Return <em>an integer denoting the count of interesting subarrays. </em></p>

<p><span><strong>Note:</strong> A subarray is <em>a contiguous non-empty sequence of elements within an array</em>.</span></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [3,2,4], modulo = 2, k = 1
<strong>Output:</strong> 3
<strong>Explanation:</strong> In this example the interesting subarrays are: 
The subarray nums[0..0] which is [3]. 
- There is only one index, i = 0, in the range [0, 0] that satisfies nums[i] % modulo == k. 
- Hence, cnt = 1 and cnt % modulo == k.  
The subarray nums[0..1] which is [3,2].
- There is only one index, i = 0, in the range [0, 1] that satisfies nums[i] % modulo == k.  
- Hence, cnt = 1 and cnt % modulo == k.
The subarray nums[0..2] which is [3,2,4]. 
- There is only one index, i = 0, in the range [0, 2] that satisfies nums[i] % modulo == k. 
- Hence, cnt = 1 and cnt % modulo == k. 
It can be shown that there are no other interesting subarrays. So, the answer is 3.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [3,1,9,6], modulo = 3, k = 0
<strong>Output:</strong> 2
<strong>Explanation: </strong>In this example the interesting subarrays are: 
The subarray nums[0..3] which is [3,1,9,6]. 
- There are three indices, i = 0, 2, 3, in the range [0, 3] that satisfy nums[i] % modulo == k. 
- Hence, cnt = 3 and cnt % modulo == k. 
The subarray nums[1..1] which is [1]. 
- There is no index, i, in the range [1, 1] that satisfies nums[i] % modulo == k. 
- Hence, cnt = 0 and cnt % modulo == k. 
It can be shown that there are no other interesting subarrays. So, the answer is 2.</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5 </sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
	<li><code>1 &lt;= modulo &lt;= 10<sup>9</sup></code></li>
	<li><code>0 &lt;= k &lt; modulo</code></li>
</ul>"
---

```python
class Solution:
    def countInterestingSubarrays(self, nums: List[int], modulo: int, k: int) -> int:
        # in a subarr, find all indexes where % is k
        # then if the number of such elements i multiple of k -> interesting
        # so basically 5 , multiples of 5
        # 6 multiples of 6 and so on
        # make all multiples as -1
        # prepare an arr of ints with indexes of -1 occurences
        # then subarray would be newarr[k + 1] - newarr[k]
        prefix = 0
        freq = defaultdict(int)
        freq[0] = 1  # to count subarrays starting at index 0
        res = 0

        for num in nums:
            if num % modulo == k:
                prefix += 1
            
            # we want previous prefix sums that satisfy:
            # (prefix - prev) % modulo == k
            # => prev % modulo == (prefix - k + modulo) % modulo
            target = (prefix - k) % modulo
            res += freq[target]
            freq[prefix % modulo] += 1
        
        return res
        prepare = []
        for i, m in enumerate(nums):
            if m % modulo == k:
                prepare.append(i)
        res = 0
        

        print(prepare)
        for i, m in enumerate(prepare):
            if (i ) % modulo == k and i - 1 >= 0:
                res += prepare[i] - prepare[i-1]

        if len(prepare) == 1:
            res += len(nums)  - prepare[0]

        return res



        

        
```