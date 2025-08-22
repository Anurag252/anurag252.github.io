---
title: "./1524 String Matching In An Array"
date: "2025-01-07T07:49:20+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/string-matching-in-an-array">String Matching in an Array</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given an array of string <code>words</code>, return <em>all strings in </em><code>words</code><em> that is a <strong>substring</strong> of another word</em>. You can return the answer in <strong>any order</strong>.</p>

<p>A <strong>substring</strong> is a contiguous sequence of characters within a string</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;mass&quot;,&quot;as&quot;,&quot;hero&quot;,&quot;superhero&quot;]
<strong>Output:</strong> [&quot;as&quot;,&quot;hero&quot;]
<strong>Explanation:</strong> &quot;as&quot; is substring of &quot;mass&quot; and &quot;hero&quot; is substring of &quot;superhero&quot;.
[&quot;hero&quot;,&quot;as&quot;] is also a valid answer.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;leetcode&quot;,&quot;et&quot;,&quot;code&quot;]
<strong>Output:</strong> [&quot;et&quot;,&quot;code&quot;]
<strong>Explanation:</strong> &quot;et&quot;, &quot;code&quot; are substring of &quot;leetcode&quot;.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;blue&quot;,&quot;green&quot;,&quot;bu&quot;]
<strong>Output:</strong> []
<strong>Explanation:</strong> No string of words is substring of another string.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= words.length &lt;= 100</code></li>
	<li><code>1 &lt;= words[i].length &lt;= 30</code></li>
	<li><code>words[i]</code> contains only lowercase English letters.</li>
	<li>All the strings of <code>words</code> are <strong>unique</strong>.</li>
</ul>"
---

```python
class Trie:
    def __init__(self):
        self.dict = {}

    def traverse_recurse(self, root, s):
        if len(s) == 0:
            return
        if s[0] in root:
                self.traverse_recurse(root[s[0]], s[1:])
        else:
            root[s[0]] = {}
            self.traverse_recurse(root[s[0]], s[1:])

    def traverse(self, root, s) -> bool:
        if len(s) == 0:
            return True
        if s[0] in root:
            return self.traverse(root[s[0]], s[1:])
        else:
            return False

    def insert(self, s):
        root = self.dict
        self.traverse_recurse(root, s)

    def contains(self, s) -> bool:
        root = self.dict
        return self.traverse(root, s)





class Solution:
    def stringMatching(self, words: List[str]) -> List[str]:

        t = Trie()

        words.sort(key = lambda x: -len(x))
        res = []
        for k in words:
            if t.contains(k):
                res.append(k)
            for i in range(0, len(k)):
                t.insert(k[i:])
        return res
        
```