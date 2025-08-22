---
title: "Divisible And Non Divisible Sums Difference"
date: "2025-05-27T21:46:44+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 2.2 MB (37.93%) - LeetSync"
---

```rust
impl Solution {
    pub fn difference_of_sums(n: i32, m: i32) -> i32 {
        let mut sum1 = 0;
        let mut sum2 = 0;
        for  i in  1..=n {
            if i % m == 0 {
                sum1 += i;
            }
            sum2 += i;
        }
        return sum2 - 2*sum1;
    }
}
```