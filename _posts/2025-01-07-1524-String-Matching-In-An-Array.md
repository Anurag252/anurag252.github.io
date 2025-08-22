---
title: "1524 String Matching In An Array"
date: "2025-01-07T07:49:20+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [String Matching in an Array](https://leetcode.com/problems/string-matching-in-an-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array of string words, return *all strings in *words* that is a **substring** of another word*. You can return the answer in **any order**.

A **substring** is a contiguous sequence of characters within a string

 

Example 1:

```

**Input:** words = ["mass","as","hero","superhero"]
**Output:** ["as","hero"]
**Explanation:** "as" is substring of "mass" and "hero" is substring of "superhero".
["hero","as"] is also a valid answer.

```

Example 2:

```

**Input:** words = ["leetcode","et","code"]
**Output:** ["et","code"]
**Explanation:** "et", "code" are substring of "leetcode".

```

Example 3:

```

**Input:** words = ["blue","green","bu"]
**Output:** []
**Explanation:** No string of words is substring of another string.

```

 

**Constraints:**

	1 <= words.length <= 100
	1 <= words[i].length <= 30
	words[i] contains only lowercase English letters.
	All the strings of words are **unique**.

```python
class Trie:
    def __init__(self):
        self.dict = {}

    def traverse_recurse(self, root, s):
        if len(s) == 0:
            return
        if s[0] in root:
                self.traverse_recurse(root[s[0]], s[1:])
        else:
            root[s[0]] = {}
            self.traverse_recurse(root[s[0]], s[1:])

    def traverse(self, root, s) -> bool:
        if len(s) == 0:
            return True
        if s[0] in root:
            return self.traverse(root[s[0]], s[1:])
        else:
            return False

    def insert(self, s):
        root = self.dict
        self.traverse_recurse(root, s)

    def contains(self, s) -> bool:
        root = self.dict
        return self.traverse(root, s)





class Solution:
    def stringMatching(self, words: List[str]) -> List[str]:

        t = Trie()

        words.sort(key = lambda x: -len(x))
        res = []
        for k in words:
            if t.contains(k):
                res.append(k)
            for i in range(0, len(k)):
                t.insert(k[i:])
        return res
        
```