---
title: "Relative Sort Array"
date: "2024-06-11T08:57:33+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 16 ms (6.98%) | Memory: 6 MB (13.95%) - LeetSync"
---

```c
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */

int compar (const void* p1, const void* p2);
int  *secondarr ;
int  secondarrSize ;


int* relativeSortArray(int* arr1, int arr1Size, int* arr2, int arr2Size, int* returnSize) {
    secondarr = malloc(arr2Size * sizeof(int*));
    secondarrSize = arr2Size;
    for (int i = 0 ; i < arr2Size; i ++){
        secondarr[i] = arr2[i];
    }
    int* new_arr = malloc(arr1Size * sizeof(int));
    for (int i = 0 ; i < arr1Size; i ++){
        new_arr[i] = arr1[i];
        printf("%d  %d\n", new_arr[i], i);
    }

    qsort(new_arr, arr1Size , sizeof(int), compar);
    for (int i = 0 ; i < arr1Size; i ++){
        printf("%d A %d\n", new_arr[i], i);
    }
    free(secondarr);
     *returnSize = arr1Size;
    return new_arr ;
}

int compar (const void* p1, const void* p2) {

    // find p1
    int i = 10000;
    int j = 10000;
    int* a = ((int*)p1);
    int* b = ((int*)p2);
    //printf("%d  %d", *a, *b);
    for (int k = 0 ; k < secondarrSize; k ++) {
        //printf("%d AB\n", secondarr[k]);
        if ((*a) == secondarr[k]) {
            i = k;
        }

        if ((*b) == secondarr[k]) {
            j = k;
        }
    }
    //printf("\n%d A %d\n", i, j);
    if (i == 10000 && j == 10000) {
        if (*a > *b){
            return 1;
        } else {
            return -1;
        }
    }

    if (i == 10000) {
        return 1;
    }

    if (j == 10000) {
        return -1;
    }

    if (i > j) {
        return 1;
    }

    if (i < j) {
        return -1;
    }
    return 0;
}

```