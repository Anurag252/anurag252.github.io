---
title: "241 Different Ways To Add Parentheses"
date: "2024-09-19T15:32:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Different Ways to Add Parentheses](https://leetcode.com/problems/different-ways-to-add-parentheses) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a string expression of numbers and operators, return *all possible results from computing all the different possible ways to group numbers and operators*. You may return the answer in **any order**.

The test cases are generated such that the output values fit in a 32-bit integer and the number of different results does not exceed 104.

 

Example 1:

```

**Input:** expression = "2-1-1"
**Output:** [0,2]
**Explanation:**
((2-1)-1) = 0 
(2-(1-1)) = 2

```

Example 2:

```

**Input:** expression = "2*3-4*5"
**Output:** [-34,-14,-10,-10,10]
**Explanation:**
(2*(3-(4*5))) = -34 
((2*3)-(4*5)) = -14 
((2*(3-4))*5) = -10 
(2*((3-4)*5)) = -10 
(((2*3)-4)*5) = 10

```

 

**Constraints:**

	1 <= expression.length <= 20
	expression consists of digits and the operator '+', '-', and '*'.
	All the integer values in the input expression are in the range [0, 99].
	The integer values in the input expression do not have a leading '-' or '+' denoting the sign.

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