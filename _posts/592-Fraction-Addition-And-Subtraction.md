---
title: "./592 Fraction Addition And Subtraction"
date: "2024-08-23T09:55:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/fraction-addition-and-subtraction">Fraction Addition and Subtraction</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a string <code>expression</code> representing an expression of fraction addition and subtraction, return the calculation result in string format.</p>

<p>The final result should be an <a href="https://en.wikipedia.org/wiki/Irreducible_fraction" target="_blank">irreducible fraction</a>. If your final result is an integer, change it to the format of a fraction that has a denominator <code>1</code>. So in this case, <code>2</code> should be converted to <code>2/1</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> expression = &quot;-1/2+1/2&quot;
<strong>Output:</strong> &quot;0/1&quot;
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> expression = &quot;-1/2+1/2+1/3&quot;
<strong>Output:</strong> &quot;1/3&quot;
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> expression = &quot;1/3-1/2&quot;
<strong>Output:</strong> &quot;-1/6&quot;
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li>The input string only contains <code>&#39;0&#39;</code> to <code>&#39;9&#39;</code>, <code>&#39;/&#39;</code>, <code>&#39;+&#39;</code> and <code>&#39;-&#39;</code>. So does the output.</li>
	<li>Each fraction (input and output) has the format <code>&plusmn;numerator/denominator</code>. If the first input fraction or the output is positive, then <code>&#39;+&#39;</code> will be omitted.</li>
	<li>The input only contains valid <strong>irreducible fractions</strong>, where the <strong>numerator</strong> and <strong>denominator</strong> of each fraction will always be in the range <code>[1, 10]</code>. If the denominator is <code>1</code>, it means this fraction is actually an integer in a fraction format defined above.</li>
	<li>The number of given fractions will be in the range <code>[1, 10]</code>.</li>
	<li>The numerator and denominator of the <strong>final result</strong> are guaranteed to be valid and in the range of <strong>32-bit</strong> int.</li>
</ul>"
---

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