---
title: "./1566 Check If A Word Occurs As A Prefix Of Any Word In A Sentence"
date: "2024-12-02T08:53:25+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence">Check If a Word Occurs As a Prefix of Any Word in a Sentence</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given a <code>sentence</code> that consists of some words separated by a <strong>single space</strong>, and a <code>searchWord</code>, check if <code>searchWord</code> is a prefix of any word in <code>sentence</code>.</p>

<p>Return <em>the index of the word in </em><code>sentence</code><em> (<strong>1-indexed</strong>) where </em><code>searchWord</code><em> is a prefix of this word</em>. If <code>searchWord</code> is a prefix of more than one word, return the index of the first word <strong>(minimum index)</strong>. If there is no such word return <code>-1</code>.</p>

<p>A <strong>prefix</strong> of a string <code>s</code> is any leading contiguous substring of <code>s</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> sentence = &quot;i love eating burger&quot;, searchWord = &quot;burg&quot;
<strong>Output:</strong> 4
<strong>Explanation:</strong> &quot;burg&quot; is prefix of &quot;burger&quot; which is the 4th word in the sentence.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> sentence = &quot;this problem is an easy problem&quot;, searchWord = &quot;pro&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> &quot;pro&quot; is prefix of &quot;problem&quot; which is the 2nd and the 6th word in the sentence, but we return 2 as it&#39;s the minimal index.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> sentence = &quot;i am tired&quot;, searchWord = &quot;you&quot;
<strong>Output:</strong> -1
<strong>Explanation:</strong> &quot;you&quot; is not a prefix of any word in the sentence.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= sentence.length &lt;= 100</code></li>
	<li><code>1 &lt;= searchWord.length &lt;= 10</code></li>
	<li><code>sentence</code> consists of lowercase English letters and spaces.</li>
	<li><code>searchWord</code> consists of lowercase English letters.</li>
</ul>"
---

```python
class Node:
    def __init__(self):
        self.end = False
        self.mp = {}
        self.curr = ""
        self.count = []


class Trie:
    def __init__(self):
        self.root = Node()
        self.temp = self.root
        

    def insert(self, s, temp, count):
        
        if temp == None:
            temp = self.root
        print(s, temp.mp)
        if len(s) == 0:
            return
        set_end = False
        if s[0] in temp.mp:
            temp.count.append((count, s[0]))
            temp = temp.mp[s[0]]
            self.insert(s[1:], temp, count)

        else:
            temp.mp[s[0]] = Node()
            temp.curr = s[0]
            temp.count.append((count, s[0]))
            temp = temp.mp[s[0]]
            print(temp)
            self.insert(s[1:], temp, count)

    def isprefix(self, s, temp):
       
        if temp == None:
            temp = self.root
            #return min(temp.count) if s[0] in temp.mp  and len(temp.count) > 0 else -1 #and temp[s[0]].end

        #print(s, temp.mp, temp.count)
        #isending = False
        if len(s) == 1 and s[0] in temp.mp:
                #print(temp.count)
                for k in temp.count:
                    if k[1] == s:
                        return k[0]
                return -1
        
        if s[0] in temp.mp:
            return self.isprefix(s[1:], temp.mp[s[0]]) 
        else:
            return -1



class Solution:
    def isPrefixOfWord(self, sentence: str, searchWord: str) -> int:
        t = Trie()
        for idx,k in enumerate(sentence.split(' ')):
            t.insert(k, None, idx+1)
            #print(t)
        return t.isprefix(searchWord, None)


        
```