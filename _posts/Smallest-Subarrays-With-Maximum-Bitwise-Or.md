---
title: "Smallest Subarrays With Maximum Bitwise Or"
date: "2025-07-29T22:04:38+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 11 ms (78.57%) | Memory: 3.6 MB (57.14%) - LeetSync"
---

```rust
impl Solution {
    pub fn smallest_subarrays(nums: Vec<i32>) -> Vec<i32> {
        let n = nums.len();
        let mut result = vec![1; n];
        let mut last_pos = vec![-1; 32];  // track last index of each bit set
        
        for i in (0..n).rev() {
            let mut max_pos = i;
            let x = nums[i];
            for bit in 0..32 {
                if (x & (1 << bit)) != 0 {
                    last_pos[bit] = i as i32;
                }
                if last_pos[bit] != -1 {
                    max_pos = max_pos.max(last_pos[bit] as usize);
                }
            }
            result[i] = (max_pos - i + 1) as i32;
        }
        
        result
    }
}

```