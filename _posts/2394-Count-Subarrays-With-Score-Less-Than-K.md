---
title: "./2394 Count Subarrays With Score Less Than K"
date: "2025-04-29T08:28:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-subarrays-with-score-less-than-k">Count Subarrays With Score Less Than K</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>The <strong>score</strong> of an array is defined as the <strong>product</strong> of its sum and its length.</p>

<ul>
	<li>For example, the score of <code>[1, 2, 3, 4, 5]</code> is <code>(1 + 2 + 3 + 4 + 5) * 5 = 75</code>.</li>
</ul>

<p>Given a positive integer array <code>nums</code> and an integer <code>k</code>, return <em>the <strong>number of non-empty subarrays</strong> of</em> <code>nums</code> <em>whose score is <strong>strictly less</strong> than</em> <code>k</code>.</p>

<p>A <strong>subarray</strong> is a contiguous sequence of elements within an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,1,4,3,5], k = 10
<strong>Output:</strong> 6
<strong>Explanation:</strong>
The 6 subarrays having scores less than 10 are:
- [2] with score 2 * 1 = 2.
- [1] with score 1 * 1 = 1.
- [4] with score 4 * 1 = 4.
- [3] with score 3 * 1 = 3. 
- [5] with score 5 * 1 = 5.
- [2,1] with score (2 + 1) * 2 = 6.
Note that subarrays such as [1,4] and [4,3,5] are not considered because their scores are 10 and 36 respectively, while we need scores strictly less than 10.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,1,1], k = 5
<strong>Output:</strong> 5
<strong>Explanation:</strong>
Every subarray except [1,1,1] has a score less than 5.
[1,1,1] has a score (1 + 1 + 1) * 3 = 9, which is greater than 5.
Thus, there are 5 subarrays having scores less than 5.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= k &lt;= 10<sup>15</sup></code></li>
</ul>"
---

```python
class Solution:
    def countSubarrays(self, nums: List[int], k: int) -> int:

        left = 0
        s = sum(nums)
        total = 0
        res = 0
        right = 0

        while(left < len(nums)):
            while right < len(nums) and (total + nums[right]) * (right - left + 1) < k:
                total += nums[right]
                right += 1

            # After expansion, [left, right-1] are all valid
            res += right - left

            # Move left forward
            total -= nums[left]
            left += 1
        return res

        



        right = len(nums) - 1
        
        while(left < len(nums)):
            if s * (right - left + 1) >= k: # still large
                s -= nums[right]
                right -= 1
                if right < 0:
                    left += 1
                    s = left
                    right = left
            else:
                # found max < k

                res += right - left + 1 # nums of subarray
                s -= nums[left]
                left += 1
                while(s * (right - left + 1) <= k and right < len(nums)-1):
                    right += 1
                    s += nums[right]
        return res


        
```