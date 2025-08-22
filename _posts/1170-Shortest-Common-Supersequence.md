---
title: "./1170 Shortest Common Supersequence"
date: "2025-02-28T09:36:07+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/shortest-common-supersequence">Shortest Common Supersequence </a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Given two strings <code>str1</code> and <code>str2</code>, return <em>the shortest string that has both </em><code>str1</code><em> and </em><code>str2</code><em> as <strong>subsequences</strong></em>. If there are multiple valid strings, return <strong>any</strong> of them.</p>

<p>A string <code>s</code> is a <strong>subsequence</strong> of string <code>t</code> if deleting some number of characters from <code>t</code> (possibly <code>0</code>) results in the string <code>s</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> str1 = &quot;abac&quot;, str2 = &quot;cab&quot;
<strong>Output:</strong> &quot;cabac&quot;
<strong>Explanation:</strong> 
str1 = &quot;abac&quot; is a subsequence of &quot;cabac&quot; because we can delete the first &quot;c&quot;.
str2 = &quot;cab&quot; is a subsequence of &quot;cabac&quot; because we can delete the last &quot;ac&quot;.
The answer provided is the shortest such string that satisfies these properties.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> str1 = &quot;aaaaaaaa&quot;, str2 = &quot;aaaaaaaa&quot;
<strong>Output:</strong> &quot;aaaaaaaa&quot;
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= str1.length, str2.length &lt;= 1000</code></li>
	<li><code>str1</code> and <code>str2</code> consist of lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def shortestCommonSupersequence(self, str1: str, str2: str) -> str:
        # it is possible that s1 is sub sequence of s2 
        # then s2 is ans
        # a sub string of s1 is subsequence of s2
        # then shortest would be s1`+common+s2`
        # how to check if something s a subseq -> 
        # T[i,j] = T[i-1,j-1] if a[i] == a[j]
        #        = False
        # in the arr find the longest True or 1 occurence
        # and attach the remaining chars at start or end, many ans possible
        m, n = len(str1), len(str2)

        # Step 1: Compute LCS table
        T = [[0] * (n + 1) for _ in range(m + 1)]
        
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if str1[i - 1] == str2[j - 1]:
                    T[i][j] = 1 + T[i - 1][j - 1]
                else:
                    T[i][j] = max(T[i - 1][j], T[i][j - 1])
        
        # Step 2: Backtrack to get LCS
        i, j = m, n
        lcs = []
        # this is very imp as I got this incorrect , LCS needs back tracking 
        # a simple max_len - adoes not work
        while i > 0 and j > 0:
            if str1[i - 1] == str2[j - 1]:
                lcs.append(str1[i - 1])
                i -= 1
                j -= 1
            elif T[i - 1][j] >= T[i][j - 1]:
                i -= 1
            else:
                j -= 1
        
        lcs.reverse()
        lcs = ''.join(lcs)

        # Step 3: Construct SCS using LCS as anchor
        i, j = 0, 0
        scs = []

        for c in lcs:
            while i < len(str1) and str1[i] != c:
                scs.append(str1[i])
                i += 1
            while j < len(str2) and str2[j] != c:
                scs.append(str2[j])
                j += 1
            scs.append(c)
            i += 1
            j += 1

        scs.append(str1[i:])
        scs.append(str2[j:])

        return ''.join(scs)


```