---
title: "Different Ways To Add Parentheses"
date: "2024-09-19T15:32:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 23 ms (99.15%) | Memory: 16.6 MB (67.70%) - LeetSync"
---

```python
from typing import List

class Solution:
    def __init__(self):
        self.cache = {}
    
    def diffWaysToCompute(self, expression: str) -> List[int]:
        # If the result is already cached, return it
        if expression in self.cache:
            return self.cache[expression]
        
        # This will store all the possible results
        res = []
        
        # Traverse the expression and evaluate based on operators
        for i, c in enumerate(expression):
            if c in "+-*":
                # Divide the problem into left and right parts
                left = self.diffWaysToCompute(expression[:i])
                right = self.diffWaysToCompute(expression[i+1:])
                
                # Calculate all combinations of left and right parts with the current operator
                for l in left:
                    for r in right:
                        if c == "+":
                            res.append(l + r)
                        elif c == "-":
                            res.append(l - r)
                        elif c == "*":
                            res.append(l * r)
        
        # Base case: if there are no operators, return the number itself
        if not res:
            res = [int(expression)]
        
        # Cache the result
        self.cache[expression] = res
        return res

```