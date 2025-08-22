---
title: "Sum Of Prefix Scores Of Strings"
date: "2024-09-25T07:24:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 5778 ms (5.18%) | Memory: 598.3 MB (10.35%) - LeetSync"
---

```python
class TrieNode:
    def __init__(self):
        self.umc = {}
        self.is_end = False

class Trie:
    def __init__(self):
        self.root = TrieNode()

    # Inserting values into the trie
    def insert(self, a):
        cur = self.root
        tmp = str(a)
        for ch in tmp:
            if ch not in cur.umc:
                cur.umc[ch] = TrieNode()
            cur = cur.umc[ch]
        cur.is_end = True

    # Matching the prefixes of a string/number
    def prefix_match(self, b):
        cur = self.root
        tmp = str(b)  # Converting to string for easy traversal
        length = 0
        for ch in tmp:
            # If no match is found, break
            if ch not in cur.umc:
                break
            cur = cur.umc[ch]
            length += 1
        return length

class Solution:
    def sumPrefixScores(self, words: List[str]) -> List[int]:
        t = {}
        for k in words:
            i = 1
            while(i <= len(k)):
                if k[:i] in t:
                    t[k[:i]] += 1
                else :
                    t[k[:i]] = 1
                i += 1

        result = [0] * len(words)
        for idx, k in enumerate(words):
            i = 1
            
            while(i <= len(k)):
                if (k[:i]) in t:
                    result[idx] += t[k[:i]]
                i += 1
        return result


        
        
```