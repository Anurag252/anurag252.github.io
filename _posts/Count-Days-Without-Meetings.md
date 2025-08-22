---
title: "Count Days Without Meetings"
date: "2025-03-24T04:34:37+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 505 ms (5.04%) | Memory: 53 MB (19.65%) - LeetSync"
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