---
title: "Number Of Ways To Form A Target String Given A Dictionary"
date: "2024-12-29T10:39:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1731 ms (28.67%) | Memory: 296.7 MB (14.69%) - LeetSync"
---

```python
class Solution:
    def numWays(self, words: List[str], target: str) -> int:
        
        freq = {}
        l = len(words[0])
        i = 0
        while(i < l):
            s = {}
            for k in words:
                if k[i] in s:
                    s[k[i]] += 1
                else:
                    s[k[i]] = 1
            freq[i] = s
            i += 1
        print(freq)
        
        # time complexity 
        # n words m length each = n * m
        # T[i,j,k] = 1 + T[i,j-1,k-1] if a[j] == target[k] in any string
        
        dp = [[0 for _ in range(len(target) + 1)] for _ in range(l + 1)]
        print(dp)
        # Base case: If the target length is 0, there's exactly 1 way to match it
        for i in range(l + 1):
            dp[i][0] = 1
        for i in range(1, l + 1):  # Iterate over columns in `freq`
            for j in range(1, len(target) + 1):  # Iterate over characters in `target`
        # Carry over the previous value (skip the current column)
                dp[i][j] = dp[i - 1][j]
        
        # If the current character matches and exists in freq[i - 1]
                if target[j - 1] in freq[i - 1]:
                    dp[i][j] += dp[i - 1][j - 1] * freq[i - 1][target[j - 1]]
        
            dp[i][j] %= (10 ** 9 + 7)  # Keep values modulo 10^9 + 7
        return dp[l][len(target)]



        @cache
        def recurse(idx, target, occ):
            if len(target) == 0:
                return occ
            result = 0
            i = idx
            while(i < l):
                if target[0] in freq[i]:
                    result += recurse(i+1, target[1:], occ * freq[i][target[0]])
                i += 1
            return result
        return recurse(0,target, 1) % (10 ** 9 + 7)
```