---
title: "Uncommon Words From Two Sentences"
date: "2024-09-17T06:39:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 37 ms (44.90%) | Memory: 16.5 MB (78.21%) - LeetSync"
---

```python
class Solution:
    def uncommonFromSentences(self, s1: str, s2: str) -> List[str]:
        dic = {}
        result =[]
        for k in s1.split():
            if k not in dic:
                dic[k] = 1
            else :
                dic[k] += 1

        for k in s2.split():
            if k not in dic:
                dic[k] = 1
            else :
                dic[k] += 1

        for k,v in dic.items():
            if v == 1:
                result.append(k)
        
        return result


```