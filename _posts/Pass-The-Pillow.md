---
title: "Pass The Pillow"
date: "2024-07-06T11:07:29+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 5.7 MB (40.63%) - LeetSync"
---

```c
int passThePillow(int n, int time) {


    if (((time / (n-1)) % 2) == 1) {
        // returning
        return n-(time % (n-1));
        
    } else {
        return (time % (n-1)) + 1;
        // going forward
    }
}

// 2
```