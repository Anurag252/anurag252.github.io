---
title: "Find Numbers With Even Number Of Digits"
date: "2025-04-30T10:56:35+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 2.1 MB (60.71%) - LeetSync"
---

```rust
impl Solution {
    pub fn find_numbers(nums: Vec<i32>) -> i32 {
        let mut res = 0;
        for num in nums {
            let num_as_string = num.to_string();
            if num_as_string.len() % 2 == 0 {
                res += 1
            }

        }
        return res

    }
}
```