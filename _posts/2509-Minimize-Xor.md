---
title: "./2509 Minimize Xor"
date: "2025-01-15T08:10:54+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimize-xor">Minimize XOR</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given two positive integers <code>num1</code> and <code>num2</code>, find the positive integer <code>x</code> such that:</p>

<ul>
	<li><code>x</code> has the same number of set bits as <code>num2</code>, and</li>
	<li>The value <code>x XOR num1</code> is <strong>minimal</strong>.</li>
</ul>

<p>Note that <code>XOR</code> is the bitwise XOR operation.</p>

<p>Return <em>the integer </em><code>x</code>. The test cases are generated such that <code>x</code> is <strong>uniquely determined</strong>.</p>

<p>The number of <strong>set bits</strong> of an integer is the number of <code>1</code>&#39;s in its binary representation.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> num1 = 3, num2 = 5
<strong>Output:</strong> 3
<strong>Explanation:</strong>
The binary representations of num1 and num2 are 0011 and 0101, respectively.
The integer <strong>3</strong> has the same number of set bits as num2, and the value <code>3 XOR 3 = 0</code> is minimal.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> num1 = 1, num2 = 12
<strong>Output:</strong> 3
<strong>Explanation:</strong>
The binary representations of num1 and num2 are 0001 and 1100, respectively.
The integer <strong>3</strong> has the same number of set bits as num2, and the value <code>3 XOR 1 = 2</code> is minimal.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= num1, num2 &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```go
func minimizeXor(num1 int, num2 int) int {

    count := 0
    i := 0
    for num2 != 0 {
        i = num2 & 1
        num2 =  num2 >> 1
        if i == 1 {
            count += 1
        }
    }

    res := make([]int,1)

    num3 := num1 

    numof1 := 0
    i = 0
    for num3 != 0 {
        i = num3 & 1
        num3 =  num3 >> 1
        if i == 1{
            numof1 += 1
        }
    }
    //fmt.Println(countOfNum3)
    diff1 := 0
    diff2 := 0
    if numof1 < count { 
                        // more 1s available but less needed
                        // find first 0 from left and make it 1
        diff2 = count - numof1
    } else {
        // less available but more needed
        // skip diff  1s from left and then make rest equal
        diff1 = numof1 - count
    }
    
    i = 0
    for count > 0 {
        fmt.Println(i, num1, res, count, diff1, diff2 )
        i = num1 & 1
        if i == 1 {
            if diff1 > 0 { // skip diff1 number of 1s
                res = append(res, 0)
                diff1 --
            } else {
                res = append(res, 1)
                //res = res | 1 // else attach 1
                //res = res << 1
                count -- 
            }
        } else {
            if diff2 > 0 {
                res = append(res, 1)
                //res = res | 1 // if diff2 > 0 make first 0 from left and make it 1
                //res = res << 1
                diff2 --
                count --
            } else {
                res = append(res, 0)
                //res = res | 0 // else keep it zero 
                //res = res << 1
            }
        }

        num1 = num1 >> 1

        
    }
    
    // reverse res
    slices.Reverse(res)
    fmt.Println(res[:len(res)-1])
    res1 := 0
    for j := 0 ; j < len(res)-1 ; j ++ {
        res1 = res1 | res[j]
        res1 = res1 << 1
    }

    //fmt.Println(res, num3 )
    return res1 >> 1
}
```