---
title: "./2170 Count Number Of Maximum Bitwise Or Subsets"
date: "2025-07-28T16:21:41+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets">Count Number of Maximum Bitwise-OR Subsets</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an integer array <code>nums</code>, find the <strong>maximum</strong> possible <strong>bitwise OR</strong> of a subset of <code>nums</code> and return <em>the <strong>number of different non-empty subsets</strong> with the maximum bitwise OR</em>.</p>

<p>An array <code>a</code> is a <strong>subset</strong> of an array <code>b</code> if <code>a</code> can be obtained from <code>b</code> by deleting some (possibly zero) elements of <code>b</code>. Two subsets are considered <strong>different</strong> if the indices of the elements chosen are different.</p>

<p>The bitwise OR of an array <code>a</code> is equal to <code>a[0] <strong>OR</strong> a[1] <strong>OR</strong> ... <strong>OR</strong> a[a.length - 1]</code> (<strong>0-indexed</strong>).</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [3,1]
<strong>Output:</strong> 2
<strong>Explanation:</strong> The maximum possible bitwise OR of a subset is 3. There are 2 subsets with a bitwise OR of 3:
- [3]
- [3,1]
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,2,2]
<strong>Output:</strong> 7
<strong>Explanation:</strong> All non-empty subsets of [2,2,2] have a bitwise OR of 2. There are 2<sup>3</sup> - 1 = 7 total subsets.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [3,2,1,5]
<strong>Output:</strong> 6
<strong>Explanation:</strong> The maximum possible bitwise OR of a subset is 7. There are 6 subsets with a bitwise OR of 7:
- [3,5]
- [3,1,5]
- [3,2,5]
- [3,2,1,5]
- [2,5]
- [2,1,5]</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 16</code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>5</sup></code></li>
</ul>"
---

```rust
impl Solution {
    pub fn count_max_or_subsets(nums: Vec<i32>) -> i32 {
        // bitwise or is max if done for all elements ?
        //length is 16 
        // so there can be 2^16 subsets , which is quite lrge 
        // but maybe still under pow(10,5) ? IDK 
        // idea is if there is a 1 at a ceratin place 
        // we could exclude the other 1 from other integeres
        // say we have an array of 16
        // we could all 1s at each place,
        // indexes with just 1 1s are mandatory
        // rest are optional
        // final answer would be (optional + 1)*(mandatory count)

        // 010 101

        let mut final_result = 0;
        let mut result = 0;
        for k in &nums {
            final_result |= k;
        }
        println!("{}", final_result);

        fn subset( arr : &Vec<i32>, total : i32, final_result : i32, mut result : &mut i32, index : i32) {
            //println!("{} {} {} {}", total, final_result, result, index);
            if total == final_result && index == arr.len() as i32  {
                *result = *result + 1;
            }
            if index >= arr.len() as i32 {
                return 
            }
            subset(arr, total | arr[index as usize] , final_result, result, index + 1 );
            subset(arr, total , final_result, result, index + 1 );
            

        }
        subset(&nums, 0, final_result, &mut result, 0);
        return result;
    }
}
```