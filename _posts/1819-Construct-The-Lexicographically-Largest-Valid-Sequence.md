---
title: "./1819 Construct The Lexicographically Largest Valid Sequence"
date: "2025-02-16T09:07:43+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/construct-the-lexicographically-largest-valid-sequence">Construct the Lexicographically Largest Valid Sequence</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an integer <code>n</code>, find a sequence that satisfies all of the following:</p>

<ul>
	<li>The integer <code>1</code> occurs once in the sequence.</li>
	<li>Each integer between <code>2</code> and <code>n</code> occurs twice in the sequence.</li>
	<li>For every integer <code>i</code> between <code>2</code> and <code>n</code>, the <strong>distance</strong> between the two occurrences of <code>i</code> is exactly <code>i</code>.</li>
</ul>

<p>The <strong>distance</strong> between two numbers on the sequence, <code>a[i]</code> and <code>a[j]</code>, is the absolute difference of their indices, <code>|j - i|</code>.</p>

<p>Return <em>the <strong>lexicographically largest</strong> sequence</em><em>. It is guaranteed that under the given constraints, there is always a solution. </em></p>

<p>A sequence <code>a</code> is lexicographically larger than a sequence <code>b</code> (of the same length) if in the first position where <code>a</code> and <code>b</code> differ, sequence <code>a</code> has a number greater than the corresponding number in <code>b</code>. For example, <code>[0,1,9,0]</code> is lexicographically larger than <code>[0,1,5,6]</code> because the first position they differ is at the third number, and <code>9</code> is greater than <code>5</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 3
<strong>Output:</strong> [3,1,2,3,2]
<strong>Explanation:</strong> [2,3,2,1,3] is also a valid sequence, but [3,1,2,3,2] is the lexicographically largest valid sequence.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 5
<strong>Output:</strong> [5,3,1,4,3,5,2,4,2]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 20</code></li>
</ul>"
---

```go
package main

import "fmt"

func constructDistancedSequence(n int) []int {
    arr := make([]int, 2*n-1)
    used := make([]bool, n+1)
    
    var result []int
    recurse(arr, used, n, 0, &result)
    return result
}

func recurse(arr []int, used []bool, n, index int, result *[]int) bool {
    if index == len(arr) {
        *result = append([]int(nil), arr...) // Store the first valid solution
        return true
    }

    if arr[index] != 0 {
        return recurse(arr, used, n, index+1, result) // Skip filled indices
    }

    for num := n; num >= 1; num-- {
        if used[num] {
            continue
        }
        if num == 1 {
            arr[index] = 1
            used[1] = true
            if recurse(arr, used, n, index+1, result) {
                return true
            }
            arr[index] = 0
            used[1] = false
        } else if index+num < len(arr) && arr[index+num] == 0 {
            arr[index], arr[index+num] = num, num
            used[num] = true
            if recurse(arr, used, n, index+1, result) {
                return true
            }
            arr[index], arr[index+num] = 0, 0
            used[num] = false
        }
    }
    return false
}



```