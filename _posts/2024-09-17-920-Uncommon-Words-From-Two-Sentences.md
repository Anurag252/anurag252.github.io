---
title: "920 Uncommon Words From Two Sentences"
date: "2024-09-17T06:39:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Uncommon Words from Two Sentences](https://leetcode.com/problems/uncommon-words-from-two-sentences) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  A **sentence** is a string of single-space separated words where each word consists only of lowercase letters.
  
  A word is **uncommon** if it appears exactly once in one of the sentences, and **does not appear** in the other sentence.
  
  Given two **sentences** s1 and s2, return *a list of all the **uncommon words***. You may return the answer in **any order**.
  
   
  
  Example 1:
  
  **Input:** s1 = \"this apple is sweet\", s2 = \"this apple is sour\"
  
  **Output:** [\"sweet\",\"sour\"]
  
  **Explanation:**
  
  The word \"sweet\" appears only in s1, while the word \"sour\" appears only in s2.
  
  Example 2:
  
  **Input:** s1 = \"apple apple\", s2 = \"banana\"
  
  **Output:** [\"banana\"]
  
   
  
  **Constraints:**
  
  	1 <= s1.length, s2.length <= 200
  	s1 and s2 consist of lowercase English letters and spaces.
  	s1 and s2 do not have leading or trailing spaces.
  	All the words in s1 and s2 are separated by a single space.
---

```python
class Solution:
    def uncommonFromSentences(self, s1: str, s2: str) -> List[str]:
        dic = {}
        result =[]
        for k in s1.split():
            if k not in dic:
                dic[k] = 1
            else :
                dic[k] += 1

        for k in s2.split():
            if k not in dic:
                dic[k] = 1
            else :
                dic[k] += 1

        for k,v in dic.items():
            if v == 1:
                result.append(k)
        
        return result


```