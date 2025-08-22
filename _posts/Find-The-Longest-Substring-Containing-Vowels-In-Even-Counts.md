---
title: "Find The Longest Substring Containing Vowels In Even Counts"
date: "2024-09-15T18:29:25+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 297 ms (66.57%) | Memory: 22.1 MB (79.11%) - LeetSync"
---

```python
class Solution:
    def findTheLongestSubstring(self, s: str) -> int:
        prefixXOR = 0
        characterMap = [0] * 26
        characterMap[ord("a") - ord("a")] = 1
        characterMap[ord("e") - ord("a")] = 2
        characterMap[ord("i") - ord("a")] = 4
        characterMap[ord("o") - ord("a")] = 8
        characterMap[ord("u") - ord("a")] = 16
        mp = [-1] * 32
        longestSubstring = 0
        for i in range(len(s)):
            prefixXOR ^= characterMap[ord(s[i]) - ord("a")]
            if mp[prefixXOR] == -1 and prefixXOR != 0:
                mp[prefixXOR] = i
            longestSubstring = max(longestSubstring, i - mp[prefixXOR])
        return longestSubstring
    


                    

```