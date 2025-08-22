---
title: "2059 Unique Length 3 Palindromic Subsequences"
date: "2025-01-04T09:50:58+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Unique Length-3 Palindromic Subsequences](https://leetcode.com/problems/unique-length-3-palindromic-subsequences) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given a string s, return *the number of **unique palindromes of length three** that are a **subsequence** of *s.
  
  Note that even if there are multiple ways to obtain the same subsequence, it is still only counted **once**.
  
  A **palindrome** is a string that reads the same forwards and backwards.
  
  A **subsequence** of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
  
  	For example, \"ace\" is a subsequence of \"abcde\".
  
   
  
  Example 1:
  
  ```
  
  **Input:** s = \"aabca\"
  **Output:** 3
  **Explanation:** The 3 palindromic subsequences of length 3 are:
  - \"aba\" (subsequence of \"aabca\")
  - \"aaa\" (subsequence of \"aabca\")
  - \"aca\" (subsequence of \"aabca\")
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"adc\"
  **Output:** 0
  **Explanation:** There are no palindromic subsequences of length 3 in \"adc\".
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** s = \"bbcbaba\"
  **Output:** 4
  **Explanation:** The 4 palindromic subsequences of length 3 are:
  - \"bbb\" (subsequence of \"bbcbaba\")
  - \"bcb\" (subsequence of \"bbcbaba\")
  - \"bab\" (subsequence of \"bbcbaba\")
  - \"aba\" (subsequence of \"bbcbaba\")
  
  ```
  
   
  
  **Constraints:**
  
  	3 <= s.length <= 105
  	s consists of only lowercase English letters.
---

```python
class Solution:
    def countPalindromicSubsequence(self, s: str) -> int:
        arr = [(-1,-1)] * 26
        #suff.reverse()

        for idx, k in enumerate(s):
            if arr[ord(k) - ord('a')] == (-1,-1):
                arr[ord(k) - ord('a')] = (idx, -1)
            else:
                arr[ord(k) - ord('a')] = (arr[ord(k) - ord('a')][0], idx)
        # there may a problem of duplicates - will not  be
        res = 0
        for (k0, k1) in arr:
            if k0 >= 0 and k1 >= 0 and k1 > k0 + 1:
                st = set()
                for m in s[k0+1:k1]:
                    st.add(m)
                res += (len(st))
        return res



        
```