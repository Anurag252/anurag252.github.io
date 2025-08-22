---
title: "3617 Find The Original Typed String I"
date: "2025-07-01T09:33:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Find the Original Typed String I](https://leetcode.com/problems/find-the-original-typed-string-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and **may** press a key for too long, resulting in a character being typed **multiple** times.

Although Alice tried to focus on her typing, she is aware that she may still have done this **at most** *once*.

You are given a string word, which represents the **final** output displayed on Alice's screen.

Return the total number of *possible* original strings that Alice *might* have intended to type.

 

Example 1:

**Input:** word = "abbcccc"

**Output:** 5

**Explanation:**

The possible strings are: "abbcccc", "abbccc", "abbcc", "abbc", and "abcccc".

Example 2:

**Input:** word = "abcd"

**Output:** 1

**Explanation:**

The only possible string is "abcd".

Example 3:

**Input:** word = "aaaa"

**Output:** 4

 

**Constraints:**

	1 <= word.length <= 100
	word consists only of lowercase English letters.

```python
class Solution:
    def possibleStringCount(self, word: str) -> int:
        possibility = 1
        for i, k in enumerate(word):
            if i < len(word)-1 and word[i+1] == k:
                possibility += 1
        
        return possibility

        
```