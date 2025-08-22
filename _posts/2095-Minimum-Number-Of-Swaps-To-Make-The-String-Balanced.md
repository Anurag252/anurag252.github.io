---
title: "./2095 Minimum Number Of Swaps To Make The String Balanced"
date: "2024-10-08T08:49:36+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced">Minimum Number of Swaps to Make the String Balanced</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> string <code>s</code> of <strong>even</strong> length <code>n</code>. The string consists of <strong>exactly</strong> <code>n / 2</code> opening brackets <code>&#39;[&#39;</code> and <code>n / 2</code> closing brackets <code>&#39;]&#39;</code>.</p>

<p>A string is called <strong>balanced</strong> if and only if:</p>

<ul>
	<li>It is the empty string, or</li>
	<li>It can be written as <code>AB</code>, where both <code>A</code> and <code>B</code> are <strong>balanced</strong> strings, or</li>
	<li>It can be written as <code>[C]</code>, where <code>C</code> is a <strong>balanced</strong> string.</li>
</ul>

<p>You may swap the brackets at <strong>any</strong> two indices <strong>any</strong> number of times.</p>

<p>Return <em>the <strong>minimum</strong> number of swaps to make </em><code>s</code> <em><strong>balanced</strong></em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;][][&quot;
<strong>Output:</strong> 1
<strong>Explanation:</strong> You can make the string balanced by swapping index 0 with index 3.
The resulting string is &quot;[[]]&quot;.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;]]][[[&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> You can do the following to make the string balanced:
- Swap index 0 with index 4. s = &quot;[]][][&quot;.
- Swap index 1 with index 5. s = &quot;[[][]]&quot;.
The resulting string is &quot;[[][]]&quot;.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;[]&quot;
<strong>Output:</strong> 0
<strong>Explanation:</strong> The string is already balanced.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == s.length</code></li>
	<li><code>2 &lt;= n &lt;= 10<sup>6</sup></code></li>
	<li><code>n</code> is even.</li>
	<li><code>s[i]</code> is either <code>&#39;[&#39; </code>or <code>&#39;]&#39;</code>.</li>
	<li>The number of opening brackets <code>&#39;[&#39;</code> equals <code>n / 2</code>, and the number of closing brackets <code>&#39;]&#39;</code> equals <code>n / 2</code>.</li>
</ul>"
---

```python
class Solution:
    def minSwaps(self, s: str) -> int:
        imbalance = 0
        balance = 0
        
        for char in s:
            if char == '[':
                balance += 1
            else:  # char == ']'
                balance -= 1
            
            # If balance goes negative, we have more ] than [ so far
            if balance < 0:
                imbalance += 1
                balance = 0  # Reset balance to zero to continue counting fresh

        # Each swap fixes two misplacements
        return (imbalance + 1) // 2
        
  
#T[o,n] = T[1,n-1] + 1 if s[0], s[n] makes a bracket , else T[1,n-1] or inf
#T[0,n] = T[0,n-2] + 1   if s[n-1] + s[n] does not make a bracket else T[0, n-2] of inf

      
```