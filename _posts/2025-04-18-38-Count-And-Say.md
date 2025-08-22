---
title: "38 Count And Say"
date: "2025-04-18T22:53:14+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

                            ## [Count and Say](https://leetcode.com/problems/count-and-say) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

The **count-and-say** sequence is a sequence of digit strings defined by the recursive formula:

    countAndSay(1) = "1"
    countAndSay(n) is the run-length encoding of countAndSay(n - 1).

[Run-length encoding](https://en.wikipedia.org/wiki/Run-length_encoding) (RLE) is a string compression method that works by replacing consecutive identical characters (repeated 2 or more times) with the concatenation of the character and the number marking the count of the characters (length of the run). For example, to compress the string "3322251" we replace "33" with "23", replace "222" with "32", replace "5" with "15" and replace "1" with "11". Thus the compressed string becomes "23321511".

Given a positive integer n, return *the *nth* element of the **count-and-say** sequence*.



Example 1:

**Input:** n = 4

**Output:** "1211"

**Explanation:**

```

countAndSay(1) = "1"
countAndSay(2) = RLE of "1" = "11"
countAndSay(3) = RLE of "11" = "21"
countAndSay(4) = RLE of "21" = "1211"

```

Example 2:

**Input:** n = 1

**Output:** "1"

**Explanation:**

This is the base case.



**Constraints:**

    1 <= n <= 30



**Follow up:** Could you solve it iteratively?

                            {% raw %}
                            ```python
                            class Solution:
    def countAndSay(self, n: int) -> str:

        def t(n):
            if n == 1:
                return "1"
            if n == 2:
                return "11"
            prev = ""
            c = 0
            res = ""
            l = t(n-1)
            for k in l:
                if prev == "":
                    prev = k
                    c = 1
                else:
                    if prev == k:
                        c += 1
                    else:
                        res += str(c) + prev
                        c = 1
                        prev = k
            res += str(c) + prev
            return res
        return t(n)






                            {% endraw %}

