---
title: "443 String Compression"
date: "2024-05-13T23:34:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [String Compression](https://leetcode.com/problems/string-compression) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given an array of characters chars, compress it using the following algorithm:
  
  Begin with an empty string s. For each group of **consecutive repeating characters** in chars:
  
  	If the group's length is 1, append the character to s.
  	Otherwise, append the character followed by the group's length.
  
  The compressed string s **should not be returned separately**, but instead, be stored **in the input character array chars**. Note that group lengths that are 10 or longer will be split into multiple characters in chars.
  
  After you are done **modifying the input array,** return *the new length of the array*.
  
  You must write an algorithm that uses only constant extra space.
  
   
  
  Example 1:
  
  ```
  
  **Input:** chars = [\"a\",\"a\",\"b\",\"b\",\"c\",\"c\",\"c\"]
  **Output:** Return 6, and the first 6 characters of the input array should be: [\"a\",\"2\",\"b\",\"2\",\"c\",\"3\"]
  **Explanation:** The groups are \"aa\", \"bb\", and \"ccc\". This compresses to \"a2b2c3\".
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** chars = [\"a\"]
  **Output:** Return 1, and the first character of the input array should be: [\"a\"]
  **Explanation:** The only group is \"a\", which remains uncompressed since it's a single character.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** chars = [\"a\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\",\"b\"]
  **Output:** Return 4, and the first 4 characters of the input array should be: [\"a\",\"b\",\"1\",\"2\"].
  **Explanation:** The groups are \"a\" and \"bbbbbbbbbbbb\". This compresses to \"ab12\".
  ```
  
   
  
  **Constraints:**
  
  	1 <= chars.length <= 2000
  	chars[i] is a lowercase English letter, uppercase English letter, digit, or symbol.
---

```python
class Solution:
    def compress(self, chars: List[str]) -> int:
        curr = 0
        fast = 0

        while(fast < len(chars)) :
            diff = 0
            while( fast < len(chars) and chars[fast] == chars[curr]):
                diff = diff + 1
                fast = fast + 1
            if curr + 1 <= fast and fast < len(chars):
                chars, curr = self.assign(fast, curr , chars, diff)
            if  fast < len(chars):
                curr = curr + 1
                chars[curr] = chars[fast]
        
        #curr = curr + 1
        if curr < len(chars):
            chars, curr = self.assign(fast, curr, chars, diff)
            #chars[curr] = str(fast - curr + 1)
        return curr + 1

    def assign(self, fast : int, curr : int, chars : List[str], diff : int) -> (List[str], int) :
        t = diff
        if t <= 1:
            return chars, curr

        while (len(str(t)) > 1) :
            curr = curr + 1
            chars[curr] = str(t)[0]
            t = str(t)[1:]
        
        curr = curr + 1
        chars[curr] = str(t)
        return chars, curr
```