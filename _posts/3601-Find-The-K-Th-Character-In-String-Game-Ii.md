---
title: "3601 Find The K Th Character In String Game Ii"
date: "2025-07-05T14:50:28+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Find the K-th Character in String Game II](https://leetcode.com/problems/find-the-k-th-character-in-string-game-ii) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  Alice and Bob are playing a game. Initially, Alice has a string word = &quot;a&quot;.
  
  You are given a **positive** integer k. You are also given an integer array operations, where operations[i] represents the **type** of the ith operation.
  
  Now Bob will ask Alice to perform **all** operations in sequence:
  
  	If operations[i] == 0, **append** a copy of word to itself.
  	If operations[i] == 1, generate a new string by **changing** each character in word to its **next** character in the English alphabet, and **append** it to the *original* word. For example, performing the operation on &quot;c&quot; generates &quot;cd&quot; and performing the operation on &quot;zb&quot; generates &quot;zbac&quot;.
  
  Return the value of the kth character in word after performing all the operations.
  
  **Note** that the character &#39;z&#39; can be changed to &#39;a&#39; in the second type of operation.
  
  &nbsp;
  
  Example 1:
  
  **Input:** k = 5, operations = [0,0,0]
  
  **Output:** &quot;a&quot;
  
  **Explanation:**
  
  Initially, word == &quot;a&quot;. Alice performs the three operations as follows:
  
  	Appends &quot;a&quot; to &quot;a&quot;, word becomes &quot;aa&quot;.
  	Appends &quot;aa&quot; to &quot;aa&quot;, word becomes &quot;aaaa&quot;.
  	Appends &quot;aaaa&quot; to &quot;aaaa&quot;, word becomes &quot;aaaaaaaa&quot;.
  
  Example 2:
  
  **Input:** k = 10, operations = [0,1,0,1]
  
  **Output:** &quot;b&quot;
  
  **Explanation:**
  
  Initially, word == &quot;a&quot;. Alice performs the four operations as follows:
  
  	Appends &quot;a&quot; to &quot;a&quot;, word becomes &quot;aa&quot;.
  	Appends &quot;bb&quot; to &quot;aa&quot;, word becomes &quot;aabb&quot;.
  	Appends &quot;aabb&quot; to &quot;aabb&quot;, word becomes &quot;aabbaabb&quot;.
  	Appends &quot;bbccbbcc&quot; to &quot;aabbaabb&quot;, word becomes &quot;aabbaabbbbccbbcc&quot;.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= k &lt;= 1014
  	1 &lt;= operations.length &lt;= 100
  	operations[i] is either 0 or 1.
  	The input is generated such that word has **at least** k characters after all operations.
---

```python
class Solution:
    def kthCharacter(self, k: int, operations: List[int]) -> str:
        ans = 0
        while k != 1:
            t = k.bit_length() - 1
            if (1 << t) == k:
                t -= 1
            k -= 1 << t
            if operations[t]:
                ans += 1
        return chr(ord("a") + (ans % 26))
```