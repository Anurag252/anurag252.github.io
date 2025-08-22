---
title: "539 Minimum Time Difference"
date: "2024-09-16T17:10:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Minimum Time Difference](https://leetcode.com/problems/minimum-time-difference) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)Given a list of 24-hour clock time points in **&quot;HH:MM&quot;** format, return *the minimum **minutes** difference between any two time-points in the list*.
  
  &nbsp;
  
  Example 1:
  
  ```
  **Input:** timePoints = [\"23:59\",\"00:00\"]
  **Output:** 1
  
  ```
  
  Example 2:
  
  ```
  **Input:** timePoints = [\"00:00\",\"23:59\",\"00:00\"]
  **Output:** 0
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	2 &lt;= timePoints.length &lt;= 2 * 104
  	timePoints[i] is in the format **&quot;HH:MM&quot;**.
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