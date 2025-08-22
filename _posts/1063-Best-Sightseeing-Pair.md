---
title: "./1063 Best Sightseeing Pair"
date: "2024-12-27T08:55:21+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/best-sightseeing-pair">Best Sightseeing Pair</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an integer array <code>values</code> where values[i] represents the value of the <code>i<sup>th</sup></code> sightseeing spot. Two sightseeing spots <code>i</code> and <code>j</code> have a <strong>distance</strong> <code>j - i</code> between them.</p>

<p>The score of a pair (<code>i &lt; j</code>) of sightseeing spots is <code>values[i] + values[j] + i - j</code>: the sum of the values of the sightseeing spots, minus the distance between them.</p>

<p>Return <em>the maximum score of a pair of sightseeing spots</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> values = [8,1,5,2,6]
<strong>Output:</strong> 11
<strong>Explanation:</strong> i = 0, j = 2, values[i] + values[j] + i - j = 8 + 5 + 0 - 2 = 11
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> values = [1,2]
<strong>Output:</strong> 2
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= values.length &lt;= 5 * 10<sup>4</sup></code></li>
	<li><code>1 &lt;= values[i] &lt;= 1000</code></li>
</ul>"
---

```python
class Solution:
    def maxScoreSightseeingPair(self, values: List[int]) -> int:
        # maximize the value and minimize the gap
        # closest one and has largest value preferably/not necessarily larger than itself
        st = []

        addn = []

        subs = []

        pref_sum = [0] * len(values) 

        temp = -10 ** 8
        for idx, k in enumerate(values):
            addn.append(k + idx)

        for idx, k in enumerate(values):
            subs.append(k - idx)
        #print(subs)

        for idx, k in enumerate(subs[::-1]):
            if k > temp:
                temp = k
                #print(len(subs) - 1 - idx)
            pref_sum[len(subs) - 1 - idx] = temp
        #print(pref_sum, subs, addn)

        s = 0
        for idx, k in enumerate(addn):
            if idx + 1 < len(pref_sum) and k + pref_sum[idx+1] > s:
                s = k + pref_sum[idx+1]
        return s

        

        """
        [(0,8), (1,1), (2,5), (3,2), (4,6)]
         [8, 2, 7, 5, 10]
        =[8, 0, 3, -1, 2]

        [8, ]
        """



```