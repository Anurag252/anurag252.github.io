---
title: "Sum Of Square Numbers"
date: "2024-06-17T14:46:55+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 5.2 MB (89.61%) - LeetSync"
---

```c
bool judgeSquareSum(int c) {
    if (c == 0) {
        return true;
    }
    for (int i = 1 ; i <= (int)(sqrt(c)) ; i ++) {
        double k = sqrt(c- i*i);
        if ((int)(k) == k) {
            //printf(" %d %d\n",k, i);
            return true;
        }
    }
    return false;
    
}
```