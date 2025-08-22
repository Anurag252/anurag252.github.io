---
title: "Minimum Number Of Changes To Make Binary String Beautiful"
date: "2024-11-05T08:04:35+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 27 ms (29.73%) | Memory: 16.8 MB (89.02%) - LeetSync"
---

```python
class Solution:
    def minChanges(self, s: str) -> int:

        count = 0

        id = 0
        while(id < len(s)):
            if s[id] != s[id+1]:
                count += 1
            id += 2
        return count


```