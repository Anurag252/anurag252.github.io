---
title: "Divide A String Into Groups Of Size K"
date: "2025-06-22T08:21:49+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.6 MB (88.35%) - LeetSync"
---

```python
class Solution:
    def divideString(self, s: str, k: int, fill: str) -> List[str]:
        l = 0
        res = []
        while(l + k < len(s)):
            t = s[l:l+k]
            res.append(t)
            l += k
        res.append(s[l:] + str(fill * (l + k - len(s))))
        return res




        
```