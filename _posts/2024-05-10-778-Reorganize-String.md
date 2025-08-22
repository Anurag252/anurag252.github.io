---
title: "778 Reorganize String"
date: "2024-05-10T20:43:10+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Reorganize String](https://leetcode.com/problems/reorganize-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.

Return *any possible rearrangement of* s *or return* "" *if not possible*.

 

Example 1:

```
**Input:** s = "aab"
**Output:** "aba"

```

Example 2:

```
**Input:** s = "aaab"
**Output:** ""

```

 

**Constraints:**

	1 <= s.length <= 500
	s consists of lowercase English letters.

```python
class Solution:
    import heapq as hq
    
    def reorganizeString(self, s: str) -> str:
        result = [None] * len(s)
        h = []
        map_str = {

        }
        for ch in s:
            if ch in map_str:
                map_str[ch] = map_str[ch] + 1
            else:
                map_str[ch] = 1

        for k,v in map_str.items():
            heappush(h, (-1 * v, k))
        i = 0
        l = 0
        for (v,k) in h:
            (i, v) = self.fill_first(i, -v, k, result)
            h[l] = (-v, k)
            l = l + 1
            if v != 0:
                break
        print(h, result)
        i = 0
        for (v,k) in h:
            if v != 0:
                (i, v) = self.fill_next(i, -v, k, result)
        if None in result:
            return ""
        return "".join(result)



    def fill_next(self, i : int, v : int, k : str ,result : List) -> (int, int):
        while(i < len(result) and v > 0):
            if result[i] == None and result[i-1] != k:
                result[i] = k
                v = v - 1
            i = i + 1
        return (i, v)

    def fill_first(self, i : int, v : int, k : str ,result : List) -> (int, int):
        while(i < len(result) and v > 0):
            result[i] = k
            v = v - 1
            i = i + 2
        return (i, v)


```