---
title: "./2292 Counting Words With A Given Prefix"
date: "2025-01-09T06:45:13+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/counting-words-with-a-given-prefix">Counting Words With a Given Prefix</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>You are given an array of strings <code>words</code> and a string <code>pref</code>.</p>

<p>Return <em>the number of strings in </em><code>words</code><em> that contain </em><code>pref</code><em> as a <strong>prefix</strong></em>.</p>

<p>A <strong>prefix</strong> of a string <code>s</code> is any leading contiguous substring of <code>s</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;pay&quot;,&quot;<strong><u>at</u></strong>tention&quot;,&quot;practice&quot;,&quot;<u><strong>at</strong></u>tend&quot;], <code>pref </code>= &quot;at&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> The 2 strings that contain &quot;at&quot; as a prefix are: &quot;<u><strong>at</strong></u>tention&quot; and &quot;<u><strong>at</strong></u>tend&quot;.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;leetcode&quot;,&quot;win&quot;,&quot;loops&quot;,&quot;success&quot;], <code>pref </code>= &quot;code&quot;
<strong>Output:</strong> 0
<strong>Explanation:</strong> There are no strings that contain &quot;code&quot; as a prefix.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= words.length &lt;= 100</code></li>
	<li><code>1 &lt;= words[i].length, pref.length &lt;= 100</code></li>
	<li><code>words[i]</code> and <code>pref</code> consist of lowercase English letters.</li>
</ul>"
---

```python
class Trie:
    def __init__(self):
        self.dict = {}

    def insert_traverse(self, root,  a):
        if len(a) == 0:
            return
        if a[0] in root:
            root[a[0]] = (root[a[0]][0], root[a[0]][1] + 1)
            self.insert_traverse(root[a[0]][0], a[1:])
        else:
            root[a[0]] = ({}, 1)
            self.insert_traverse(root[a[0]][0], a[1:])
            

    def insert(self, a):
        root = self.dict
        self.insert_traverse(root, a)

    def traverse(self, root, a):
        if len(a) == 1:
            return root[a][1] if a in root else 0
        if a[0] in root:
            return self.traverse(root[a[0]][0], a[1:])
        else:
            return 0

    def find(self, a):
        root = self.dict
        return self.traverse(root, a)

class Solution:
    def prefixCount(self, words: List[str], pref: str) -> int:
        t = Trie()
        for k in words:
            t.insert(k)

        return t.find(pref)

        
```