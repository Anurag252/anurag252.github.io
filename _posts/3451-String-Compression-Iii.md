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
  
  &nbsp;
  
  Example 1:
  
  **Input:** word = &quot;abcde&quot;
  
  **Output:** &quot;1a1b1c1d1e&quot;
  
  **Explanation:**
  
  Initially, comp = &quot;&quot;. Apply the operation 5 times, choosing &quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot;, and &quot;e&quot; as the prefix in each operation.
  
  For each prefix, append &quot;1&quot; followed by the character to comp.
  
  Example 2:
  
  **Input:** word = &quot;aaaaaaaaaaaaaabb&quot;
  
  **Output:** &quot;9a5a2b&quot;
  
  **Explanation:**
  
  Initially, comp = &quot;&quot;. Apply the operation 3 times, choosing &quot;aaaaaaaaa&quot;, &quot;aaaaa&quot;, and &quot;bb&quot; as the prefix in each operation.
  
  	For prefix &quot;aaaaaaaaa&quot;, append &quot;9&quot; followed by &quot;a&quot; to comp.
  	For prefix &quot;aaaaa&quot;, append &quot;5&quot; followed by &quot;a&quot; to comp.
  	For prefix &quot;bb&quot;, append &quot;2&quot; followed by &quot;b&quot; to comp.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= word.length &lt;= 2 * 105
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