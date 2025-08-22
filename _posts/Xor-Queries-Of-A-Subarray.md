---
title: "Xor Queries Of A Subarray"
date: "2024-09-13T08:06:39+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 1305 ms (19.05%) | Memory: 26 MB (85.71%) - LeetSync"
---

```c
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* xorQueries(int* arr, int arrSize, int** queries, int queriesSize, int* queriesColSize, int* returnSize) {
    
    int *result = malloc(sizeof(int)*queriesSize);
    *returnSize = queriesSize;
    for (int i = 0 ; i < queriesSize; i ++) {
        int a  = queries[i][0];
        int b = queries[i][1];
        int res = arr[a];
        a += 1;
        while(a <= b) {
            res = res ^ arr[a];
            a ++ ;
        }
        result[i] = res;
    }
    return result;
}
```