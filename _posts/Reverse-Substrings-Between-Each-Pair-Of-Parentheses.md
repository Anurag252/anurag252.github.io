---
title: "Reverse Substrings Between Each Pair Of Parentheses"
date: "2024-07-11T06:41:17+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 43 ms (12.97%) | Memory: 16.4 MB (81.94%) - LeetSync"
---

```python
class Solution:
    def reverseParentheses(self, s: str) -> str:
        stack = deque()
        for k in s:
            
            if k == ")":
                ls = []
                found = False
                while not found:
                    ls.append(stack.pop())
                    if ls[-1] == "(":
                        found = True
                del ls[-1]
                
                for v in ls:
                    stack.append(v)

            else:
                stack.append(k)
        return ''.join(stack)


```