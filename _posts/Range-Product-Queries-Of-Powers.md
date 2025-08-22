---
title: "Range Product Queries Of Powers"
date: "2025-08-11T17:46:14+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 40 ms (8.33%) | Memory: 8.8 MB (66.67%) - LeetSync"
---

```rust
impl Solution {
    pub fn product_queries(n: i32, queries: Vec<Vec<i32>>) -> Vec<i32> {
        const MOD: i64 = 1_000_000_007;

        // Build vector of powers present in n: 2^i for each set bit (in increasing i)
        let mut powers: Vec<i64> = Vec::new();
        let mut bit: i64 = 0;
        let mut tmp = n as i64;
        while tmp > 0 {
            if tmp & 1 == 1 {
                powers.push((1i64 << bit) % MOD);
            }
            tmp >>= 1;
            bit += 1;
        }

        // Prefix products modulo MOD
        let mut prefix: Vec<i64> = Vec::with_capacity(powers.len());
        let mut prod: i64 = 1;
        for &p in &powers {
            prod = (prod * p) % MOD;
            prefix.push(prod);
        }

        // fast modular exponentiation
        fn mod_pow(mut a: i64, mut e: i64, m: i64) -> i64 {
            let mut res = 1i64;
            a %= m;
            while e > 0 {
                if e & 1 == 1 {
                    res = (res * a) % m;
                }
                a = (a * a) % m;
                e >>= 1;
            }
            res
        }

        // answer queries using modular inverse
        let mut ans: Vec<i32> = Vec::with_capacity(queries.len());
        for q in queries {
            let l = q[0] as usize;
            let r = q[1] as usize;
            let value = if l == 0 {
                prefix[r]
            } else {
                let inv = mod_pow(prefix[l - 1], MOD - 2, MOD);
                (prefix[r] * inv) % MOD
            };
            ans.push(value as i32);
        }
        ans
    }
}

```