---
title: "./2882 Ways To Express An Integer As Sum Of Powers"
date: "2025-08-12T10:07:44+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/ways-to-express-an-integer-as-sum-of-powers">Ways to Express an Integer as Sum of Powers</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given two <strong>positive</strong> integers <code>n</code> and <code>x</code>.</p>

<p>Return <em>the number of ways </em><code>n</code><em> can be expressed as the sum of the </em><code>x<sup>th</sup></code><em> power of <strong>unique</strong> positive integers, in other words, the number of sets of unique integers </em><code>[n<sub>1</sub>, n<sub>2</sub>, ..., n<sub>k</sub>]</code><em> where </em><code>n = n<sub>1</sub><sup>x</sup> + n<sub>2</sub><sup>x</sup> + ... + n<sub>k</sub><sup>x</sup></code><em>.</em></p>

<p>Since the result can be very large, return it modulo <code>10<sup>9</sup> + 7</code>.</p>

<p>For example, if <code>n = 160</code> and <code>x = 3</code>, one way to express <code>n</code> is <code>n = 2<sup>3</sup> + 3<sup>3</sup> + 5<sup>3</sup></code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 10, x = 2
<strong>Output:</strong> 1
<strong>Explanation:</strong> We can express n as the following: n = 3<sup>2</sup> + 1<sup>2</sup> = 10.
It can be shown that it is the only way to express 10 as the sum of the 2<sup>nd</sup> power of unique integers.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 4, x = 1
<strong>Output:</strong> 2
<strong>Explanation:</strong> We can express n in the following ways:
- n = 4<sup>1</sup> = 4.
- n = 3<sup>1</sup> + 1<sup>1</sup> = 4.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 300</code></li>
	<li><code>1 &lt;= x &lt;= 5</code></li>
</ul>"
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