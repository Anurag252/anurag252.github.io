---
title: "Intersection Of Two Arrays Ii"
date: "2024-07-02T12:01:39+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 7 ms (31.63%) | Memory: 6 MB (67.91%) - LeetSync"
---

```c
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */

int compare(void* a, void * b) {
    int k1 = *((int*)(a));
    int k2 = *((int*)(b));
    return k1 - k2;
}

int* intersect(int* nums1, int nums1Size, int* nums2, int nums2Size, int* returnSize) {
    *returnSize = 0;
    if (nums1Size > nums2Size) {
        *returnSize = nums1Size;
    } else {
        *returnSize = nums2Size;
    }

    qsort(nums1, nums1Size, sizeof(int), compare);
    qsort(nums2, nums2Size, sizeof(int), compare);

    int* arr = malloc(*returnSize * sizeof(int));
    int a = 0;
    int b = 0;
    int c = 0;
    while(a < nums1Size && b < nums2Size){
        if (nums1[a] > nums2[b]){
            b ++ ;

        }else if (nums1[a] < nums2[b]){
            a ++ ;
            
        } else {
            arr[c] = nums1[a];
            c ++;
            a ++ ;
            b ++ ;
        }
    }
    *returnSize = c;
    return arr;
}
```