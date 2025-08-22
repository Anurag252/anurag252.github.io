---
title: "./1227 Number Of Equivalent Domino Pairs"
date: "2025-05-04T17:55:49+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/number-of-equivalent-domino-pairs">Number of Equivalent Domino Pairs</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given a list of <code>dominoes</code>, <code>dominoes[i] = [a, b]</code> is <strong>equivalent to</strong> <code>dominoes[j] = [c, d]</code> if and only if either (<code>a == c</code> and <code>b == d</code>), or (<code>a == d</code> and <code>b == c</code>) - that is, one domino can be rotated to be equal to another domino.</p>

<p>Return <em>the number of pairs </em><code>(i, j)</code><em> for which </em><code>0 &lt;= i &lt; j &lt; dominoes.length</code><em>, and </em><code>dominoes[i]</code><em> is <strong>equivalent to</strong> </em><code>dominoes[j]</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> dominoes = [[1,2],[2,1],[3,4],[5,6]]
<strong>Output:</strong> 1
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> dominoes = [[1,2],[1,2],[1,1],[1,2],[2,2]]
<strong>Output:</strong> 3
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= dominoes.length &lt;= 4 * 10<sup>4</sup></code></li>
	<li><code>dominoes[i].length == 2</code></li>
	<li><code>1 &lt;= dominoes[i][j] &lt;= 9</code></li>
</ul>"
---

```rust
use std::collections::HashMap ;
use std::cmp::max;

impl Solution {
    pub fn num_equiv_domino_pairs(dominoes: Vec<Vec<i32>>) -> i32 {
        let mut mp = HashMap::new();
        for k in dominoes {
            if k[0] > k[1] {
                let state = mp.entry((k[1], k[0])).or_insert(0);
                *state += 1;

            } else {
                let state = mp.entry((k[0], k[1])).or_insert(0);
                *state += 1;
            }
            
        }
        let mut res = 0;
        for (k,v) in mp {
            if v > 1 {
                res += v * (v-1) / 2;
            }
        }
        return res 
    }
}
```