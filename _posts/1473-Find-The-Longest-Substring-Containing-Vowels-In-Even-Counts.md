---
title: "1473 Find The Longest Substring Containing Vowels In Even Counts"
date: "2024-09-15T18:29:25+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Find the Longest Substring Containing Vowels in Even Counts](https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given the string s, return the size of the longest substring containing each vowel an even number of times. That is, &#39;a&#39;, &#39;e&#39;, &#39;i&#39;, &#39;o&#39;, and &#39;u&#39; must appear an even number of times.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** s = \"eleetminicoworoep\"
  **Output:** 13
  **Explanation: **The longest substring is \"leetminicowor\" which contains two each of the vowels: **e**, **i** and **o** and zero of the vowels: **a** and **u**.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"leetcodeisgreat\"
  **Output:** 5
  **Explanation:** The longest substring is \"leetc\" which contains two e's.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** s = \"bcbcbc\"
  **Output:** 6
  **Explanation:** In this case, the given string \"bcbcbc\" is the longest because all vowels: **a**, **e**, **i**, **o** and **u** appear zero times.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 5 x 10^5
  	s&nbsp;contains only lowercase English letters.
---

```python
class Solution:
    def findTheLongestSubstring(self, s: str) -> int:
        prefixXOR = 0
        characterMap = [0] * 26
        characterMap[ord("a") - ord("a")] = 1
        characterMap[ord("e") - ord("a")] = 2
        characterMap[ord("i") - ord("a")] = 4
        characterMap[ord("o") - ord("a")] = 8
        characterMap[ord("u") - ord("a")] = 16
        mp = [-1] * 32
        longestSubstring = 0
        for i in range(len(s)):
            prefixXOR ^= characterMap[ord(s[i]) - ord("a")]
            if mp[prefixXOR] == -1 and prefixXOR != 0:
                mp[prefixXOR] = i
            longestSubstring = max(longestSubstring, i - mp[prefixXOR])
        return longestSubstring
    


                    

```