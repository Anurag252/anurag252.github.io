---
title: "./342 Power Of Four"
date: "2025-08-15T20:03:56+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/power-of-four">Power of Four</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given an integer <code>n</code>, return <em><code>true</code> if it is a power of four. Otherwise, return <code>false</code></em>.</p>

<p>An integer <code>n</code> is a power of four, if there exists an integer <code>x</code> such that <code>n == 4<sup>x</sup></code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre><strong>Input:</strong> n = 16
<strong>Output:</strong> true
</pre><p><strong class="example">Example 2:</strong></p>
<pre><strong>Input:</strong> n = 5
<strong>Output:</strong> false
</pre><p><strong class="example">Example 3:</strong></p>
<pre><strong>Input:</strong> n = 1
<strong>Output:</strong> true
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>-2<sup>31</sup> &lt;= n &lt;= 2<sup>31</sup> - 1</code></li>
</ul>

<p>&nbsp;</p>
<strong>Follow up:</strong> Could you solve it without loops/recursion?"
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