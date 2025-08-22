---
title: "Power Of Two"
date: "2025-08-09T07:51:29+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 1 ms (12.73%) | Memory: 2.1 MB (94.55%) - LeetSync"
---

```rust
impl Solution {
    pub fn is_power_of_two(n: i32) -> bool {
        if n == 2 || n == 1 {
             return true
        }
        if n % 2 != 0 || n == 0 {
            return false;
        }
        return Self::is_power_of_two(n/2)
    }
}
```