---
title: "2580 Circular Sentence"
date: "2024-11-02T22:35:42+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Circular Sentence](https://leetcode.com/problems/circular-sentence) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  A **sentence** is a list of words that are separated by a** single** space with no leading or trailing spaces.
  
  	For example, &quot;Hello World&quot;, &quot;HELLO&quot;, &quot;hello world hello world&quot; are all sentences.
  
  Words consist of **only** uppercase and lowercase English letters. Uppercase and lowercase English letters are considered different.
  
  A sentence is **circular **if:
  
  	The last character of a word is equal to the first character of the next word.
  	The last character of the last word is equal to the first character of the first word.
  
  For example, &quot;leetcode exercises sound delightful&quot;, &quot;eetcode&quot;, &quot;leetcode eats soul&quot; are all circular sentences. However, &quot;Leetcode is cool&quot;, &quot;happy Leetcode&quot;, &quot;Leetcode&quot; and &quot;I like Leetcode&quot; are **not** circular sentences.
  
  Given a string sentence, return true* if it is circular*. Otherwise, return false.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** sentence = \"leetcode exercises sound delightful\"
  **Output:** true
  **Explanation:** The words in sentence are [\"leetcode\", \"exercises\", \"sound\", \"delightful\"].
  - leetcode's last character is equal to exercises's first character.
  - exercises's last character is equal to sound's first character.
  - sound's last character is equal to delightful's first character.
  - delightful's last character is equal to leetcode's first character.
  The sentence is circular.
  ```
  
  Example 2:
  
  ```
  
  **Input:** sentence = \"eetcode\"
  **Output:** true
  **Explanation:** The words in sentence are [\"eetcode\"].
  - eetcode's last character is equal to eetcode's first character.
  The sentence is circular.
  ```
  
  Example 3:
  
  ```
  
  **Input:** sentence = \"Leetcode is cool\"
  **Output:** false
  **Explanation:** The words in sentence are [\"Leetcode\", \"is\", \"cool\"].
  - Leetcode's last character is **not** equal to is's first character.
  The sentence is **not** circular.
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= sentence.length &lt;= 500
  	sentence consist of only lowercase and uppercase English letters and spaces.
  	The words in sentence are separated by a single space.
  	There are no leading or trailing spaces.
---

```python
class Solution:
    def isCircularSentence(self, s: str) -> bool:

        arr = s.split(' ')

        prev = arr[-1][-1]

        for k in arr:
            if k[0] != prev:
                return False
            prev = k[-1]
        return True


        
```