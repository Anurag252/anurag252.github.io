---
title: "./3617 Find The Original Typed String I"
date: "2025-07-01T09:33:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-the-original-typed-string-i">Find the Original Typed String I</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and <strong>may</strong> press a key for too long, resulting in a character being typed <strong>multiple</strong> times.</p>

<p>Although Alice tried to focus on her typing, she is aware that she may still have done this <strong>at most</strong> <em>once</em>.</p>

<p>You are given a string <code>word</code>, which represents the <strong>final</strong> output displayed on Alice&#39;s screen.</p>

<p>Return the total number of <em>possible</em> original strings that Alice <em>might</em> have intended to type.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;abbcccc&quot;</span></p>

<p><strong>Output:</strong> <span class="example-io">5</span></p>

<p><strong>Explanation:</strong></p>

<p>The possible strings are: <code>&quot;abbcccc&quot;</code>, <code>&quot;abbccc&quot;</code>, <code>&quot;abbcc&quot;</code>, <code>&quot;abbc&quot;</code>, and <code>&quot;abcccc&quot;</code>.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;abcd&quot;</span></p>

<p><strong>Output:</strong> <span class="example-io">1</span></p>

<p><strong>Explanation:</strong></p>

<p>The only possible string is <code>&quot;abcd&quot;</code>.</p>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;aaaa&quot;</span></p>

<p><strong>Output:</strong> <span class="example-io">4</span></p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= word.length &lt;= 100</code></li>
	<li><code>word</code> consists only of lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def possibleStringCount(self, word: str) -> int:
        possibility = 1
        for i, k in enumerate(word):
            if i < len(word)-1 and word[i+1] == k:
                possibility += 1
        
        return possibility

        
```