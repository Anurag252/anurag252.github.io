---
title: "./2300 Construct String With Repeat Limit"
date: "2024-12-17T08:51:50+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/construct-string-with-repeat-limit">Construct String With Repeat Limit</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>s</code> and an integer <code>repeatLimit</code>. Construct a new string <code>repeatLimitedString</code> using the characters of <code>s</code> such that no letter appears <strong>more than</strong> <code>repeatLimit</code> times <strong>in a row</strong>. You do <strong>not</strong> have to use all characters from <code>s</code>.</p>

<p>Return <em>the <strong>lexicographically largest</strong> </em><code>repeatLimitedString</code> <em>possible</em>.</p>

<p>A string <code>a</code> is <strong>lexicographically larger</strong> than a string <code>b</code> if in the first position where <code>a</code> and <code>b</code> differ, string <code>a</code> has a letter that appears later in the alphabet than the corresponding letter in <code>b</code>. If the first <code>min(a.length, b.length)</code> characters do not differ, then the longer string is the lexicographically larger one.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;cczazcc&quot;, repeatLimit = 3
<strong>Output:</strong> &quot;zzcccac&quot;
<strong>Explanation:</strong> We use all of the characters from s to construct the repeatLimitedString &quot;zzcccac&quot;.
The letter &#39;a&#39; appears at most 1 time in a row.
The letter &#39;c&#39; appears at most 3 times in a row.
The letter &#39;z&#39; appears at most 2 times in a row.
Hence, no letter appears more than repeatLimit times in a row and the string is a valid repeatLimitedString.
The string is the lexicographically largest repeatLimitedString possible so we return &quot;zzcccac&quot;.
Note that the string &quot;zzcccca&quot; is lexicographically larger but the letter &#39;c&#39; appears more than 3 times in a row, so it is not a valid repeatLimitedString.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;aababab&quot;, repeatLimit = 2
<strong>Output:</strong> &quot;bbabaa&quot;
<strong>Explanation:</strong> We use only some of the characters from s to construct the repeatLimitedString &quot;bbabaa&quot;. 
The letter &#39;a&#39; appears at most 2 times in a row.
The letter &#39;b&#39; appears at most 2 times in a row.
Hence, no letter appears more than repeatLimit times in a row and the string is a valid repeatLimitedString.
The string is the lexicographically largest repeatLimitedString possible so we return &quot;bbabaa&quot;.
Note that the string &quot;bbabaaa&quot; is lexicographically larger but the letter &#39;a&#39; appears more than 2 times in a row, so it is not a valid repeatLimitedString.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= repeatLimit &lt;= s.length &lt;= 10<sup>5</sup></code></li>
	<li><code>s</code> consists of lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def repeatLimitedString(self, s: str, repeatLimit: int) -> str:
        freq = {}
        h = []



        for k in s:
            if k in freq:
                freq[k] += 1
            else:
                freq[k] = 1

        for k in freq.keys():
            heapq.heappush(h, -(ord(k)))

        prev = -1
        ls = []
        while(h):
            item1 = -heapq.heappop(h)
            if item1 == prev and h:
                item2 = -heapq.heappop(h)
                heapq.heappush(h, -item1) # push back item1

                prev = item2
                ls.append(chr(item2))
                freq[chr(item2)] -= 1
                if freq[chr(item2)] > 0:
                    heapq.heappush(h, -item2) # push next char just once


            elif item1 != prev:
                t = 0
                prev = item1
                while t < min(repeatLimit,freq[chr(item1)] ):
                    ls.append(chr(item1))
                    t += 1
                freq[chr(item1)] -= t
                if freq[chr(item1)] > 0:
                    heapq.heappush(h, -item1)
            else:
                break
        return "".join(ls)

            



        

        
```