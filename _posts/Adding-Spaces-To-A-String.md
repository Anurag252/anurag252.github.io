---
title: "Adding Spaces To A String"
date: "2024-12-03T07:23:49+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 127 ms (33.24%) | Memory: 60 MB (5.30%) - LeetSync"
---

```python
class Solution:
    def addSpaces(self, s: str, spaces: List[int]) -> str:
        res = [""] * (len(s) + len(spaces))
        added_spaces = 0
        mp = set(spaces)

        
        for idx, k in enumerate(s):
            if idx in mp:
                res[idx + added_spaces] = " "
                added_spaces += 1
            res[idx + added_spaces] = k
        return "".join(res)
        
```