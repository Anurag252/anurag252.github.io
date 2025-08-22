---
title: "Count Prefix And Suffix Pairs I"
date: "2025-01-08T07:55:47+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 21 ms (8.17%) | Memory: 18.1 MB (6.47%) - LeetSync"
---

```python
class Solution:
    def countPrefixSuffixPairs(self, words: List[str]) -> int:

        res = 0

        def starts_with(s1, s2):
            if len(s1) > len(s2):
                return False
            for a1, a2 in zip(s1, s2):
                if a1 != a2:
                    return False
            return True

        def ends_with(s1, s2):
            if len(s1) > len(s2):
                return False
            i = len(s1) - 1
            j = len(s2) - 1
            while(i >= 0 and j >= 0):
                if s1[i] != s2[j]:
                    return False
                i -= 1
                j -= 1
            return True

        for idx1, k1 in enumerate(words):
            for idx2, k2 in enumerate(words[idx1+1:]):
                if starts_with(k1,k2) and ends_with(k1, k2):
                    res += 1
        return res


        
```