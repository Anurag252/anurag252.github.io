---
title: "./2448 Count Number Of Bad Pairs"
date: "2025-02-09T11:11:05+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-number-of-bad-pairs">Count Number of Bad Pairs</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> integer array <code>nums</code>. A pair of indices <code>(i, j)</code> is a <strong>bad pair</strong> if <code>i &lt; j</code> and <code>j - i != nums[j] - nums[i]</code>.</p>

<p>Return<em> the total number of <strong>bad pairs</strong> in </em><code>nums</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [4,1,3,3]
<strong>Output:</strong> 5
<strong>Explanation:</strong> The pair (0, 1) is a bad pair since 1 - 0 != 1 - 4.
The pair (0, 2) is a bad pair since 2 - 0 != 3 - 4, 2 != -1.
The pair (0, 3) is a bad pair since 3 - 0 != 3 - 4, 3 != -1.
The pair (1, 2) is a bad pair since 2 - 1 != 3 - 1, 1 != 2.
The pair (2, 3) is a bad pair since 3 - 2 != 3 - 3, 1 != 0.
There are a total of 5 bad pairs, so we return 5.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,2,3,4,5]
<strong>Output:</strong> 0
<strong>Explanation:</strong> There are no bad pairs.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```go
func countBadPairs(nums []int) int64 {

    // consecutive numbers must lie at indexes
    // we could count the number of consecutive numbers but 
    // [1,6,7,4,5], here 6 and 7 are consecutive and good pair and 1,4,5 are another good pairs
    // another obsv is that all good pairs till 4 will be added to 5
    // total number of pairs are n + n-1 + n-2 + n-3 . . .
    // saw the 2nd hint

    mp := make(map[int]int)

    totalPairs := int64(len(nums) * (len(nums) -1))/2
    goodPairs := int64(0)
    for i, k := range nums {
        elem := k - i
        _, ok := mp[elem]
        if ! ok {
            mp[elem] = 1
        } else {
            mp[elem] += 1
        }
    }

    for _, k := range mp {
        if k > 1 {
            goodPairs += int64((k * (k-1))/2)
        }
        
    }
    //fmt.Println(mp)
    return totalPairs - goodPairs

}
```