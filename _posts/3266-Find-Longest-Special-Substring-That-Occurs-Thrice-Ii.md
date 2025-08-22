---
title: "./3266 Find Longest Special Substring That Occurs Thrice Ii"
date: "2024-12-11T16:37:48+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-ii">Find Longest Special Substring That Occurs Thrice II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>s</code> that consists of lowercase English letters.</p>

<p>A string is called <strong>special</strong> if it is made up of only a single character. For example, the string <code>&quot;abc&quot;</code> is not special, whereas the strings <code>&quot;ddd&quot;</code>, <code>&quot;zz&quot;</code>, and <code>&quot;f&quot;</code> are special.</p>

<p>Return <em>the length of the <strong>longest special substring</strong> of </em><code>s</code> <em>which occurs <strong>at least thrice</strong></em>, <em>or </em><code>-1</code><em> if no special substring occurs at least thrice</em>.</p>

<p>A <strong>substring</strong> is a contiguous <strong>non-empty</strong> sequence of characters within a string.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;aaaa&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> The longest special substring which occurs thrice is &quot;aa&quot;: substrings &quot;<u><strong>aa</strong></u>aa&quot;, &quot;a<u><strong>aa</strong></u>a&quot;, and &quot;aa<u><strong>aa</strong></u>&quot;.
It can be shown that the maximum length achievable is 2.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;abcdef&quot;
<strong>Output:</strong> -1
<strong>Explanation:</strong> There exists no special substring which occurs at least thrice. Hence return -1.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;abcaba&quot;
<strong>Output:</strong> 1
<strong>Explanation:</strong> The longest special substring which occurs thrice is &quot;a&quot;: substrings &quot;<u><strong>a</strong></u>bcaba&quot;, &quot;abc<u><strong>a</strong></u>ba&quot;, and &quot;abcab<u><strong>a</strong></u>&quot;.
It can be shown that the maximum length achievable is 1.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>3 &lt;= s.length &lt;= 5 * 10<sup>5</sup></code></li>
	<li><code>s</code> consists of only lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def maximumLength(self, s: str) -> int:
        f = {}
        i = 0
        while(i < len(s)):
            j = i + 1
            while j < len(s) and s[j] == s[i]:
                j += 1
            if s[i] in f:
                if len(f[s[i]]) >= 3:
                    if f[s[i]][0]  == min(f[s[i]]):
                        f[s[i]][0] = j - i
                    elif f[s[i]][1]  == min(f[s[i]]):
                        f[s[i]][1] = j - i
                    else:
                        f[s[i]][2] = j - i
                else:
                    f[s[i]].append(j - i)
            else :
                f[s[i]] = []
                f[s[i]].append(j - i)
            i = j
        print(f)
        res = -1
        for v in f.values():
            if sum(v) >= 3:
                res = max(1, res)
                v.sort()
                if len(v) == 3 and v[1] < v[2]:
                    res = max(res, max(v[2]-2, v[1]))
                elif len(v) == 2 and v[0] < v[1]:
                    res = max(res, max(v[1]-2, v[0]))
                elif len(v) == 1 :
                    res = max(res, v[0]-2)
                else :
                    print(v)
                    if len(v) >= 3 and len(set(v)) == 1:
                        res = max(res, max(v))
                        continue
                    if len(v) >= 3 and len(set(v)) == 2:
                        res = max(res, max(v)-1)
                        continue
                    if len(v) < 3 and len(set(v)) == 1:
                        res = max(res, max(v)-1)
                        continue
                    if len(v) < 3 and len(set(v)) == 2:
                        res = max(res, max(v)-1)
                        continue
                #ans is always max(v) - 1 0r max(v)-2

        return res






"""
        4 -3 + 1
        min(num of continuos occurence) -  3 + 1
        aaaa aaa aa
        aa 
        4,3,2
        """
```