---
title: "Circular Sentence"
date: "2024-11-02T22:35:42+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 16.6 MB (45.68%) - LeetSync"
---

```python
class Solution:
    def isCircularSentence(self, s: str) -> bool:

        arr = s.split(' ')

        prev = arr[-1][-1]

        for k in arr:
            if k[0] != prev:
                return False
            prev = k[-1]
        return True


        
```