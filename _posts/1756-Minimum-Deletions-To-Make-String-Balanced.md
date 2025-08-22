---
title: "./1756 Minimum Deletions To Make String Balanced"
date: "2024-07-30T06:38:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-deletions-to-make-string-balanced">Minimum Deletions to Make String Balanced</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>s</code> consisting only of characters <code>&#39;a&#39;</code> and <code>&#39;b&#39;</code>​​​​.</p>

<p>You can delete any number of characters in <code>s</code> to make <code>s</code> <strong>balanced</strong>. <code>s</code> is <strong>balanced</strong> if there is no pair of indices <code>(i,j)</code> such that <code>i &lt; j</code> and <code>s[i] = &#39;b&#39;</code> and <code>s[j]= &#39;a&#39;</code>.</p>

<p>Return <em>the <strong>minimum</strong> number of deletions needed to make </em><code>s</code><em> <strong>balanced</strong></em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;aababbab&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> You can either:
Delete the characters at 0-indexed positions 2 and 6 (&quot;aa<u>b</u>abb<u>a</u>b&quot; -&gt; &quot;aaabbb&quot;), or
Delete the characters at 0-indexed positions 3 and 6 (&quot;aab<u>a</u>bb<u>a</u>b&quot; -&gt; &quot;aabbbb&quot;).
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;bbaaaaabb&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> The only solution is to delete the first two characters.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s.length &lt;= 10<sup>5</sup></code></li>
	<li><code>s[i]</code> is&nbsp;<code>&#39;a&#39;</code> or <code>&#39;b&#39;</code>​​.</li>
</ul>"
---

```python
class Solution:
    def minimumDeletions(self, s: str) -> int:
        la = [0] * len(s)
        lb = [0] * len(s)
        i = 0
        temp = 0
        for k in s:
            la[i] = temp
            if k == 'b':
                temp += 1
            
            i += 1
        j = len(s) - 1
        temp = 0
        for k in range(len(s)):
            lb[j] = temp
            if s[len(s) -k-1] == 'a':
                temp += 1
            
            j -= 1
        
        
        result = 100000
        for k in range(len(s)):
            result = min(result, la[k] + lb[k])
        return result


        # for every a at i , find number of bs to left
        # for every b at i , find number of as to right. 
        # navigate each array one by one, 
        # we can remove any element and then all numbers to left or right reduce by 1,
        # we can remove the number altogather
        #0,0,b,1,b,b,3,0
        #a,a,2,a,1,1,a,0
        
```