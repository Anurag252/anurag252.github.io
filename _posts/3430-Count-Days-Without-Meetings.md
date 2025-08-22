---
title: "3430 Count Days Without Meetings"
date: "2025-03-24T04:34:37+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Count Days Without Meetings](https://leetcode.com/problems/count-days-without-meetings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a positive integer days representing the total number of days an employee is available for work (starting from day 1). You are also given a 2D array meetings of size n where, meetings[i] = [start_i, end_i] represents the starting and ending days of meeting i (inclusive).
  
  Return the count of days when the employee is available for work but no meetings are scheduled.
  
  **Note: **The meetings may overlap.
  
  &nbsp;
  
  Example 1:
  
  **Input:** days = 10, meetings = [[5,7],[1,3],[9,10]]
  
  **Output:** 2
  
  **Explanation:**
  
  There is no meeting scheduled on the 4th and 8th days.
  
  Example 2:
  
  **Input:** days = 5, meetings = [[2,4],[1,3]]
  
  **Output:** 1
  
  **Explanation:**
  
  There is no meeting scheduled on the 5th day.
  
  Example 3:
  
  **Input:** days = 6, meetings = [[1,6]]
  
  **Output:** 0
  
  **Explanation:**
  
  Meetings are scheduled for all working days.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= days &lt;= 109
  	1 &lt;= meetings.length &lt;= 105
  	meetings[i].length == 2
  	1 &lt;= meetings[i][0] &lt;= meetings[i][1] &lt;= days
---

```python
class Solution:
    def countDays(self, days: int, meetings: List[List[int]]) -> int:

        meetings.sort(key=lambda x : (x[0], x[1]))
        print(meetings)

        count = -1
        start = 0
        end = 0
        for k in meetings:
            print(start, end, count)
            if end < k[0]:
                count += (end - start + 1)
                start = k[0]
                end = k[1]
            else:
                end = max(k[1], end)
        print(start, end, count)
        count += (end - start + 1)
        return days - count
        
```