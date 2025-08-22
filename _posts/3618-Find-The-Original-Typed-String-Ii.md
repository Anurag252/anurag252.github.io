---
title: "./3618 Find The Original Typed String Ii"
date: "2025-07-02T07:55:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-the-original-typed-string-ii">Find the Original Typed String II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and <strong>may</strong> press a key for too long, resulting in a character being typed <strong>multiple</strong> times.</p>

<p>You are given a string <code>word</code>, which represents the <strong>final</strong> output displayed on Alice&#39;s screen. You are also given a <strong>positive</strong> integer <code>k</code>.</p>

<p>Return the total number of <em>possible</em> original strings that Alice <em>might</em> have intended to type, if she was trying to type a string of size <strong>at least</strong> <code>k</code>.</p>

<p>Since the answer may be very large, return it <strong>modulo</strong> <code>10<sup>9</sup> + 7</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;aabbccdd&quot;, k = 7</span></p>

<p><strong>Output:</strong> <span class="example-io">5</span></p>

<p><strong>Explanation:</strong></p>

<p>The possible strings are: <code>&quot;aabbccdd&quot;</code>, <code>&quot;aabbccd&quot;</code>, <code>&quot;aabbcdd&quot;</code>, <code>&quot;aabccdd&quot;</code>, and <code>&quot;abbccdd&quot;</code>.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;aabbccdd&quot;, k = 8</span></p>

<p><strong>Output:</strong> <span class="example-io">1</span></p>

<p><strong>Explanation:</strong></p>

<p>The only possible string is <code>&quot;aabbccdd&quot;</code>.</p>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;aaabbb&quot;, k = 3</span></p>

<p><strong>Output:</strong> <span class="example-io">8</span></p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= word.length &lt;= 5 * 10<sup>5</sup></code></li>
	<li><code>word</code> consists only of lowercase English letters.</li>
	<li><code>1 &lt;= k &lt;= 2000</code></li>
</ul>"
---

```python
class Solution:
    def possibleStringCount(self, word: str, k: int) -> int:
        mod = 10**9 + 7
        n, cnt = len(word), 1
        freq = list()

        for i in range(1, n):
            if word[i] == word[i - 1]:
                cnt += 1
            else:
                freq.append(cnt)
                cnt = 1
        freq.append(cnt)

        ans = 1
        for o in freq:
            ans = ans * o % mod

        if len(freq) >= k:
            return ans

        f, g = [1] + [0] * (k - 1), [1] * k
        for i in range(len(freq)):
            f_new = [0] * k
            for j in range(1, k):
                f_new[j] = g[j - 1]
                if j - freq[i] - 1 >= 0:
                    f_new[j] = (f_new[j] - g[j - freq[i] - 1]) % mod
            g_new = [f_new[0]] + [0] * (k - 1)
            for j in range(1, k):
                g_new[j] = (g_new[j - 1] + f_new[j]) % mod
            f, g = f_new, g_new
        return (ans - g[k - 1]) % mod
```