---
title: "Parsing A Boolean Expression"
date: "2024-10-20T09:41:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 28 ms (99.40%) | Memory: 17 MB (8.08%) - LeetSync"
---

```python
class Solution:
    def parseBoolExpr(self, expression: str) -> bool:
        if len(expression) == 1:
            if expression == "f":
                return False
            else:
                return True

        inner = expression[2:-1]

        start = 0 
        end = len(inner) 
        expr = []
        while(start < end):
            if inner[start] == ",":
                start += 1
                continue
            if inner[start] == "&" or inner[start] == "|"  or inner[start] == "!" :
                stack = []
                s = []
                s.append(inner[start])
                s.append("(")
                stack.append("(")
                start += 2
                while(len(stack) > 0):
                    s.append(inner[start])
                    if inner[start] == ")":
                        while(stack.pop() != "("):
                            continue
                    else:
                        stack.append(inner[start])
                    start += 1
                expr.append("".join(s))
                continue
            if inner[start] == "f" or inner[start] == "t":
                expr.append(inner[start])
                start += 1
        #print(expr, inner)
        if expression[0] == "&":
            result = True
            for k in expr:
                result = result and self.parseBoolExpr(k)
            return result

        if expression[0] == "|":
            result = False
            for k in expr:
                result = result or self.parseBoolExpr(k)
            return result

        if expression[0] == "!":
            inner = expression[2:-1]
            result = not self.parseBoolExpr(inner)
            return result

        
```