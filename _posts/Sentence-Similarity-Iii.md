---
title: "Sentence Similarity Iii"
date: "2024-10-06T09:43:15+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 38 ms (36.65%) | Memory: 16.6 MB (13.04%) - LeetSync"
---

```python
class Solution:
    def areSentencesSimilar(self, sentence1: str, sentence2: str) -> bool:
        s1 = sentence1.split(' ')
        s2 = sentence2.split(' ')
        temp1 = 0
        temp2 = 0
        start = 0
        while(temp1 < len(s1) and temp2 < len(s2) and s1[temp1] == s2[temp2]):
            start += 1
            temp1 += 1
            temp2 += 1
        temp3 = len(s1)-1
        temp4 = len(s2)-1
        end = 0
        while(temp3 >= temp1 and temp4 >= temp2 and s1[temp3] == s2[temp4]):
            end += 1
            temp3 -= 1
            temp4 -= 1
        if len(s1) > len(s2):
            return start + end == len(s2)
        else:
            return start + end == len(s1)
        
        
            

        
```