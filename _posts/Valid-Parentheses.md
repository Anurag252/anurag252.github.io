---
title: "Valid Parentheses"
date: "2025-01-12T11:35:12+01:00"
categories: ["leetcode"]
tags: [javascript]
layout: post
problem_statement: "Time: 4 ms (45.02%) | Memory: 52.4 MB (10.43%) - LeetSync"
---

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
```