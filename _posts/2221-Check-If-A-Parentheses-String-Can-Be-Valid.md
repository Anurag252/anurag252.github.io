---
title: "./2221 Check If A Parentheses String Can Be Valid"
date: "2025-01-12T12:53:22+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/check-if-a-parentheses-string-can-be-valid">Check if a Parentheses String Can Be Valid</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>A parentheses string is a <strong>non-empty</strong> string consisting only of <code>&#39;(&#39;</code> and <code>&#39;)&#39;</code>. It is valid if <strong>any</strong> of the following conditions is <strong>true</strong>:</p>

<ul>
	<li>It is <code>()</code>.</li>
	<li>It can be written as <code>AB</code> (<code>A</code> concatenated with <code>B</code>), where <code>A</code> and <code>B</code> are valid parentheses strings.</li>
	<li>It can be written as <code>(A)</code>, where <code>A</code> is a valid parentheses string.</li>
</ul>

<p>You are given a parentheses string <code>s</code> and a string <code>locked</code>, both of length <code>n</code>. <code>locked</code> is a binary string consisting only of <code>&#39;0&#39;</code>s and <code>&#39;1&#39;</code>s. For <strong>each</strong> index <code>i</code> of <code>locked</code>,</p>

<ul>
	<li>If <code>locked[i]</code> is <code>&#39;1&#39;</code>, you <strong>cannot</strong> change <code>s[i]</code>.</li>
	<li>But if <code>locked[i]</code> is <code>&#39;0&#39;</code>, you <strong>can</strong> change <code>s[i]</code> to either <code>&#39;(&#39;</code> or <code>&#39;)&#39;</code>.</li>
</ul>

<p>Return <code>true</code> <em>if you can make <code>s</code> a valid parentheses string</em>. Otherwise, return <code>false</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/11/06/eg1.png" style="width: 311px; height: 101px;" />
<pre>
<strong>Input:</strong> s = &quot;))()))&quot;, locked = &quot;010100&quot;
<strong>Output:</strong> true
<strong>Explanation:</strong> locked[1] == &#39;1&#39; and locked[3] == &#39;1&#39;, so we cannot change s[1] or s[3].
We change s[0] and s[4] to &#39;(&#39; while leaving s[2] and s[5] unchanged to make s valid.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;()()&quot;, locked = &quot;0000&quot;
<strong>Output:</strong> true
<strong>Explanation:</strong> We do not need to make any changes because s is already valid.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;)&quot;, locked = &quot;0&quot;
<strong>Output:</strong> false
<strong>Explanation:</strong> locked permits us to change s[0]. 
Changing s[0] to either &#39;(&#39; or &#39;)&#39; will not make s valid.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == s.length == locked.length</code></li>
	<li><code>1 &lt;= n &lt;= 10<sup>5</sup></code></li>
	<li><code>s[i]</code> is either <code>&#39;(&#39;</code> or <code>&#39;)&#39;</code>.</li>
	<li><code>locked[i]</code> is either <code>&#39;0&#39;</code> or <code>&#39;1&#39;</code>.</li>
</ul>"
---

```python
class Solution:
    def canBeValid(self, s: str, locked: str) -> bool:
        length = len(s)
        # If length of string is odd, return false.
        if length % 2 == 1:
            return False
        open_brackets = 0
        unlocked_count = 0
        # Iterate through the string to handle '(' and ')'.
        for i in range(length):
            if locked[i] == "0":
                unlocked_count += 1
            elif s[i] == "(":
                open_brackets += 1
            elif s[i] == ")":
                if open_brackets > 0:
                    open_brackets -= 1
                elif unlocked_count > 0:
                    unlocked_count -= 1
                else:
                    return False

        # Match remaining open brackets with unlocked characters.
        balance_count = 0
        for i in range(length - 1, -1, -1):
            if locked[i] == "0":
                balance_count -= 1
                unlocked_count -= 1
            elif s[i] == "(":
                balance_count += 1
                open_brackets -= 1
            elif s[i] == ")":
                balance_count -= 1
            if balance_count > 0:
                return False
            if unlocked_count == 0 and open_brackets == 0:
                break

        if open_brackets > 0:
            return False

        return True
```