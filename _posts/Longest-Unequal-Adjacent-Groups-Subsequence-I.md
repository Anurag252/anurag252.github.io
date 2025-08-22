---
title: "Longest Unequal Adjacent Groups Subsequence I"
date: "2025-05-15T23:46:38+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 7 ms (11.53%) | Memory: 17.7 MB (91.36%) - LeetSync"
---

```python
class Solution:
    def getLongestSubsequence(self, words: List[str], groups: List[int]) -> List[str]:
        """
        T[n] = max(T[n-i] + 1) if grp[n-i] != grp[n]

        """
        T = [1] * len(words)
        res = []
        if len(words) == 1:
            return [words[0]]

        for i, k1 in enumerate(words):
            for j , k2 in enumerate(words[:i]):
                if groups[i] != groups[j]:
                    if T[j] + 1 > T[i]:
                        T[i] = max(T[i], T[j] + 1)
        prev = 1
        res.append(words[0])
        for i, k in enumerate(T[1:]):
            if k == prev + 1:
                prev = k
                res.append(words[i+1])
        return res



        


        
```