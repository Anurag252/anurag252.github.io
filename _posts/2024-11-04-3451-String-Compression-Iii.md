---
title: "3451 String Compression Iii"
date: "2024-11-04T12:31:51+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [String Compression III](https://leetcode.com/problems/string-compression-iii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given a string word, compress it using the following algorithm:
  
  	Begin with an empty string comp. While word is **not** empty, use the following operation:
  
  		Remove a maximum length prefix of word made of a *single character* c repeating **at most** 9 times.
  		Append the length of the prefix followed by c to comp.
  
  Return the string comp.
  
   
  
  Example 1:
  
  **Input:** word = \"abcde\"
  
  **Output:** \"1a1b1c1d1e\"
  
  **Explanation:**
  
  Initially, comp = \"\". Apply the operation 5 times, choosing \"a\", \"b\", \"c\", \"d\", and \"e\" as the prefix in each operation.
  
  For each prefix, append \"1\" followed by the character to comp.
  
  Example 2:
  
  **Input:** word = \"aaaaaaaaaaaaaabb\"
  
  **Output:** \"9a5a2b\"
  
  **Explanation:**
  
  Initially, comp = \"\". Apply the operation 3 times, choosing \"aaaaaaaaa\", \"aaaaa\", and \"bb\" as the prefix in each operation.
  
  	For prefix \"aaaaaaaaa\", append \"9\" followed by \"a\" to comp.
  	For prefix \"aaaaa\", append \"5\" followed by \"a\" to comp.
  	For prefix \"bb\", append \"2\" followed by \"b\" to comp.
  
   
  
  **Constraints:**
  
  	1 <= word.length <= 2 * 105
  	word consists only of lowercase English letters.
---

```python
class Solution:
    def compressedString(self, word: str) -> str:
        
        curr = word[0]
        count = 0
        res = ""

        for idx, k in enumerate(word):
            if k == curr:
                count += 1

            if count == 9:
                res += (str(count) + curr)
                count = 0
                if idx + 1 < len(word):
                    curr = word[idx+1]
                    continue
            if k != curr:
                res += (str(count) + curr)
                count = 1
                curr = k
            #print(res)
        if count > 0:
            res += (str(count) + curr)
        return res
        

                

```