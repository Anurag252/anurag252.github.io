---
title: "./2529 Range Product Queries Of Powers"
date: "2025-08-11T17:46:14+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/range-product-queries-of-powers">Range Product Queries of Powers</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a positive integer <code>n</code>, there exists a <strong>0-indexed</strong> array called <code>powers</code>, composed of the <strong>minimum</strong> number of powers of <code>2</code> that sum to <code>n</code>. The array is sorted in <strong>non-decreasing</strong> order, and there is <strong>only one</strong> way to form the array.</p>

<p>You are also given a <strong>0-indexed</strong> 2D integer array <code>queries</code>, where <code>queries[i] = [left<sub>i</sub>, right<sub>i</sub>]</code>. Each <code>queries[i]</code> represents a query where you have to find the product of all <code>powers[j]</code> with <code>left<sub>i</sub> &lt;= j &lt;= right<sub>i</sub></code>.</p>

<p>Return<em> an array </em><code>answers</code><em>, equal in length to </em><code>queries</code><em>, where </em><code>answers[i]</code><em> is the answer to the </em><code>i<sup>th</sup></code><em> query</em>. Since the answer to the <code>i<sup>th</sup></code> query may be too large, each <code>answers[i]</code> should be returned <strong>modulo</strong> <code>10<sup>9</sup> + 7</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 15, queries = [[0,1],[2,2],[0,3]]
<strong>Output:</strong> [2,4,64]
<strong>Explanation:</strong>
For n = 15, powers = [1,2,4,8]. It can be shown that powers cannot be a smaller size.
Answer to 1st query: powers[0] * powers[1] = 1 * 2 = 2.
Answer to 2nd query: powers[2] = 4.
Answer to 3rd query: powers[0] * powers[1] * powers[2] * powers[3] = 1 * 2 * 4 * 8 = 64.
Each answer modulo 10<sup>9</sup> + 7 yields the same answer, so [2,4,64] is returned.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 2, queries = [[0,0]]
<strong>Output:</strong> [2]
<strong>Explanation:</strong>
For n = 2, powers = [2].
The answer to the only query is powers[0] = 2. The answer modulo 10<sup>9</sup> + 7 is the same, so [2] is returned.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 10<sup>9</sup></code></li>
	<li><code>1 &lt;= queries.length &lt;= 10<sup>5</sup></code></li>
	<li><code>0 &lt;= start<sub>i</sub> &lt;= end<sub>i</sub> &lt; powers.length</code></li>
</ul>"
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