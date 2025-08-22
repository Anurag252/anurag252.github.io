---
title: "./650 2 Keys Keyboard"
date: "2024-08-19T08:15:28+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/2-keys-keyboard">2 Keys Keyboard</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There is only one character <code>&#39;A&#39;</code> on the screen of a notepad. You can perform one of two operations on this notepad for each step:</p>

<ul>
	<li>Copy All: You can copy all the characters present on the screen (a partial copy is not allowed).</li>
	<li>Paste: You can paste the characters which are copied last time.</li>
</ul>

<p>Given an integer <code>n</code>, return <em>the minimum number of operations to get the character</em> <code>&#39;A&#39;</code> <em>exactly</em> <code>n</code> <em>times on the screen</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> n = 3
<strong>Output:</strong> 3
<strong>Explanation:</strong> Initially, we have one character &#39;A&#39;.
In step 1, we use Copy All operation.
In step 2, we use Paste operation to get &#39;AA&#39;.
In step 3, we use Paste operation to get &#39;AAA&#39;.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> n = 1
<strong>Output:</strong> 0
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 1000</code></li>
</ul>"
---

```python
class Solution:
    def __init__(self):
        self.cache = {}
    def minSteps(self, n: int, lastchar : str = "", screen = "A") -> int:
        if (lastchar, screen) in self.cache:
            return self.cache[(lastchar, screen)]
        if n == len(screen) :
            return 0
        if n < len(screen):
            return 1000000
        if lastchar == "":
            if n == 1:
                return 0
            v = 2 + self.minSteps(n, "A", screen +  "A")
            self.cache[(lastchar, screen)] = v
            return v
        else:
            v =  min(1 + self.minSteps(n, lastchar, screen +  lastchar), 
                2 + self.minSteps(n, screen, screen +  screen))
            self.cache[(lastchar, screen)] = v
            return v
        
```