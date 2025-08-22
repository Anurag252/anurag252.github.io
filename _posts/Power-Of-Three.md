---
title: "Power Of Three"
date: "2025-08-13T06:53:55+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 7 ms (15.71%) | Memory: 2.2 MB (62.86%) - LeetSync"
---

```rust
impl Solution {
    pub fn is_power_of_three(n: i32) -> bool {

        if n == 1 {
            return true;
        }
        if n < 1 {
            return false;
        }
        if n % 3 != 0 {
            return false;
        }
        return Self::is_power_of_three(n / 3)
    }
}
```