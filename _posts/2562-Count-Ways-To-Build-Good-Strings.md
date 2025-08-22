---
title: "./2562 Count Ways To Build Good Strings"
date: "2024-12-30T09:26:39+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/count-ways-to-build-good-strings">Count Ways To Build Good Strings</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given the integers <code>zero</code>, <code>one</code>, <code>low</code>, and <code>high</code>, we can construct a string by starting with an empty string, and then at each step perform either of the following:</p>

<ul>
	<li>Append the character <code>&#39;0&#39;</code> <code>zero</code> times.</li>
	<li>Append the character <code>&#39;1&#39;</code> <code>one</code> times.</li>
</ul>

<p>This can be performed any number of times.</p>

<p>A <strong>good</strong> string is a string constructed by the above process having a <strong>length</strong> between <code>low</code> and <code>high</code> (<strong>inclusive</strong>).</p>

<p>Return <em>the number of <strong>different</strong> good strings that can be constructed satisfying these properties.</em> Since the answer can be large, return it <strong>modulo</strong> <code>10<sup>9</sup> + 7</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> low = 3, high = 3, zero = 1, one = 1
<strong>Output:</strong> 8
<strong>Explanation:</strong> 
One possible valid good string is &quot;011&quot;. 
It can be constructed as follows: &quot;&quot; -&gt; &quot;0&quot; -&gt; &quot;01&quot; -&gt; &quot;011&quot;. 
All binary strings from &quot;000&quot; to &quot;111&quot; are good strings in this example.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> low = 2, high = 3, zero = 1, one = 2
<strong>Output:</strong> 5
<strong>Explanation:</strong> The good strings are &quot;00&quot;, &quot;11&quot;, &quot;000&quot;, &quot;110&quot;, and &quot;011&quot;.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= low&nbsp;&lt;= high&nbsp;&lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= zero, one &lt;= low</code></li>
</ul>"
---

```python
class Solution:
    def countGoodStrings(self, low: int, high: int, zero: int, one: int) -> int:


        """
        T[j] = 1 + T[j-zero] + T[j-one] if j >= low
             = 0 if j > high
             = T[j-zero] + T[j-one]
        """

        
        T = [0] * (high+1)
        T[zero] += 1
        T[one] += 1

        for i in range(min(zero,one),high+1):
            if i == min(zero,one):
                continue
            if i > high+1:
                T[i] = 0
                continue
            if i >= low+1:
                T[i] += T[i-zero] + T[i-one]
                T[i] = T[i] % (10 ** 9 + 7)
                continue
            T[i] += T[i-zero] + T[i-one]
            T[i] = T[i] % (10 ** 9 + 7)
        return sum(T[low:high+2]) % (10 ** 9 + 7)
            

        @cache
        def recurse(count, l):
            if l > high:
                return 0
            if l >= low:
                return 1 + recurse(count , l + zero) + recurse(count , l + one) 
            return recurse(count , l + zero) + recurse(count , l + one)

        return recurse(0, 0) % (10 ** 9 + 7)
        
```