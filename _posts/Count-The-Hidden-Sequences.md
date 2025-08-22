---
title: "Count The Hidden Sequences"
date: "2025-04-21T06:34:12+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 3.8 MB (87.50%) - LeetSync"
---

```rust
impl Solution {
    pub fn number_of_arrays(differences: Vec<i32>, lower: i32, upper: i32) -> i32 {
        // Use prefix sum to track running total
        let mut prefix_sum = 0i64;
        let mut min_val = 0i64;
        let mut max_val = 0i64;

        for &diff in &differences {
            prefix_sum += diff as i64;
            min_val = min_val.min(prefix_sum);
            max_val = max_val.max(prefix_sum);
        }

        // If the difference between max and min exceeds the available range, return 0
        let available_range = (upper - lower) as i64;
        let required_range = max_val - min_val;

        if required_range > available_range {
            return 0;
        }

        // Otherwise, calculate number of valid starting values
        let valid_starts = available_range - required_range + 1;
        valid_starts as i32
    }
}

```