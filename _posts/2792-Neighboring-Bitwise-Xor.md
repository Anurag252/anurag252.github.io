---
title: "./2792 Neighboring Bitwise Xor"
date: "2025-01-17T08:15:51+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/neighboring-bitwise-xor">Neighboring Bitwise XOR</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>A <strong>0-indexed</strong> array <code>derived</code> with length <code>n</code> is derived by computing the <strong>bitwise XOR</strong>&nbsp;(&oplus;) of adjacent values in a <strong>binary array</strong> <code>original</code> of length <code>n</code>.</p>

<p>Specifically, for each index <code>i</code> in the range <code>[0, n - 1]</code>:</p>

<ul>
	<li>If <code>i = n - 1</code>, then <code>derived[i] = original[i] &oplus; original[0]</code>.</li>
	<li>Otherwise, <code>derived[i] = original[i] &oplus; original[i + 1]</code>.</li>
</ul>

<p>Given an array <code>derived</code>, your task is to determine whether there exists a <strong>valid binary array</strong> <code>original</code> that could have formed <code>derived</code>.</p>

<p>Return <em><strong>true</strong> if such an array exists or <strong>false</strong> otherwise.</em></p>

<ul>
	<li>A binary array is an array containing only <strong>0&#39;s</strong> and <strong>1&#39;s</strong></li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> derived = [1,1,0]
<strong>Output:</strong> true
<strong>Explanation:</strong> A valid original array that gives derived is [0,1,0].
derived[0] = original[0] &oplus; original[1] = 0 &oplus; 1 = 1 
derived[1] = original[1] &oplus; original[2] = 1 &oplus; 0 = 1
derived[2] = original[2] &oplus; original[0] = 0 &oplus; 0 = 0
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> derived = [1,1]
<strong>Output:</strong> true
<strong>Explanation:</strong> A valid original array that gives derived is [0,1].
derived[0] = original[0] &oplus; original[1] = 1
derived[1] = original[1] &oplus; original[0] = 1
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> derived = [1,0]
<strong>Output:</strong> false
<strong>Explanation:</strong> There is no valid original array that gives derived.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == derived.length</code></li>
	<li><code>1 &lt;= n&nbsp;&lt;= 10<sup>5</sup></code></li>
	<li>The values in <code>derived</code>&nbsp;are either <strong>0&#39;s</strong> or <strong>1&#39;s</strong></li>
</ul>"
---

```go
func doesValidArrayExist(derived []int) bool {
    // a ^ b = 1 diff
    // b ^ c = 1 diff
    // c ^ a = 1 diff
    // if a and b are same , b and c are same but c and a are diff -> not possible 
    // it is always possible to construct derived except last element to first elemen rule
    // and there are only two possible solutions start with 0 or 1

    valid := make([]int,1)

    // start with 0
    valid[0] = 0

    for _, k := range derived {
        if k == 1 {
            if valid[len(valid) - 1] == 1 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        } else {
            if valid[len(valid) - 1] == 0 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        }
    }

    if valid[len(valid) - 1] == valid[0] {
        return true
    }
    fmt.Println(valid)
    valid = make([]int,1)

    // start with 0
    valid[0] = 1

    for _, k := range derived {
        if k == 1 {
            if valid[len(valid) - 1] == 1 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        } else {
            if valid[len(valid) - 1] == 0 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        }
    }

    if valid[len(valid) - 1] == valid[0] {
        return true
    }
    return false
}
```