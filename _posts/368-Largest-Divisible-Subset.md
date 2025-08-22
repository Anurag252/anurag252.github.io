---
title: "./368 Largest Divisible Subset"
date: "2025-04-06T07:01:53+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/largest-divisible-subset">Largest Divisible Subset</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a set of <strong>distinct</strong> positive integers <code>nums</code>, return the largest subset <code>answer</code> such that every pair <code>(answer[i], answer[j])</code> of elements in this subset satisfies:</p>

<ul>
	<li><code>answer[i] % answer[j] == 0</code>, or</li>
	<li><code>answer[j] % answer[i] == 0</code></li>
</ul>

<p>If there are multiple solutions, return any of them.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3]
<strong>Output:</strong> [1,2]
<strong>Explanation:</strong> [1,3] is also accepted.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,4,8]
<strong>Output:</strong> [1,2,4,8]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 1000</code></li>
	<li><code>1 &lt;= nums[i] &lt;= 2 * 10<sup>9</sup></code></li>
	<li>All the integers in <code>nums</code> are <strong>unique</strong>.</li>
</ul>"
---

```python
class Solution:
    def largestDivisibleSubset(self, nums: List[int]) -> List[int]:
        nums.sort()
        if len(nums) == 1:
            return nums
        
        res = [(0,0)] * len(nums)
        mx = 0
        for i, k in enumerate(nums):
            t = 0
            p = 0
            for j in range(0,i+1):
                if k % nums[j] == 0:
                    if j != i and res[j][0] + 1 > t:
                        p = max(p, j)
                    t = max(res[j][0] + 1, t) 
                    mx = max(t,mx)
                    
            res[i] = (t,p)
        print(res, mx)
        if mx == 1:
            return [nums[0]]
        ans = [0] * mx
        index = 0
        for i, k in enumerate(res):
            if k[0] == mx:
                # found max
                index = k[1]
                ans[-1] = nums[i]

                break
        print(index)
        def rec(ans, index, i):
            if i == 0:
                ans[i] = nums[index]
                return
            ans[i] = nums[index]
            rec(ans, res[index][1], i - 1)
        rec(ans, index, len(ans)-2)
        return ans

        


        return res
        # T[n] = max(T[n-i]) for all i if k[i] % k[n-i] == 0
        # 

        
```