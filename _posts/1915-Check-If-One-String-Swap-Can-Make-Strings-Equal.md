---
title: "./1915 Check If One String Swap Can Make Strings Equal"
date: "2025-02-05T06:22:39+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal">Check if One String Swap Can Make Strings Equal</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>You are given two strings <code>s1</code> and <code>s2</code> of equal length. A <strong>string swap</strong> is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices.</p>

<p>Return <code>true</code> <em>if it is possible to make both strings equal by performing <strong>at most one string swap </strong>on <strong>exactly one</strong> of the strings. </em>Otherwise, return <code>false</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s1 = &quot;bank&quot;, s2 = &quot;kanb&quot;
<strong>Output:</strong> true
<strong>Explanation:</strong> For example, swap the first character with the last character of s2 to make &quot;bank&quot;.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s1 = &quot;attack&quot;, s2 = &quot;defend&quot;
<strong>Output:</strong> false
<strong>Explanation:</strong> It is impossible to make them equal with one string swap.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s1 = &quot;kelb&quot;, s2 = &quot;kelb&quot;
<strong>Output:</strong> true
<strong>Explanation:</strong> The two strings are already equal, so no string swap operation is required.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s1.length, s2.length &lt;= 100</code></li>
	<li><code>s1.length == s2.length</code></li>
	<li><code>s1</code> and <code>s2</code> consist of only lowercase English letters.</li>
</ul>"
---

```go
func areAlmostEqual(s1 string, s2 string) bool {
    
    diff1 := make([]rune, 0)
    diff2 := make([]rune, 0)
    for i , k := range s1 {
        if rune(s2[i]) != k {
            diff1 = append(diff1, k)
            diff2 = append(diff2, rune(s2[i]) )
        }
    }

    if len(diff1) == 0 {
        return true
    }

    if len(diff1) == 1 {
        return false
    }

    if diff1[0] == diff2[1] && diff1[1] == diff2[0] && len(diff1) == 2 {
        return true
    }
    return false
}
```