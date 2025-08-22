---
title: "./2456 Construct Smallest Number From Di String"
date: "2025-02-18T08:21:13+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/construct-smallest-number-from-di-string">Construct Smallest Number From DI String</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> string <code>pattern</code> of length <code>n</code> consisting of the characters <code>&#39;I&#39;</code> meaning <strong>increasing</strong> and <code>&#39;D&#39;</code> meaning <strong>decreasing</strong>.</p>

<p>A <strong>0-indexed</strong> string <code>num</code> of length <code>n + 1</code> is created using the following conditions:</p>

<ul>
	<li><code>num</code> consists of the digits <code>&#39;1&#39;</code> to <code>&#39;9&#39;</code>, where each digit is used <strong>at most</strong> once.</li>
	<li>If <code>pattern[i] == &#39;I&#39;</code>, then <code>num[i] &lt; num[i + 1]</code>.</li>
	<li>If <code>pattern[i] == &#39;D&#39;</code>, then <code>num[i] &gt; num[i + 1]</code>.</li>
</ul>

<p>Return <em>the lexicographically <strong>smallest</strong> possible string </em><code>num</code><em> that meets the conditions.</em></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> pattern = &quot;IIIDIDDD&quot;
<strong>Output:</strong> &quot;123549876&quot;
<strong>Explanation:
</strong>At indices 0, 1, 2, and 4 we must have that num[i] &lt; num[i+1].
At indices 3, 5, 6, and 7 we must have that num[i] &gt; num[i+1].
Some possible values of num are &quot;245639871&quot;, &quot;135749862&quot;, and &quot;123849765&quot;.
It can be proven that &quot;123549876&quot; is the smallest possible num that meets the conditions.
Note that &quot;123414321&quot; is not possible because the digit &#39;1&#39; is used more than once.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> pattern = &quot;DDD&quot;
<strong>Output:</strong> &quot;4321&quot;
<strong>Explanation:</strong>
Some possible values of num are &quot;9876&quot;, &quot;7321&quot;, and &quot;8742&quot;.
It can be proven that &quot;4321&quot; is the smallest possible num that meets the conditions.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= pattern.length &lt;= 8</code></li>
	<li><code>pattern</code> consists of only the letters <code>&#39;I&#39;</code> and <code>&#39;D&#39;</code>.</li>
</ul>"
---

```go
func smallestNumber(pattern string) string {
    // we could try all and backtrack
    // if we find total num of maximas and all need to be unique 
    // lexicographically we need to allocate smaller first 
    // at next level also we need to allocate smaller first 
    // IIIDIDDD -> 1,2,3,2,3,2,1,0 -> add 1 to all so that all remain +vw
    // 2,3,4,3,4,3,2,1 -> now both 4 are maximas - does not work normally
    // Let's try to assign smallest > unused from 0-9 for every I and also 
    // smallest < unused from 0-9

    arr := make([]int, 10)
    res := make([]int, 10)
    for i, _ := range arr {
        // start from i
        arr[i] = 1
        res[0] = i+1
        if allocate(arr, res, pattern, 0){
            //fmt.Println(res, arr)
            s := ""
            for _, k := range res {
                if k != 0 {
                     s += strconv.Itoa(k)
                     }
                }
               
            return s
        }
        arr[i] = 0
    }
    return ""
}

func allocate(arr []int, res []int, pattern string, i int) bool {
    //fmt.Println(arr, res, pattern)
    if i == len(pattern)   {
        return true
    }

    for j, k := range arr {
        if k == 1 {
            continue
        }
        if k == 0 && j+1 > res[i] && string(pattern[i]) == "I" {
            arr[j] = 1
            res[i+1] = j+1
            if allocate(arr, res, pattern, i + 1) {
                return true
            }
            arr[j] = 0
        } else {
            if k == 0 && j+1 < res[i] && string(pattern[i]) == "D" {
            arr[j] = 1
            res[i+1] = j+1
            if allocate(arr, res, pattern, i + 1){
                return true
            }
            arr[j] = 0
            } else {
                return false
            }
        }
        
    }
    return false
}
```