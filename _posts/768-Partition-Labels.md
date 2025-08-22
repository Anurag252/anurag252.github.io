---
title: "./768 Partition Labels"
date: "2025-03-30T10:38:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/partition-labels">Partition Labels</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a string <code>s</code>. We want to partition the string into as many parts as possible so that each letter appears in at most one part. For example, the string <code>&quot;ababcc&quot;</code> can be partitioned into <code>[&quot;abab&quot;, &quot;cc&quot;]</code>, but partitions such as <code>[&quot;aba&quot;, &quot;bcc&quot;]</code> or <code>[&quot;ab&quot;, &quot;ab&quot;, &quot;cc&quot;]</code> are invalid.</p>

<p>Note that the partition is done so that after concatenating all the parts in order, the resultant string should be <code>s</code>.</p>

<p>Return <em>a list of integers representing the size of these parts</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;ababcbacadefegdehijhklij&quot;
<strong>Output:</strong> [9,7,8]
<strong>Explanation:</strong>
The partition is &quot;ababcbaca&quot;, &quot;defegde&quot;, &quot;hijhklij&quot;.
This is a partition so that each letter appears in at most one part.
A partition like &quot;ababcbacadefegde&quot;, &quot;hijhklij&quot; is incorrect, because it splits s into less parts.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> s = &quot;eccbbbbdec&quot;
<strong>Output:</strong> [10]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s.length &lt;= 500</code></li>
	<li><code>s</code> consists of lowercase English letters.</li>
</ul>"
---

```python
class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # create a map of char and last index
        # take a start elem
        # loop till start < end , end = max(cend, mp[char])
        # when start == end , add end - start + 1 to arr and then start = end + 1
        # do this till start < len(s)

        mp = {}

        for id, k in enumerate(s):
            mp[k] = id

        start = 0
        end = 0
        curr = 0
        res = []
        while(start <= end) :
            if curr == len(s):
                return res 
            end = max(end, mp[s[curr]])
            if curr == end:
                res.append(end - start + 1)
                start = end + 1
                curr = end
                end += 1
            curr += 1
        return res
            


        
```