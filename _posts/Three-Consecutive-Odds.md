---
title: "Three Consecutive Odds"
date: "2024-07-01T12:41:26+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 5.8 MB (30.28%) - LeetSync"
---

```c

bool threeConsecutiveOdds(int* arr, int arrSize) {
    //qsort(arr, arrSize, sizeof(int), compare);
    int a = 0;
    int prev = 0;
   
    for (int i = 0 ; i < arrSize ; i ++) {
        if (arr[i] % 2 != 0 ) {
                a ++;
        } else {
            a = 0;
        }
        if (a == 3) {
            return true;
        }
    }
    return false;
}
```