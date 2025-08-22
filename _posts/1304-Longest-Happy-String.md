---
title: "./1304 Longest Happy String"
date: "2024-10-16T08:34:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/longest-happy-string">Longest Happy String</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>A string <code>s</code> is called <strong>happy</strong> if it satisfies the following conditions:</p>

<ul>
	<li><code>s</code> only contains the letters <code>&#39;a&#39;</code>, <code>&#39;b&#39;</code>, and <code>&#39;c&#39;</code>.</li>
	<li><code>s</code> does not contain any of <code>&quot;aaa&quot;</code>, <code>&quot;bbb&quot;</code>, or <code>&quot;ccc&quot;</code> as a substring.</li>
	<li><code>s</code> contains <strong>at most</strong> <code>a</code> occurrences of the letter <code>&#39;a&#39;</code>.</li>
	<li><code>s</code> contains <strong>at most</strong> <code>b</code> occurrences of the letter <code>&#39;b&#39;</code>.</li>
	<li><code>s</code> contains <strong>at most</strong> <code>c</code> occurrences of the letter <code>&#39;c&#39;</code>.</li>
</ul>

<p>Given three integers <code>a</code>, <code>b</code>, and <code>c</code>, return <em>the <strong>longest possible happy </strong>string</em>. If there are multiple longest happy strings, return <em>any of them</em>. If there is no such string, return <em>the empty string </em><code>&quot;&quot;</code>.</p>

<p>A <strong>substring</strong> is a contiguous sequence of characters within a string.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> a = 1, b = 1, c = 7
<strong>Output:</strong> &quot;ccaccbcc&quot;
<strong>Explanation:</strong> &quot;ccbccacc&quot; would also be a correct answer.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> a = 7, b = 1, c = 0
<strong>Output:</strong> &quot;aabaa&quot;
<strong>Explanation:</strong> It is the only correct answer in this case.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>0 &lt;= a, b, c &lt;= 100</code></li>
	<li><code>a + b + c &gt; 0</code></li>
</ul>"
---

```python
class Solution:
    def longestDiverseString(self, a: int, b: int, c: int) -> str:



        def test(a,b,c, d):
            if (a == 0 and b == 0 and d == "c") or (b == 0 and c == 0 and d == "a") or (c== 0 and a == 0 and d == "b"):
                return ""


            arr = [(a, "a"),(b, "b"),(c, "c")]
            arr.sort(key = lambda x : x[0])

            (k,l) = arr[2] if d != arr[2][1] else arr[1]
            is_max = True
            if k != arr[2][0]:
                is_max = False

            #print(arr,d)

            if l == "a" :
                if is_max:
                    return "a"*min(2,k) + test(a - min(2,k) , b, c, "a")
                else:
                    return "a" + test(a - 1 , b, c, "a")


            if l == "b":
                if is_max:
                    return "b"*min(2,k) + test(a  , b - min(2,k), c, "b")
                else:
                    return "b" + test(a  , b - 1, c, "b")


            if l == "c":
                if is_max:
                    return "c"*min(2,k) + test(a  , b, c - min(2,k), "c")
                else:
                    return "c" + test(a  , b, c - 1, "c")

        return test(a,b,c, "")
            
        '''
        3,3,3
        aacbbccba
        bbccbc
        aabaccbcb
        '''
        
```