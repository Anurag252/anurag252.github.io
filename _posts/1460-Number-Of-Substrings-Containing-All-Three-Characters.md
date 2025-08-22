---
title: "./1460 Number Of Substrings Containing All Three Characters"
date: "2025-03-11T19:23:14+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/number-of-substrings-containing-all-three-characters">Number of Substrings Containing All Three Characters</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a string <code>s</code>&nbsp;consisting only of characters <em>a</em>, <em>b</em> and <em>c</em>.</p>

<p>Return the number of substrings containing <b>at least</b>&nbsp;one occurrence of all these characters <em>a</em>, <em>b</em> and <em>c</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;abcabc&quot;
<strong>Output:</strong> 10
<strong>Explanation:</strong> The substrings containing&nbsp;at least&nbsp;one occurrence of the characters&nbsp;<em>a</em>,&nbsp;<em>b</em>&nbsp;and&nbsp;<em>c are &quot;</em>abc<em>&quot;, &quot;</em>abca<em>&quot;, &quot;</em>abcab<em>&quot;, &quot;</em>abcabc<em>&quot;, &quot;</em>bca<em>&quot;, &quot;</em>bcab<em>&quot;, &quot;</em>bcabc<em>&quot;, &quot;</em>cab<em>&quot;, &quot;</em>cabc<em>&quot; </em>and<em> &quot;</em>abc<em>&quot; </em>(<strong>again</strong>)<em>. </em>
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;aaacb&quot;
<strong>Output:</strong> 3
<strong>Explanation:</strong> The substrings containing&nbsp;at least&nbsp;one occurrence of the characters&nbsp;<em>a</em>,&nbsp;<em>b</em>&nbsp;and&nbsp;<em>c are &quot;</em>aaacb<em>&quot;, &quot;</em>aacb<em>&quot; </em>and<em> &quot;</em>acb<em>&quot;.</em><em> </em>
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;abc&quot;
<strong>Output:</strong> 1
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>3 &lt;= s.length &lt;= 5 x 10^4</code></li>
	<li><code>s</code>&nbsp;only consists of&nbsp;<em>a</em>, <em>b</em> or <em>c&nbsp;</em>characters.</li>
</ul>"
---

```python
class Solution:
    def numberOfSubstrings(self, s: str) -> int:
        # at least one occurence 
        # one way is that we could loop twice 
        # its too slow, how can we just loop once outside
        # all substr starting at i and fulfils the condt at j 
        # then s[i:j] -> end is the substr
        # we do not need to go till end and just need count if i and j
        # then len(s) - j + 1 for strings starting at i
        # so a sliding window , where we inc when till condition is satisfied and 
        # record the j 
        # then decrement the start by one and keep doing the same 

        left = 0
        right = 0
        a = 0
        b = 0
        c = 0
        res = []
        while(left < len(s)):
            #print(left, right, res)
            if a > 0 and b > 0 and c > 0:
                res.append(right)
                if s[left] == 'a':
                    a -= 1
                if s[left] == 'b':
                    b -= 1
                if s[left] == 'c':
                    c -= 1
                left += 1
            else:
                if right == len(s):
                    break
                if s[right] == 'a':
                    a += 1
                if s[right] == 'b':
                    b += 1
                if s[right] == 'c':
                    c += 1
                right += 1

        
        if a > 0 and b > 0 and c > 0:
                res.append(right)
        r = 0
        for k in res :
            r += (len(s) - k + 1)
        #print(res)
        return r

            


        
        
```