---
title: "2163 Kth Distinct String In An Array"
date: "2024-08-05T05:40:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Kth Distinct String in an Array](https://leetcode.com/problems/kth-distinct-string-in-an-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  A **distinct string** is a string that is present only **once** in an array.
  
  Given an array of strings arr, and an integer k, return *the *kth* **distinct string** present in *arr. If there are **fewer** than k distinct strings, return *an **empty string ***&quot;&quot;.
  
  Note that the strings are considered in the **order in which they appear** in the array.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** arr = [\"d\",\"b\",\"c\",\"b\",\"c\",\"a\"], k = 2
  **Output:** \"a\"
  **Explanation:**
  The only distinct strings in arr are \"d\" and \"a\".
  \"d\" appears 1st, so it is the 1st distinct string.
  \"a\" appears 2nd, so it is the 2nd distinct string.
  Since k == 2, \"a\" is returned. 
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** arr = [\"aaa\",\"aa\",\"a\"], k = 1
  **Output:** \"aaa\"
  **Explanation:**
  All strings in arr are distinct, so the 1st string \"aaa\" is returned.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** arr = [\"a\",\"b\",\"a\"], k = 3
  **Output:** \"\"
  **Explanation:**
  The only distinct string is \"b\". Since there are fewer than 3 distinct strings, we return an empty string \"\".
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= k &lt;= arr.length &lt;= 1000
  	1 &lt;= arr[i].length &lt;= 5
  	arr[i] consists of lowercase English letters.
---

```python
class Solution:
    def kthDistinct(self, arr: List[str], n: int) -> str:
        mp = {}
        nmp = {}
        i = 0
        for k in arr:
            if k not in mp and k not in nmp:
                mp[k]=i
            elif k in mp:
                del mp[k]
                nmp[k]=1
            i += 1
        a = list(mp.items())
        a.sort(reverse=False, key=lambda x : x[1])
        return "" if n - 1 >= len(a) else a[n-1][0]
        
```