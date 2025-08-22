---
title: "./539 Minimum Time Difference"
date: "2024-09-16T17:10:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-time-difference">Minimum Time Difference</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr>Given a list of 24-hour clock time points in <strong>&quot;HH:MM&quot;</strong> format, return <em>the minimum <b>minutes</b> difference between any two time-points in the list</em>.
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre><strong>Input:</strong> timePoints = ["23:59","00:00"]
<strong>Output:</strong> 1
</pre><p><strong class="example">Example 2:</strong></p>
<pre><strong>Input:</strong> timePoints = ["00:00","23:59","00:00"]
<strong>Output:</strong> 0
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= timePoints.length &lt;= 2 * 10<sup>4</sup></code></li>
	<li><code>timePoints[i]</code> is in the format <strong>&quot;HH:MM&quot;</strong>.</li>
</ul>"
---

```python
class Solution:
    def findMinDifference(self, timePoints: List[str]) -> int:
        result = []
        for k in timePoints:
            hour = k.split(":")[0]
            minute = k.split(":")[1]
            total = int(hour) * 60 + int(minute)
            result.append(total)
        
        result.sort()
        diff = 1440
        start = 1
        end = len(result)
        while(start < end):
            diff = min(diff, result[start] - result[start-1])
            start += 1
        
        diff = min(diff, result[0] + 1440 - result[-1])
        return diff

        
```