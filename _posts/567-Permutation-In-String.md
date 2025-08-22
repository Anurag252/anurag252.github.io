---
title: "./567 Permutation In String"
date: "2024-10-05T08:30:07+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/permutation-in-string">Permutation in String</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given two strings <code>s1</code> and <code>s2</code>, return <code>true</code> if <code>s2</code> contains a <span data-keyword="permutation-string">permutation</span> of <code>s1</code>, or <code>false</code> otherwise.</p>

<p>In other words, return <code>true</code> if one of <code>s1</code>&#39;s permutations is the substring of <code>s2</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s1 = &quot;ab&quot;, s2 = &quot;eidbaooo&quot;
<strong>Output:</strong> true
<strong>Explanation:</strong> s2 contains one permutation of s1 (&quot;ba&quot;).
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s1 = &quot;ab&quot;, s2 = &quot;eidboaoo&quot;
<strong>Output:</strong> false
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s1.length, s2.length &lt;= 10<sup>4</sup></code></li>
	<li><code>s1</code> and <code>s2</code> consist of lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:

        start = 0
        end = len(s1)-1
        arr_old = [0] * 26
        arr_new = [0] * 26
        for k in s1:
            arr_old[ord(k)-97] += 1
        for k in s2[start:end+1]:
            arr_new[ord(k)-97] += 1
        #print(arr_new)
        while(end < len(s2)-1):
            if ''.join(map(str,arr_old)) == ''.join(map(str,arr_new)):
                return True
            #print(''.join(map(str,arr_old)), ''.join(map(str,arr_new)))
            arr_new[ord(s2[start]) - 97] -= 1
            start += 1
            end += 1
            arr_new[ord(s2[end]) - 97] += 1
        if ''.join(map(str,arr_old)) == ''.join(map(str,arr_new)):
                return True 
        return False
        
        
```