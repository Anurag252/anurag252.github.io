---
title: "./2465 Shifting Letters Ii"
date: "2025-01-05T07:32:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/shifting-letters-ii">Shifting Letters II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>s</code> of lowercase English letters and a 2D integer array <code>shifts</code> where <code>shifts[i] = [start<sub>i</sub>, end<sub>i</sub>, direction<sub>i</sub>]</code>. For every <code>i</code>, <strong>shift</strong> the characters in <code>s</code> from the index <code>start<sub>i</sub></code> to the index <code>end<sub>i</sub></code> (<strong>inclusive</strong>) forward if <code>direction<sub>i</sub> = 1</code>, or shift the characters backward if <code>direction<sub>i</sub> = 0</code>.</p>

<p>Shifting a character <strong>forward</strong> means replacing it with the <strong>next</strong> letter in the alphabet (wrapping around so that <code>&#39;z&#39;</code> becomes <code>&#39;a&#39;</code>). Similarly, shifting a character <strong>backward</strong> means replacing it with the <strong>previous</strong> letter in the alphabet (wrapping around so that <code>&#39;a&#39;</code> becomes <code>&#39;z&#39;</code>).</p>

<p>Return <em>the final string after all such shifts to </em><code>s</code><em> are applied</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;abc&quot;, shifts = [[0,1,0],[1,2,1],[0,2,1]]
<strong>Output:</strong> &quot;ace&quot;
<strong>Explanation:</strong> Firstly, shift the characters from index 0 to index 1 backward. Now s = &quot;zac&quot;.
Secondly, shift the characters from index 1 to index 2 forward. Now s = &quot;zbd&quot;.
Finally, shift the characters from index 0 to index 2 forward. Now s = &quot;ace&quot;.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;dztz&quot;, shifts = [[0,0,0],[1,1,1]]
<strong>Output:</strong> &quot;catz&quot;
<strong>Explanation:</strong> Firstly, shift the characters from index 0 to index 0 backward. Now s = &quot;cztz&quot;.
Finally, shift the characters from index 1 to index 1 forward. Now s = &quot;catz&quot;.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s.length, shifts.length &lt;= 5 * 10<sup>4</sup></code></li>
	<li><code>shifts[i].length == 3</code></li>
	<li><code>0 &lt;= start<sub>i</sub> &lt;= end<sub>i</sub> &lt; s.length</code></li>
	<li><code>0 &lt;= direction<sub>i</sub> &lt;= 1</code></li>
	<li><code>s</code> consists of lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def shiftingLetters(self, s: str, shifts: List[List[int]]) -> str:
        arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

        arr1 = [0] * (len(s)+1)
        s1 = []

        shifts.sort(key=lambda x : (x[0], x[1]) )
        print(shifts)
        a = -1
        b = -1
        curr = 0

        for (k0, k1,k2) in shifts:
            arr1[k0] += (1 if k2 > 0 else -1)
            arr1[k1+1] += (-1 if k2 > 0 else 1)
            
            """
            if k2 == 0:
                for m in range(k0,k1+1):
                    arr1[m] -= 1
            else:
                for m in range(k0,k1+1):
                    arr1[m] += 1
            """
        pref = []
        temp = 0
        for a in arr1:
            temp += a
            pref.append(temp)


        def repl(idm, idx, curr):
            return arr[(idx + pref[idm]) % 26]
        curr = 0
        for idm, k in enumerate(s):
            idx = ord(k) - ord('a')
            s1.append(repl(idm, idx, curr))
        return "".join(s1)
            

        
```