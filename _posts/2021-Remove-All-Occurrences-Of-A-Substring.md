---
title: "./2021 Remove All Occurrences Of A Substring"
date: "2025-02-11T08:43:07+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/remove-all-occurrences-of-a-substring">Remove All Occurrences of a Substring</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given two strings <code>s</code> and <code>part</code>, perform the following operation on <code>s</code> until <strong>all</strong> occurrences of the substring <code>part</code> are removed:</p>

<ul>
	<li>Find the <strong>leftmost</strong> occurrence of the substring <code>part</code> and <strong>remove</strong> it from <code>s</code>.</li>
</ul>

<p>Return <code>s</code><em> after removing all occurrences of </em><code>part</code>.</p>

<p>A <strong>substring</strong> is a contiguous sequence of characters in a string.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;daabcbaabcbc&quot;, part = &quot;abc&quot;
<strong>Output:</strong> &quot;dab&quot;
<strong>Explanation</strong>: The following operations are done:
- s = &quot;da<strong><u>abc</u></strong>baabcbc&quot;, remove &quot;abc&quot; starting at index 2, so s = &quot;dabaabcbc&quot;.
- s = &quot;daba<strong><u>abc</u></strong>bc&quot;, remove &quot;abc&quot; starting at index 4, so s = &quot;dababc&quot;.
- s = &quot;dab<strong><u>abc</u></strong>&quot;, remove &quot;abc&quot; starting at index 3, so s = &quot;dab&quot;.
Now s has no occurrences of &quot;abc&quot;.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;axxxxyyyyb&quot;, part = &quot;xy&quot;
<strong>Output:</strong> &quot;ab&quot;
<strong>Explanation</strong>: The following operations are done:
- s = &quot;axxx<strong><u>xy</u></strong>yyyb&quot;, remove &quot;xy&quot; starting at index 4 so s = &quot;axxxyyyb&quot;.
- s = &quot;axx<strong><u>xy</u></strong>yyb&quot;, remove &quot;xy&quot; starting at index 3 so s = &quot;axxyyb&quot;.
- s = &quot;ax<strong><u>xy</u></strong>yb&quot;, remove &quot;xy&quot; starting at index 2 so s = &quot;axyb&quot;.
- s = &quot;a<strong><u>xy</u></strong>b&quot;, remove &quot;xy&quot; starting at index 1 so s = &quot;ab&quot;.
Now s has no occurrences of &quot;xy&quot;.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s.length &lt;= 1000</code></li>
	<li><code>1 &lt;= part.length &lt;= 1000</code></li>
	<li><code>s</code>​​​​​​ and <code>part</code> consists of lowercase English letters.</li>
</ul>"
---

```go
import (
    "strings"
    "fmt"
    "hash/fnv"
)

func hash(s string) uint32 {
        h := fnv.New32a()
        h.Write([]byte(s))
        return h.Sum32()
}

func removeOccurrences(s string, part string) string {
    // in case we do a recursive func, we get n/2 * m 
    // another approach is maybe brackets balancing like stack
    // that is m + n efficient ?def more than first approach 
    // No this is also n*m
    // how about sliding window ?


    st := make([]string, 0)
    h := hash(part)
    for _, k := range s {
        if len(st) >= len(part) {
            last := st[len(st) - len(part):]
            //fmt.Println(last, st)
            if hash(strings.Join(last, "")) == h {
                st = st[:len(st) - len(part)]
            } 
        }
        st = append(st, string(k))
        
    }
    if len(st) >= len(part) {
            last := st[len(st) - len(part):]
            fmt.Println(last, st)
            if strings.Join(last, "") == part {
                st = st[:len(st) - len(part)]
            } 
        }
    return strings.Join(st, "")
    





}
```