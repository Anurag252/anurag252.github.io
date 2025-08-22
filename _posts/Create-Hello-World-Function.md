---
title: "Create Hello World Function"
date: "2025-03-12T10:30:46+01:00"
categories: ["leetcode"]
tags: [javascript]
layout: post
problem_statement: "Time: 50 ms (42.43%) | Memory: 53.6 MB (9.28%) - LeetSync"
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