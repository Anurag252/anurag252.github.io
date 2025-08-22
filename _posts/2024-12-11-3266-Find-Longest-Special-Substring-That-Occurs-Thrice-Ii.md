---
title: "3266 Find Longest Special Substring That Occurs Thrice Ii"
date: "2024-12-11T16:37:48+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Find Longest Special Substring That Occurs Thrice II](https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s that consists of lowercase English letters.

A string is called **special** if it is made up of only a single character. For example, the string "abc" is not special, whereas the strings "ddd", "zz", and "f" are special.

Return *the length of the **longest special substring** of *s *which occurs **at least thrice***, *or *-1* if no special substring occurs at least thrice*.

A **substring** is a contiguous **non-empty** sequence of characters within a string.

 

Example 1:

```

**Input:** s = "aaaa"
**Output:** 2
**Explanation:** The longest special substring which occurs thrice is "aa": substrings "**aa**aa", "a**aa**a", and "aa**aa**".
It can be shown that the maximum length achievable is 2.

```

Example 2:

```

**Input:** s = "abcdef"
**Output:** -1
**Explanation:** There exists no special substring which occurs at least thrice. Hence return -1.

```

Example 3:

```

**Input:** s = "abcaba"
**Output:** 1
**Explanation:** The longest special substring which occurs thrice is "a": substrings "**a**bcaba", "abc**a**ba", and "abcab**a**".
It can be shown that the maximum length achievable is 1.

```

 

**Constraints:**

	3 <= s.length <= 5 * 105
	s consists of only lowercase English letters.

                            {% raw %}
                            ```python
                            class Solution:
    def maximumLength(self, s: str) -> int:
        f = {}
        i = 0
        while(i < len(s)):
            j = i + 1
            while j < len(s) and s[j] == s[i]:
                j += 1
            if s[i] in f:
                if len(f[s[i]]) >= 3:
                    if f[s[i]][0]  == min(f[s[i]]):
                        f[s[i]][0] = j - i
                    elif f[s[i]][1]  == min(f[s[i]]):
                        f[s[i]][1] = j - i
                    else:
                        f[s[i]][2] = j - i
                else:
                    f[s[i]].append(j - i)
            else :
                f[s[i]] = []
                f[s[i]].append(j - i)
            i = j
        print(f)
        res = -1
        for v in f.values():
            if sum(v) >= 3:
                res = max(1, res)
                v.sort()
                if len(v) == 3 and v[1] < v[2]:
                    res = max(res, max(v[2]-2, v[1]))
                elif len(v) == 2 and v[0] < v[1]:
                    res = max(res, max(v[1]-2, v[0]))
                elif len(v) == 1 :
                    res = max(res, v[0]-2)
                else :
                    print(v)
                    if len(v) >= 3 and len(set(v)) == 1:
                        res = max(res, max(v))
                        continue
                    if len(v) >= 3 and len(set(v)) == 2:
                        res = max(res, max(v)-1)
                        continue
                    if len(v) < 3 and len(set(v)) == 1:
                        res = max(res, max(v)-1)
                        continue
                    if len(v) < 3 and len(set(v)) == 2:
                        res = max(res, max(v)-1)
                        continue
                #ans is always max(v) - 1 0r max(v)-2

        return res






"""
        4 -3 + 1
        min(num of continuos occurence) -  3 + 1
        aaaa aaa aa
        aa 
        4,3,2
        """
                            {% endraw %}
                            