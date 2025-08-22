---
title: "./3455 Minimum Length Of String After Operations"
date: "2025-01-13T21:08:32+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-length-of-string-after-operations">Minimum Length of String After Operations</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>s</code>.</p>

<p>You can perform the following process on <code>s</code> <strong>any</strong> number of times:</p>

<ul>
	<li>Choose an index <code>i</code> in the string such that there is <strong>at least</strong> one character to the left of index <code>i</code> that is equal to <code>s[i]</code>, and <strong>at least</strong> one character to the right that is also equal to <code>s[i]</code>.</li>
	<li>Delete the <strong>closest</strong> character to the <strong>left</strong> of index <code>i</code> that is equal to <code>s[i]</code>.</li>
	<li>Delete the <strong>closest</strong> character to the <strong>right</strong> of index <code>i</code> that is equal to <code>s[i]</code>.</li>
</ul>

<p>Return the <strong>minimum</strong> length of the final string <code>s</code> that you can achieve.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">s = &quot;abaacbcbb&quot;</span></p>

<p><strong>Output:</strong> <span class="example-io">5</span></p>

<p><strong>Explanation:</strong><br />
We do the following operations:</p>

<ul>
	<li>Choose index 2, then remove the characters at indices 0 and 3. The resulting string is <code>s = &quot;bacbcbb&quot;</code>.</li>
	<li>Choose index 3, then remove the characters at indices 0 and 5. The resulting string is <code>s = &quot;acbcb&quot;</code>.</li>
</ul>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">s = &quot;aa&quot;</span></p>

<p><strong>Output:</strong> <span class="example-io">2</span></p>

<p><strong>Explanation:</strong><br />
We cannot perform any operations, so we return the length of the original string.</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s.length &lt;= 2 * 10<sup>5</sup></code></li>
	<li><code>s</code> consists only of lowercase English letters.</li>
</ul>"
---

```go
func minimumLength(s string) int {
    // if there are 3 chars then 2 can be removed 1 is left 
    // if there are 4 - then also 2 can be removed 2 is left 
    // if there are 5 then 2 can be removed then 3 are left 
    // keep reducing 2 till at max 2 is left
    // (n - 2k) = 1  
    // n - 1/2 = 2k

    mp := make(map[rune]int)

    for _, k := range s {
        if _, ok := mp[k]; ok {
            mp[k] += 1
        } else {
            mp[k] = 1
        }
    }
    reduced := 0
    for _,v := range mp {
        if v >= 3 {
            if (v-1) % 2 == 0 {
                reduced += (v - 1)
            } else {
                reduced += (v - 2)
            }
        }
    }
    return len(s) - reduced
    
}
```