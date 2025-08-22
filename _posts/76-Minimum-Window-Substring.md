---
title: "./76 Minimum Window Substring"
date: "2024-06-02T23:56:09+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-window-substring">Minimum Window Substring</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Given two strings <code>s</code> and <code>t</code> of lengths <code>m</code> and <code>n</code> respectively, return <em>the <strong>minimum window</strong></em> <span data-keyword="substring-nonempty"><strong><em>substring</em></strong></span><em> of </em><code>s</code><em> such that every character in </em><code>t</code><em> (<strong>including duplicates</strong>) is included in the window</em>. If there is no such substring, return <em>the empty string </em><code>&quot;&quot;</code>.</p>

<p>The testcases will be generated such that the answer is <strong>unique</strong>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;ADOBECODEBANC&quot;, t = &quot;ABC&quot;
<strong>Output:</strong> &quot;BANC&quot;
<strong>Explanation:</strong> The minimum window substring &quot;BANC&quot; includes &#39;A&#39;, &#39;B&#39;, and &#39;C&#39; from string t.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;a&quot;, t = &quot;a&quot;
<strong>Output:</strong> &quot;a&quot;
<strong>Explanation:</strong> The entire string s is the minimum window.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;a&quot;, t = &quot;aa&quot;
<strong>Output:</strong> &quot;&quot;
<strong>Explanation:</strong> Both &#39;a&#39;s from t must be included in the window.
Since the largest window of s only has one &#39;a&#39;, return empty string.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == s.length</code></li>
	<li><code>n == t.length</code></li>
	<li><code>1 &lt;= m, n &lt;= 10<sup>5</sup></code></li>
	<li><code>s</code> and <code>t</code> consist of uppercase and lowercase English letters.</li>
</ul>

<p>&nbsp;</p>
<p><strong>Follow up:</strong> Could you find an algorithm that runs in <code>O(m + n)</code> time?</p>"
---

```python
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not t or not s:
            return ""
        
        from collections import Counter
        
        t_count = Counter(t)
        current_count = Counter()
        
        start = 0
        min_len = float('inf')
        min_start = 0
        
        required = len(t_count)
        formed = 0
        
        l, r = 0, 0
        
        while r < len(s):
            character = s[r]
            current_count[character] += 1
            
            if character in t_count and current_count[character] == t_count[character]:
                formed += 1
            
            while l <= r and formed == required:
                character = s[l]
                
                if r - l + 1 < min_len:
                    min_len = r - l + 1
                    min_start = l
                
                current_count[character] -= 1
                if character in t_count and current_count[character] < t_count[character]:
                    formed -= 1
                
                l += 1
            
            r += 1
        
        if min_len == float('inf'):
            return ""
        else:
            return s[min_start:min_start + min_len]

                                       
    def contains(self, k : str, ls : [int]) -> bool:
        if k.isupper():
                return ls[ord(k)-65] != 5000
        else:
                return ls[ord(k.upper())-39] != 5000

    def reduce(self, k : str, ls : [int] ) -> [int]:
        if k.isupper():
                ls[ord(k)-65] = ls[ord(k)-65]  - 1
        else:
                ls[ord(k.upper())-39] = ls[ord(k.upper())-39]  - 1
        return ls

    def increase(self, k : str, ls : [int] ) -> [int]:
        if k.isupper():
                ls[ord(k)-65] = ls[ord(k)-65]  + 1
        else:
                ls[ord(k.upper())-39] = ls[ord(k.upper())-39]  + 1
        return ls


    def get(self, k : str, ls : [int]) -> int:
        if k.isupper():
                return ls[ord(k)-65]
        else:
                return ls[ord(k.upper())-39]
    
    def is_complete(self, s : str, ls : [int]) -> bool:
        for k in s:
            if k.isupper():
                
                if not ls[ord(k)-65] <= 0:
                    return False
            else:
                print(s, False)
                if not ls[ord(k.upper())-39] <= 0:
                        return False
        return True

        
```