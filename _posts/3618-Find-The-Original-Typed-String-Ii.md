---
title: "3618 Find The Original Typed String Ii"
date: "2025-07-02T07:55:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Find the Original Typed String II](https://leetcode.com/problems/find-the-original-typed-string-ii) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and **may** press a key for too long, resulting in a character being typed **multiple** times.
  
  You are given a string word, which represents the **final** output displayed on Alice&#39;s screen. You are also given a **positive** integer k.
  
  Return the total number of *possible* original strings that Alice *might* have intended to type, if she was trying to type a string of size **at least** k.
  
  Since the answer may be very large, return it **modulo** 109 + 7.
  
  &nbsp;
  
  Example 1:
  
  **Input:** word = &quot;aabbccdd&quot;, k = 7
  
  **Output:** 5
  
  **Explanation:**
  
  The possible strings are: &quot;aabbccdd&quot;, &quot;aabbccd&quot;, &quot;aabbcdd&quot;, &quot;aabccdd&quot;, and &quot;abbccdd&quot;.
  
  Example 2:
  
  **Input:** word = &quot;aabbccdd&quot;, k = 8
  
  **Output:** 1
  
  **Explanation:**
  
  The only possible string is &quot;aabbccdd&quot;.
  
  Example 3:
  
  **Input:** word = &quot;aaabbb&quot;, k = 3
  
  **Output:** 8
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= word.length &lt;= 5 * 105
  	word consists only of lowercase English letters.
  	1 &lt;= k &lt;= 2000
---

```python
class Solution:
    def possibleStringCount(self, word: str, k: int) -> int:
        mod = 10**9 + 7
        n, cnt = len(word), 1
        freq = list()

        for i in range(1, n):
            if word[i] == word[i - 1]:
                cnt += 1
            else:
                freq.append(cnt)
                cnt = 1
        freq.append(cnt)

        ans = 1
        for o in freq:
            ans = ans * o % mod

        if len(freq) >= k:
            return ans

        f, g = [1] + [0] * (k - 1), [1] * k
        for i in range(len(freq)):
            f_new = [0] * k
            for j in range(1, k):
                f_new[j] = g[j - 1]
                if j - freq[i] - 1 >= 0:
                    f_new[j] = (f_new[j] - g[j - freq[i] - 1]) % mod
            g_new = [f_new[0]] + [0] * (k - 1)
            for j in range(1, k):
                g_new[j] = (g_new[j - 1] + f_new[j]) % mod
            f, g = f_new, g_new
        return (ans - g[k - 1]) % mod
```