---
title: "./633 Sum Of Square Numbers"
date: "2024-06-17T14:46:55+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/sum-of-square-numbers">Sum of Square Numbers</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a non-negative integer <code>c</code>, decide whether there&#39;re two integers <code>a</code> and <code>b</code> such that <code>a<sup>2</sup> + b<sup>2</sup> = c</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> c = 5
<strong>Output:</strong> true
<strong>Explanation:</strong> 1 * 1 + 2 * 2 = 5
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> c = 3
<strong>Output:</strong> false
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>0 &lt;= c &lt;= 2<sup>31</sup> - 1</code></li>
</ul>"
---

```c
bool judgeSquareSum(int c) {
    if (c == 0) {
        return true;
    }
    for (int i = 1 ; i <= (int)(sqrt(c)) ; i ++) {
        double k = sqrt(c- i*i);
        if ((int)(k) == k) {
            //printf(" %d %d\n",k, i);
            return true;
        }
    }
    return false;
    
}
```