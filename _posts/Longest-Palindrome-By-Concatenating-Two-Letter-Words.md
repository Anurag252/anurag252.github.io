---
title: "Longest Palindrome By Concatenating Two Letter Words"
date: "2025-05-25T22:25:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 58 ms (62.01%) | Memory: 35.7 MB (12.54%) - LeetSync"
---

```python
from collections import Counter

class Solution:
    def longestPalindrome(self, words: List[str]) -> int:
        counter = Counter(words)
        res = 0
        center = 0
        
        for word in list(counter.keys()):
            rev = word[::-1]
            if word != rev:
                pair = min(counter[word], counter[rev])
                res += pair * 4
                counter[word] -= pair
                counter[rev] -= pair
            else:
                pairs = counter[word] // 2
                res += pairs * 4
                counter[word] -= pairs * 2
                if counter[word] == 1:
                    center = 2  # One symmetric word can be in the center
                    
        return res + center

```