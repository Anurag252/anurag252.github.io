---
title: "1197 Parsing A Boolean Expression"
date: "2024-10-20T09:41:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Parsing A Boolean Expression](https://leetcode.com/problems/parsing-a-boolean-expression) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

A **boolean expression** is an expression that evaluates to either true or false. It can be in one of the following shapes:

	't' that evaluates to true.
	'f' that evaluates to false.
	'!(subExpr)' that evaluates to **the logical NOT** of the inner expression subExpr.
	'&(subExpr1, subExpr2, ..., subExprn)' that evaluates to **the logical AND** of the inner expressions subExpr1, subExpr2, ..., subExprn where n >= 1.
	'|(subExpr1, subExpr2, ..., subExprn)' that evaluates to **the logical OR** of the inner expressions subExpr1, subExpr2, ..., subExprn where n >= 1.

Given a string expression that represents a **boolean expression**, return *the evaluation of that expression*.

It is **guaranteed** that the given expression is valid and follows the given rules.

 

Example 1:

```

**Input:** expression = "&(|(f))"
**Output:** false
**Explanation:** 
First, evaluate |(f) --> f. The expression is now "&(f)".
Then, evaluate &(f) --> f. The expression is now "f".
Finally, return false.

```

Example 2:

```

**Input:** expression = "|(f,f,f,t)"
**Output:** true
**Explanation:** The evaluation of (false OR false OR false OR true) is true.

```

Example 3:

```

**Input:** expression = "!(&(f,t))"
**Output:** true
**Explanation:** 
First, evaluate &(f,t) --> (false AND true) --> false --> f. The expression is now "!(f)".
Then, evaluate !(f) --> NOT false --> true. We return true.

```

 

**Constraints:**

	1 <= expression.length <= 2 * 104
	expression[i] is one following characters: '(', ')', '&', '|', '!', 't', 'f', and ','.

                            {% raw %}
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

        
                            {% endraw %}
                            