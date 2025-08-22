---
title: "20 Valid Parentheses"
date: "2025-01-12T11:35:12+01:00"
categories: ["leetcode"]
tags: [javascript]
layout: post
---


                            ## [Valid Parentheses](https://leetcode.com/problems/valid-parentheses) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

	Open brackets must be closed by the same type of brackets.
	Open brackets must be closed in the correct order.
	Every close bracket has a corresponding open bracket of the same type.

 

Example 1:

**Input:** s = "()"

**Output:** true

Example 2:

**Input:** s = "()[]{}"

**Output:** true

Example 3:

**Input:** s = "(]"

**Output:** false

Example 4:

**Input:** s = "([])"

**Output:** true

 

**Constraints:**

	1 <= s.length <= 104
	s consists of parentheses only '()[]{}'.

                            {% raw %}
                            ```javascript
                            /**
 * @param {string} s
 * @return {boolean}
 */


let isValid = (testString) => {

    let paran = []
    for (let i = 0 ; i < testString.length; i ++) {

        if (paran.length > 0 ) {
            let current = paran[paran.length - 1]
            if ( (current == '(' && testString[i] == ')' ) || (current == '[' && testString[i] == ']' ) || (current == '{' && testString[i] == '}' ) ){
                paran.pop()
            } else {
                 paran.push(testString[i])
            }   
        } else {
             paran.push(testString[i])
        }
    }

    return paran.length == 0
}
                            {% endraw %}
                            