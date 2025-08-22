---
title: "2809 Create Hello World Function"
date: "2025-03-12T10:30:46+01:00"
categories: ["leetcode"]
tags: [javascript]
layout: post
problem_statement: |
  ## [Create Hello World Function](https://leetcode.com/problems/create-hello-world-function) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)Write a function&nbsp;createHelloWorld.&nbsp;It should return a new function that always returns&nbsp;&quot;Hello World&quot;.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** args = []
  **Output:** \"Hello World\"
  **Explanation:**
  const f = createHelloWorld();
  f(); // \"Hello World\"
  
  The function returned by createHelloWorld should always return \"Hello World\".
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** args = [{},null,42]
  **Output:** \"Hello World\"
  **Explanation:**
  const f = createHelloWorld();
  f({}, null, 42); // \"Hello World\"
  
  Any arguments could be passed to the function but it should still always return \"Hello World\".
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	0 &lt;= args.length &lt;= 10
---

```javascript
/**
 * @return {Function}
 */
var createHelloWorld = function() {
    
    return function(...args) {
        return "Hello World"
    }
};

/**
 * const f = createHelloWorld();
 * f(); // "Hello World"
 */
```