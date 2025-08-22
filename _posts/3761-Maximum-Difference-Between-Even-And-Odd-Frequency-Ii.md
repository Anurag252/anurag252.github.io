---
title: "3761 Maximum Difference Between Even And Odd Frequency Ii"
date: "2025-06-11T09:59:59+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Difference Between Even and Odd Frequency II](https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-ii) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  You are given a string s and an integer k. Your task is to find the **maximum** difference between the frequency of **two** characters, freq[a] - freq[b], in a substring subs of s, such that:
  
  	subs has a size of **at least** k.
  	Character a has an *odd frequency* in subs.
  	Character b has an *even frequency* in subs.
  
  Return the **maximum** difference.
  
  **Note** that subs can contain more than 2 **distinct** characters.
  
  &nbsp;
  
  Example 1:
  
  **Input:** s = &quot;12233&quot;, k = 4
  
  **Output:** -1
  
  **Explanation:**
  
  For the substring &quot;12233&quot;, the frequency of &#39;1&#39; is 1 and the frequency of &#39;3&#39; is 2. The difference is 1 - 2 = -1.
  
  Example 2:
  
  **Input:** s = &quot;1122211&quot;, k = 3
  
  **Output:** 1
  
  **Explanation:**
  
  For the substring &quot;11222&quot;, the frequency of &#39;2&#39; is 3 and the frequency of &#39;1&#39; is 2. The difference is 3 - 2 = 1.
  
  Example 3:
  
  **Input:** s = &quot;110&quot;, k = 3
  
  **Output:** -1
  
  &nbsp;
  
  **Constraints:**
  
  	3 &lt;= s.length &lt;= 3 * 104
  	s consists only of digits &#39;0&#39; to &#39;4&#39;.
  	The input is generated that at least one substring has a character with an even frequency and a character with an odd frequency.
  	1 &lt;= k &lt;= s.length
---

```python
class Solution:
    def maxDifference(self, s: str, k: int) -> int:
        def getStatus(cnt_a: int, cnt_b: int) -> int:
            return ((cnt_a & 1) << 1) | (cnt_b & 1)

        n = len(s)
        ans = float("-inf")
        for a in ["0", "1", "2", "3", "4"]:
            for b in ["0", "1", "2", "3", "4"]:
                if a == b:
                    continue

                best = [float("inf")] * 4
                cnt_a = cnt_b = 0
                prev_a = prev_b = 0
                left = -1
                for right in range(n):
                    cnt_a += s[right] == a
                    cnt_b += s[right] == b
                    while right - left >= k and cnt_b - prev_b >= 2:
                        left_status = getStatus(prev_a, prev_b)
                        best[left_status] = min(
                            best[left_status], prev_a - prev_b
                        )
                        left += 1
                        prev_a += s[left] == a
                        prev_b += s[left] == b

                    right_status = getStatus(cnt_a, cnt_b)
                    if best[right_status ^ 0b10] != float("inf"):
                        ans = max(
                            ans, cnt_a - cnt_b - best[right_status ^ 0b10]
                        )

        return ans
```