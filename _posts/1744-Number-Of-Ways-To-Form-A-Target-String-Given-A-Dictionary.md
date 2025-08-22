---
title: "./1744 Number Of Ways To Form A Target String Given A Dictionary"
date: "2024-12-29T10:39:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/number-of-ways-to-form-a-target-string-given-a-dictionary">Number of Ways to Form a Target String Given a Dictionary</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>You are given a list of strings of the <strong>same length</strong> <code>words</code> and a string <code>target</code>.</p>

<p>Your task is to form <code>target</code> using the given <code>words</code> under the following rules:</p>

<ul>
	<li><code>target</code> should be formed from left to right.</li>
	<li>To form the <code>i<sup>th</sup></code> character (<strong>0-indexed</strong>) of <code>target</code>, you can choose the <code>k<sup>th</sup></code> character of the <code>j<sup>th</sup></code> string in <code>words</code> if <code>target[i] = words[j][k]</code>.</li>
	<li>Once you use the <code>k<sup>th</sup></code> character of the <code>j<sup>th</sup></code> string of <code>words</code>, you <strong>can no longer</strong> use the <code>x<sup>th</sup></code> character of any string in <code>words</code> where <code>x &lt;= k</code>. In other words, all characters to the left of or at index <code>k</code> become unusuable for every string.</li>
	<li>Repeat the process until you form the string <code>target</code>.</li>
</ul>

<p><strong>Notice</strong> that you can use <strong>multiple characters</strong> from the <strong>same string</strong> in <code>words</code> provided the conditions above are met.</p>

<p>Return <em>the number of ways to form <code>target</code> from <code>words</code></em>. Since the answer may be too large, return it <strong>modulo</strong> <code>10<sup>9</sup> + 7</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;acca&quot;,&quot;bbbb&quot;,&quot;caca&quot;], target = &quot;aba&quot;
<strong>Output:</strong> 6
<strong>Explanation:</strong> There are 6 ways to form target.
&quot;aba&quot; -&gt; index 0 (&quot;<u>a</u>cca&quot;), index 1 (&quot;b<u>b</u>bb&quot;), index 3 (&quot;cac<u>a</u>&quot;)
&quot;aba&quot; -&gt; index 0 (&quot;<u>a</u>cca&quot;), index 2 (&quot;bb<u>b</u>b&quot;), index 3 (&quot;cac<u>a</u>&quot;)
&quot;aba&quot; -&gt; index 0 (&quot;<u>a</u>cca&quot;), index 1 (&quot;b<u>b</u>bb&quot;), index 3 (&quot;acc<u>a</u>&quot;)
&quot;aba&quot; -&gt; index 0 (&quot;<u>a</u>cca&quot;), index 2 (&quot;bb<u>b</u>b&quot;), index 3 (&quot;acc<u>a</u>&quot;)
&quot;aba&quot; -&gt; index 1 (&quot;c<u>a</u>ca&quot;), index 2 (&quot;bb<u>b</u>b&quot;), index 3 (&quot;acc<u>a</u>&quot;)
&quot;aba&quot; -&gt; index 1 (&quot;c<u>a</u>ca&quot;), index 2 (&quot;bb<u>b</u>b&quot;), index 3 (&quot;cac<u>a</u>&quot;)
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> words = [&quot;abba&quot;,&quot;baab&quot;], target = &quot;bab&quot;
<strong>Output:</strong> 4
<strong>Explanation:</strong> There are 4 ways to form target.
&quot;bab&quot; -&gt; index 0 (&quot;<u>b</u>aab&quot;), index 1 (&quot;b<u>a</u>ab&quot;), index 2 (&quot;ab<u>b</u>a&quot;)
&quot;bab&quot; -&gt; index 0 (&quot;<u>b</u>aab&quot;), index 1 (&quot;b<u>a</u>ab&quot;), index 3 (&quot;baa<u>b</u>&quot;)
&quot;bab&quot; -&gt; index 0 (&quot;<u>b</u>aab&quot;), index 2 (&quot;ba<u>a</u>b&quot;), index 3 (&quot;baa<u>b</u>&quot;)
&quot;bab&quot; -&gt; index 1 (&quot;a<u>b</u>ba&quot;), index 2 (&quot;ba<u>a</u>b&quot;), index 3 (&quot;baa<u>b</u>&quot;)
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= words.length &lt;= 1000</code></li>
	<li><code>1 &lt;= words[i].length &lt;= 1000</code></li>
	<li>All strings in <code>words</code> have the same length.</li>
	<li><code>1 &lt;= target.length &lt;= 1000</code></li>
	<li><code>words[i]</code> and <code>target</code> contain only lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def numWays(self, words: List[str], target: str) -> int:
        
        freq = {}
        l = len(words[0])
        i = 0
        while(i < l):
            s = {}
            for k in words:
                if k[i] in s:
                    s[k[i]] += 1
                else:
                    s[k[i]] = 1
            freq[i] = s
            i += 1
        print(freq)
        
        # time complexity 
        # n words m length each = n * m
        # T[i,j,k] = 1 + T[i,j-1,k-1] if a[j] == target[k] in any string
        
        dp = [[0 for _ in range(len(target) + 1)] for _ in range(l + 1)]
        print(dp)
        # Base case: If the target length is 0, there's exactly 1 way to match it
        for i in range(l + 1):
            dp[i][0] = 1
        for i in range(1, l + 1):  # Iterate over columns in `freq`
            for j in range(1, len(target) + 1):  # Iterate over characters in `target`
        # Carry over the previous value (skip the current column)
                dp[i][j] = dp[i - 1][j]
        
        # If the current character matches and exists in freq[i - 1]
                if target[j - 1] in freq[i - 1]:
                    dp[i][j] += dp[i - 1][j - 1] * freq[i - 1][target[j - 1]]
        
            dp[i][j] %= (10 ** 9 + 7)  # Keep values modulo 10^9 + 7
        return dp[l][len(target)]



        @cache
        def recurse(idx, target, occ):
            if len(target) == 0:
                return occ
            result = 0
            i = idx
            while(i < l):
                if target[0] in freq[i]:
                    result += recurse(i+1, target[1:], occ * freq[i][target[0]])
                i += 1
            return result
        return recurse(0,target, 1) % (10 ** 9 + 7)
```