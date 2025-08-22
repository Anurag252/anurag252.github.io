---
title: "./1160 Letter Tile Possibilities"
date: "2025-02-17T18:33:41+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/letter-tile-possibilities">Letter Tile Possibilities</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You have <code>n</code>&nbsp;&nbsp;<code>tiles</code>, where each tile has one letter <code>tiles[i]</code> printed on it.</p>

<p>Return <em>the number of possible non-empty sequences of letters</em> you can make using the letters printed on those <code>tiles</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> tiles = &quot;AAB&quot;
<strong>Output:</strong> 8
<strong>Explanation: </strong>The possible sequences are &quot;A&quot;, &quot;B&quot;, &quot;AA&quot;, &quot;AB&quot;, &quot;BA&quot;, &quot;AAB&quot;, &quot;ABA&quot;, &quot;BAA&quot;.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> tiles = &quot;AAABBC&quot;
<strong>Output:</strong> 188
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> tiles = &quot;V&quot;
<strong>Output:</strong> 1
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= tiles.length &lt;= 7</code></li>
	<li><code>tiles</code> consists of uppercase English letters.</li>
</ul>"
---

```go
func numTilePossibilities(tiles string) int {
    // ABCD
    // A,B,C,D
    // AB,AC,AD
    // ABC, ABD, ACD
    mp := make(map[string]bool)
    Comb(tiles, "",  mp)
    fmt.Println(mp)
    return len(mp)
}


func Comb(s string, prev string , mp map[string]bool) {
    
    // ABCD
    //A, B, C , D
    // AB, Ac, AD, BC,BD,...
    // ABC, ACD, A
    // idea is to keep skipping elements 
    //fmt.Println(prev + string(s[i]))
    for i, _ := range s {
        //fmt.Println(prev + string(s[i]))
        Perm(prev + string(s[i]), "" ,mp)
        Comb(s[i+1:], prev + string(s[i]) , mp)
    }

    

}

func Perm(s string, prev string, mp map[string]bool) {
    
    if len(s) == 2 {
        mp[prev + s] = true
        mp[prev + string(s[1]) + string(s[0])] = true
        return
    }

    if len(s) == 1 {
        mp[prev + s] = true
        return
    }

    for i, _ := range s {
        if i + 1 < len(s) {
            Perm(string(s[:i]) + s[i+1:],  prev + string(s[i]) , mp )
        } else {
            Perm(string(s[:i]) ,  prev + string(s[i]) , mp )
        }
    }
}

```