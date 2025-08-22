---
title: "Ways To Express An Integer As Sum Of Powers"
date: "2025-08-12T10:07:44+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 948 ms (7.14%) | Memory: 8.4 MB (7.14%) - LeetSync"
---

```rust
use std::collections::HashMap;



impl Solution {
    pub fn number_of_ways(n: i32, x: i32) -> i32 {
        let modulo = 1_000_000_007;

        // Precompute powers so we don't call pow repeatedly
        let mut powers = vec![];
        let mut base = 1;
        loop {
            let p = (base as i64).pow(x as u32);
            if p > n as i64 {
                break;
            }
            powers.push(p as i32);
            base += 1;
        }

        let mut hash = HashMap::new();

        fn recurse(
            n: i32,
            idx: usize,
            modulo: i32,
            powers: &Vec<i32>,
            hash: &mut HashMap<(i32, usize), i32>,
        ) -> i32 {
            if n == 0 {
                return 1;
            }
            if idx >= powers.len() || n < 0 {
                return 0;
            }

            if let Some(&t) = hash.get(&(n, idx)) {
                return t;
            }

            // Choice 1: skip this base
            let mut res = recurse(n, idx + 1, modulo, powers, hash) % modulo;

            // Choice 2: use this base if it fits
            if powers[idx] <= n {
                res = (res + recurse(n - powers[idx], idx + 1, modulo, powers, hash)) % modulo;
            }

            hash.insert((n, idx), res);
            res
        }

        recurse(n, 0, modulo, &powers, &mut hash)
    }
}

```