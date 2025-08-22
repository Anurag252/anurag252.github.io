---
title: "Missing Number"
date: "2024-05-01T22:53:33+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 10 ms (91.02%) | Memory: 6.3 MB (60.67%) - LeetSync"
---

```c
int missingNumber(int* nums, int numsSize) {
    int all_xor = 0 ;
    printf("%d", 1 ^ 1);
    for (int i = 0 ; i < numsSize; i ++) {
        all_xor = all_xor ^ *(nums + i) ^ i;
    }   

    // 3^0  ^ 0^1 ^ 1^2 ^ 3
    return all_xor ^ numsSize;
}
```