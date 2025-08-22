---
title: "3630 Total Characters In String After Transformations Ii"
date: "2025-05-14T07:19:33+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Total Characters in String After Transformations II](https://leetcode.com/problems/total-characters-in-string-after-transformations-ii) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  You are given a string s consisting of lowercase English letters, an integer t representing the number of **transformations** to perform, and an array nums of size 26. In one **transformation**, every character in s is replaced according to the following rules:
  
  	Replace s[i] with the **next** nums[s[i] - &#39;a&#39;] consecutive characters in the alphabet. For example, if s[i] = &#39;a&#39; and nums[0] = 3, the character &#39;a&#39; transforms into the next 3 consecutive characters ahead of it, which results in &quot;bcd&quot;.
  	The transformation **wraps** around the alphabet if it exceeds &#39;z&#39;. For example, if s[i] = &#39;y&#39; and nums[24] = 3, the character &#39;y&#39; transforms into the next 3 consecutive characters ahead of it, which results in &quot;zab&quot;.
  
  Return the length of the resulting string after **exactly** t transformations.
  
  Since the answer may be very large, return it **modulo** 109 + 7.
  
  &nbsp;
  
  Example 1:
  
  **Input:** s = &quot;abcyy&quot;, t = 2, nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2]
  
  **Output:** 7
  
  **Explanation:**
  
  **First Transformation (t = 1):**
  
  		&#39;a&#39; becomes &#39;b&#39; as nums[0] == 1
  		&#39;b&#39; becomes &#39;c&#39; as nums[1] == 1
  		&#39;c&#39; becomes &#39;d&#39; as nums[2] == 1
  		&#39;y&#39; becomes &#39;z&#39; as nums[24] == 1
  		&#39;y&#39; becomes &#39;z&#39; as nums[24] == 1
  		String after the first transformation: &quot;bcdzz&quot;
  
  **Second Transformation (t = 2):**
  
  		&#39;b&#39; becomes &#39;c&#39; as nums[1] == 1
  		&#39;c&#39; becomes &#39;d&#39; as nums[2] == 1
  		&#39;d&#39; becomes &#39;e&#39; as nums[3] == 1
  		&#39;z&#39; becomes &#39;ab&#39; as nums[25] == 2
  		&#39;z&#39; becomes &#39;ab&#39; as nums[25] == 2
  		String after the second transformation: &quot;cdeabab&quot;
  
  **Final Length of the string:** The string is &quot;cdeabab&quot;, which has 7 characters.
  
  Example 2:
  
  **Input:** s = &quot;azbk&quot;, t = 1, nums = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
  
  **Output:** 8
  
  **Explanation:**
  
  **First Transformation (t = 1):**
  
  		&#39;a&#39; becomes &#39;bc&#39; as nums[0] == 2
  		&#39;z&#39; becomes &#39;ab&#39; as nums[25] == 2
  		&#39;b&#39; becomes &#39;cd&#39; as nums[1] == 2
  		&#39;k&#39; becomes &#39;lm&#39; as nums[10] == 2
  		String after the first transformation: &quot;bcabcdlm&quot;
  
  **Final Length of the string:** The string is &quot;bcabcdlm&quot;, which has 8 characters.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 105
  	s consists only of lowercase English letters.
  	1 &lt;= t &lt;= 109
  	nums.length == 26
  	1 &lt;= nums[i] &lt;= 25
---

```python
MOD = 10**9 + 7
L = 26


class Mat:
    def __init__(self, copy_from: "Mat" = None) -> None:
        self.a: List[List[int]] = [[0] * L for _ in range(L)]
        if copy_from:
            for i in range(L):
                for j in range(L):
                    self.a[i][j] = copy_from.a[i][j]

    def __mul__(self, other: "Mat") -> "Mat":
        result = Mat()
        for i in range(L):
            for j in range(L):
                for k in range(L):
                    result.a[i][j] = (
                        result.a[i][j] + self.a[i][k] * other.a[k][j]
                    ) % MOD
        return result


# identity matrix
def I() -> Mat:
    m = Mat()
    for i in range(L):
        m.a[i][i] = 1
    return m


# matrix exponentiation by squaring
def quickmul(x: Mat, y: int) -> Mat:
    ans = I()
    cur = x
    while y:
        if y & 1:
            ans = ans * cur
        cur = cur * cur
        y >>= 1
    return ans


class Solution:
    def lengthAfterTransformations(
        self, s: str, t: int, nums: List[int]
    ) -> int:
        T = Mat()
        for i in range(26):
            for j in range(1, nums[i] + 1):
                T.a[(i + j) % 26][i] = 1

        res = quickmul(T, t)

        f = [0] * 26
        for ch in s:
            f[ord(ch) - ord("a")] += 1

        ans = 0
        for i in range(26):
            for j in range(26):
                ans = (ans + res.a[i][j] * f[j]) % MOD

        return ans
```