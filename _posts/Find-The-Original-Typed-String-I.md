---
title: "Find The Original Typed String I"
date: "2025-07-01T09:33:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 43 ms (30.99%) | Memory: 17.9 MB (31.83%) - LeetSync"
---

```python
class Solution:
    def possibleStringCount(self, word: str) -> int:
        possibility = 1
        for i, k in enumerate(word):
            if i < len(word)-1 and word[i+1] == k:
                possibility += 1
        
        return possibility

        
```