---
title: "957 Minimum Add To Make Parentheses Valid"
date: "2024-10-09T07:24:07+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Minimum Add to Make Parentheses Valid](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A parentheses string is valid if and only if:

	It is the empty string,
	It can be written as AB (A concatenated with B), where A and B are valid strings, or
	It can be written as (A), where A is a valid string.

You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.

	For example, if s = "()))", you can insert an opening parenthesis to be "(**(**)))" or a closing parenthesis to be "())**)**)".

Return *the minimum number of moves required to make *s* valid*.

 

Example 1:

```

**Input:** s = "())"
**Output:** 1

```

Example 2:

```

**Input:** s = "((("
**Output:** 3

```

 

**Constraints:**

	1 <= s.length <= 1000
	s[i] is either '(' or ')'.

                            {% raw %}
                            ```python
                            class Solution:
    def minAddToMakeValid(self, s: str) -> int:
        arr = []
        for k in s:
            if k == ")" and len(arr) > 0 and  arr[-1] == "(":
                arr.pop()
            else:
                arr.append(k)
        return len(arr)
                

    #"()))(("

                            {% endraw %}
                            