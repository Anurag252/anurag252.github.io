---
title: "./3683 Find The Lexicographically Largest String From The Box I"
date: "2025-06-04T22:35:29+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-the-lexicographically-largest-string-from-the-box-i">Find the Lexicographically Largest String From the Box I</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>word</code>, and an integer <code>numFriends</code>.</p>

<p>Alice is organizing a game for her <code>numFriends</code> friends. There are multiple rounds in the game, where in each round:</p>

<ul>
	<li><code>word</code> is split into <code>numFriends</code> <strong>non-empty</strong> strings, such that no previous round has had the <strong>exact</strong> same split.</li>
	<li>All the split words are put into a box.</li>
</ul>

<p>Find the <span data-keyword="lexicographically-smaller-string">lexicographically largest</span> string from the box after all the rounds are finished.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;dbca&quot;, numFriends = 2</span></p>

<p><strong>Output:</strong> <span class="example-io">&quot;dbc&quot;</span></p>

<p><strong>Explanation:</strong>&nbsp;</p>

<p>All possible splits are:</p>

<ul>
	<li><code>&quot;d&quot;</code> and <code>&quot;bca&quot;</code>.</li>
	<li><code>&quot;db&quot;</code> and <code>&quot;ca&quot;</code>.</li>
	<li><code>&quot;dbc&quot;</code> and <code>&quot;a&quot;</code>.</li>
</ul>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">word = &quot;gggg&quot;, numFriends = 4</span></p>

<p><strong>Output:</strong> <span class="example-io">&quot;g&quot;</span></p>

<p><strong>Explanation:</strong>&nbsp;</p>

<p>The only possible split is: <code>&quot;g&quot;</code>, <code>&quot;g&quot;</code>, <code>&quot;g&quot;</code>, and <code>&quot;g&quot;</code>.</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= word.length &lt;= 5&nbsp;* 10<sup>3</sup></code></li>
	<li><code>word</code> consists only of lowercase English letters.</li>
	<li><code>1 &lt;= numFriends &lt;= word.length</code></li>
</ul>"
---

```python
class Solution:
    def answerString(self, words: str, numFriends: int) -> str:
        """
        use higher letter, 
        then higher length
        if we enumerate all splits in 2 grps - we take n 
        in size 3 we need n2
        so k grps n^k 
        largest size of string can be len-k + 1,
         then look for at lest len-k length string from largest char ,
         if not possible then go smaller 

        if we want largest , then look for 
        """
        mn = 'a'
        idx = -1
        for m, k in enumerate(words):
            if mn < k:
                mn = k
        
        idxs = []
        for m, k in enumerate(words):
            if k == mn:
                idxs.append(m)

        # smaller case is still pending
        # in case numFriends grps 
        if numFriends == 1:
            return words
        res = []
        for idx in idxs:
            if idx + len(words) - numFriends + 1 < len(words):
                res.append(words[idx: idx + len(words)-numFriends + 1])
            else :
                res.append(words[idx:])
        res.sort()
        return res[-1]



```