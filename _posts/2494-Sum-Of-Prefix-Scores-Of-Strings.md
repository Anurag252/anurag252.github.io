---
title: "2494 Sum Of Prefix Scores Of Strings"
date: "2024-09-25T07:24:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Sum of Prefix Scores of Strings](https://leetcode.com/problems/sum-of-prefix-scores-of-strings) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  You are given an array words of size n consisting of **non-empty** strings.
  
  We define the **score** of a string word as the **number** of strings words[i] such that word is a **prefix** of words[i].
  
  	For example, if words = [&quot;a&quot;, &quot;ab&quot;, &quot;abc&quot;, &quot;cab&quot;], then the score of &quot;ab&quot; is 2, since &quot;ab&quot; is a prefix of both &quot;ab&quot; and &quot;abc&quot;.
  
  Return *an array *answer* of size *n* where *answer[i]* is the **sum** of scores of every **non-empty** prefix of *words[i].
  
  **Note** that a string is considered as a prefix of itself.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** words = [\"abc\",\"ab\",\"bc\",\"b\"]
  **Output:** [5,4,3,2]
  **Explanation:** The answer for each string is the following:
  - \"abc\" has 3 prefixes: \"a\", \"ab\", and \"abc\".
  - There are 2 strings with the prefix \"a\", 2 strings with the prefix \"ab\", and 1 string with the prefix \"abc\".
  The total is answer[0] = 2 + 2 + 1 = 5.
  - \"ab\" has 2 prefixes: \"a\" and \"ab\".
  - There are 2 strings with the prefix \"a\", and 2 strings with the prefix \"ab\".
  The total is answer[1] = 2 + 2 = 4.
  - \"bc\" has 2 prefixes: \"b\" and \"bc\".
  - There are 2 strings with the prefix \"b\", and 1 string with the prefix \"bc\".
  The total is answer[2] = 2 + 1 = 3.
  - \"b\" has 1 prefix: \"b\".
  - There are 2 strings with the prefix \"b\".
  The total is answer[3] = 2.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** words = [\"abcd\"]
  **Output:** [4]
  **Explanation:**
  \"abcd\" has 4 prefixes: \"a\", \"ab\", \"abc\", and \"abcd\".
  Each prefix has a score of one, so the total is answer[0] = 1 + 1 + 1 + 1 = 4.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= words.length &lt;= 1000
  	1 &lt;= words[i].length &lt;= 1000
  	words[i] consists of lowercase English letters.
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