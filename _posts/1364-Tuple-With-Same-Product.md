---
title: "./1364 Tuple With Same Product"
date: "2025-02-06T08:16:01+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/tuple-with-same-product">Tuple with Same Product</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an array <code>nums</code> of <strong>distinct</strong> positive integers, return <em>the number of tuples </em><code>(a, b, c, d)</code><em> such that </em><code>a * b = c * d</code><em> where </em><code>a</code><em>, </em><code>b</code><em>, </em><code>c</code><em>, and </em><code>d</code><em> are elements of </em><code>nums</code><em>, and </em><code>a != b != c != d</code><em>.</em></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,3,4,6]
<strong>Output:</strong> 8
<strong>Explanation:</strong> There are 8 valid tuples:
(2,6,3,4) , (2,6,4,3) , (6,2,3,4) , (6,2,4,3)
(3,4,2,6) , (4,3,2,6) , (3,4,6,2) , (4,3,6,2)
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,4,5,10]
<strong>Output:</strong> 16
<strong>Explanation:</strong> There are 16 valid tuples:
(1,10,2,5) , (1,10,5,2) , (10,1,2,5) , (10,1,5,2)
(2,5,1,10) , (2,5,10,1) , (5,2,1,10) , (5,2,10,1)
(2,10,4,5) , (2,10,5,4) , (10,2,4,5) , (10,2,5,4)
(4,5,2,10) , (4,5,10,2) , (5,4,2,10) , (5,4,10,2)
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 1000</code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>4</sup></code></li>
	<li>All elements in <code>nums</code> are <strong>distinct</strong>.</li>
</ul>"
---

```go
func tupleSameProduct(nums []int) int {
    mp := make(map[int]int)

    for _, k1 := range nums {
        for _ , k2 := range nums {
            if k1 != k2 {
                mp[k1*k2] += 1
            }
        }
    }   

    //fmt.Println(mp)
    res := 0
    // 4-> 8
    // 6 -> 24 
    // a b c d perm -> 8
    // ab cd
    // ab cd ef-> 8
    // ab cd, ba cd, ab dc, ba dc, 
    // groups of v / 2 -> from this select 2
    // groups of 4/ 2 = 2 -> from this select 2 only 1 way
    // gropus of 6/2 = 3 -> from this select 2 only 3 ways 
    for _, v := range mp {
        if v >= 4 {
            groups := v/2
            sel := (groups * (groups -1)) / 2
            res += (8 * sel)
        }
    }

   
    return res

}
```