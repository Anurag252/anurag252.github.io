---
title: "./3195 Separate Black And White Balls"
date: "2024-10-15T08:55:17+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/separate-black-and-white-balls">Separate Black and White Balls</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There are <code>n</code> balls on a table, each ball has a color black or white.</p>

<p>You are given a <strong>0-indexed</strong> binary string <code>s</code> of length <code>n</code>, where <code>1</code> and <code>0</code> represent black and white balls, respectively.</p>

<p>In each step, you can choose two adjacent balls and swap them.</p>

<p>Return <em>the <strong>minimum</strong> number of steps to group all the black balls to the right and all the white balls to the left</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;101&quot;
<strong>Output:</strong> 1
<strong>Explanation:</strong> We can group all the black balls to the right in the following way:
- Swap s[0] and s[1], s = &quot;011&quot;.
Initially, 1s are not grouped together, requiring at least 1 step to group them to the right.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;100&quot;
<strong>Output:</strong> 2
<strong>Explanation:</strong> We can group all the black balls to the right in the following way:
- Swap s[0] and s[1], s = &quot;010&quot;.
- Swap s[1] and s[2], s = &quot;001&quot;.
It can be proven that the minimum number of steps needed is 2.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;0111&quot;
<strong>Output:</strong> 0
<strong>Explanation:</strong> All the black balls are already grouped to the right.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n == s.length &lt;= 10<sup>5</sup></code></li>
	<li><code>s[i]</code> is either <code>&#39;0&#39;</code> or <code>&#39;1&#39;</code>.</li>
</ul>"
---

```python
class Solution:
    def minimumSteps(self, s: str) -> int:

        arr = list(map(int, s))

        #print(arr)
        result = 0
        j = len(arr) - 1

        while(j >= 0 and arr[j] == 1):
                j -= 1
        # off by 1
        j += 1
        
        temp = j-1
        occ = 0
        count = 0
        while(temp >= 0):
            if arr[temp] == 1:
                result += (count - occ)
                occ += 1
            temp -= 1
            
            count += 1
        return result

        
        
#result += (pos - occ - 1)

        '''
        00000 101010 11111 011010
              101001
              100011

1 + 4-1-1 + 6-2-1

              101001
              100101
              100011
              010011
              001011
              000111

              000111
        101
        011
        10 -> 01
        01 
        110 -> 101, 011
        '''
        
```