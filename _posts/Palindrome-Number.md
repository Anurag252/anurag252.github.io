---
title: "Palindrome Number"
date: "2024-07-20T10:28:07+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 7.9 MB (12.65%) - LeetSync"
---

```c
bool isPalindrome(int x) {
    int k = 1;
    while(x/k >= 10){
        k = k * 10;
    }
    if (x < 0) {
        return false;
    }
    int l = 10;
    int y = x;
    //printf("%d %d", x/k, y%l);
    while(k >= 1 && y >= 1 && x/k == y%l ){
        x = x % k;
        k = k /10;
        y = y / 10;
    }

    if (x == 0) {
        return true;
    }
    return false;

}
```