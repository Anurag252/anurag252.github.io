---
title: "./2503 Longest Subarray With Maximum Bitwise And"
date: "2025-07-30T12:19:09+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and">Longest Subarray With Maximum Bitwise AND</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer array <code>nums</code> of size <code>n</code>.</p>

<p>Consider a <strong>non-empty</strong> subarray from <code>nums</code> that has the <strong>maximum</strong> possible <strong>bitwise AND</strong>.</p>

<ul>
	<li>In other words, let <code>k</code> be the maximum value of the bitwise AND of <strong>any</strong> subarray of <code>nums</code>. Then, only subarrays with a bitwise AND equal to <code>k</code> should be considered.</li>
</ul>

<p>Return <em>the length of the <strong>longest</strong> such subarray</em>.</p>

<p>The bitwise AND of an array is the bitwise AND of all the numbers in it.</p>

<p>A <strong>subarray</strong> is a contiguous sequence of elements within an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3,3,2,2]
<strong>Output:</strong> 2
<strong>Explanation:</strong>
The maximum possible bitwise AND of a subarray is 3.
The longest subarray with that value is [3,3], so we return 2.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3,4]
<strong>Output:</strong> 1
<strong>Explanation:</strong>
The maximum possible bitwise AND of a subarray is 4.
The longest subarray with that value is [4], so we return 1.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>6</sup></code></li>
</ul>"
---

```rust

 use std::cmp::max;
 impl Solution {
    pub fn longest_subarray(nums: Vec<i32>) -> i32 {
        /*
            maximum bitwise AND would be just one number 
            or a group of number that are same
            is it largest number ??
            I guess so 
        */
        let mut result = 0;
        let mut temp = 1;
        let mut mx = nums.iter().max();
        match mx {
            Some(min) => {
                for (i, k) in nums.iter().enumerate() {
            if k == min {
                if (i > 0 && nums[i-1] == *k) {
                    temp += 1;
                }
            } else {
                temp = 1;
            }

            result = max(result, temp);
        }
        result
            },
            None      => return 0,
        }
        

    }
}
```