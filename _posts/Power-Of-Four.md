---
title: "Power Of Four"
date: "2025-08-15T20:03:56+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 2.2 MB (54.90%) - LeetSync"
---

```rust
impl Solution {
    pub fn is_power_of_four(n: i32) -> bool {
       // bin of 2 is 10, 100 is 4, 1000 is 8, 10000 is 16
       // so 100 ^ 011 is 0 for 2, onlt check extra if n % 3 == 0
       return (n & (n -1)) == 0 && n % 3 == 1

      
    }
}
```