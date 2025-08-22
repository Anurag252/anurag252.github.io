---
title: "592 Fraction Addition And Subtraction"
date: "2024-08-23T09:55:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Fraction Addition and Subtraction](https://leetcode.com/problems/fraction-addition-and-subtraction) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a string expression representing an expression of fraction addition and subtraction, return the calculation result in string format.

The final result should be an [irreducible fraction](https://en.wikipedia.org/wiki/Irreducible_fraction). If your final result is an integer, change it to the format of a fraction that has a denominator 1. So in this case, 2 should be converted to 2/1.

 

Example 1:

```

**Input:** expression = "-1/2+1/2"
**Output:** "0/1"

```

Example 2:

```

**Input:** expression = "-1/2+1/2+1/3"
**Output:** "1/3"

```

Example 3:

```

**Input:** expression = "1/3-1/2"
**Output:** "-1/6"

```

 

**Constraints:**

	The input string only contains '0' to '9', '/', '+' and '-'. So does the output.
	Each fraction (input and output) has the format ±numerator/denominator. If the first input fraction or the output is positive, then '+' will be omitted.
	The input only contains valid **irreducible fractions**, where the **numerator** and **denominator** of each fraction will always be in the range [1, 10]. If the denominator is 1, it means this fraction is actually an integer in a fraction format defined above.
	The number of given fractions will be in the range [1, 10].
	The numerator and denominator of the **final result** are guaranteed to be valid and in the range of **32-bit** int.

```python
class Solution:
    def fractionAddition(self, expression: str) -> str:
        

        def Calc(s1, s2) -> str:
            a1 = int(s1.split('/')[0])
            a2 = int(s1.split('/')[1])

            b1 = int(s2.split('/')[0])
            b2 = int(s2.split('/')[1])

            c2 = a2*b2
            c1 = b2*a1 + a2*b1
            #print(a1,a2,b1,b2,c1,c2)
            c_1 = c1
            c_2 = c2
            for k in range(1,max(abs(c1),abs(c2))  if min(abs(c2), abs(c1)) == 0 else min(abs(c2),abs(c1))+1):
                
                if c1 % k == 0 and c2 % k == 0:
                    print(str(k) + "aaaa")
                    c_1 = int(c1/k)
                    c_2 = int(c2/k)
            if c_1 == 0:
                c_2 = 1
            return str(c_1) + "/" + str(c_2)
        val = []
        sign = []
        k = 0
        if expression[0] != "-":
            sign.append("+")
        while(k < len(expression)):
            if expression[k] == "+":
                sign.append("+")
                k += 1
                continue
            if expression[k] == "-":
                sign.append("-")
                k+= 1
                continue
            print(expression[k])
            if expression[k+1] == "/" and k+3 == len(expression) or expression[k+3] == "+" or expression[k+3] == "-":
                val.append(expression[k] + expression[k+1] + expression[k+2])
                k = k + 3
            else :
                val.append(expression[k] + expression[k+1] + expression[k+2]+ expression[k+3])
                k = k + 4
        print(sign, val)

        a = 1
        old = sign[0] + val[0]
        while (a < len(sign)):
            print(old)
            old = Calc(old, sign[a] + val[a])
            print(old)
            a += 1
        return old if old[0] != "+" else old[1:]



                


```