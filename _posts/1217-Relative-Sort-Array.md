---
title: "./1217 Relative Sort Array"
date: "2024-06-11T08:57:33+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/relative-sort-array">Relative Sort Array</a></h2> <img src='https://img.shields.io/badge/Difficulty-Easy-brightgreen' alt='Difficulty: Easy' /><hr><p>Given two arrays <code>arr1</code> and <code>arr2</code>, the elements of <code>arr2</code> are distinct, and all elements in <code>arr2</code> are also in <code>arr1</code>.</p>

<p>Sort the elements of <code>arr1</code> such that the relative ordering of items in <code>arr1</code> are the same as in <code>arr2</code>. Elements that do not appear in <code>arr2</code> should be placed at the end of <code>arr1</code> in <strong>ascending</strong> order.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
<strong>Output:</strong> [2,2,2,1,4,3,3,9,6,7,19]
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> arr1 = [28,6,22,8,44,17], arr2 = [22,28,8,6]
<strong>Output:</strong> [22,28,8,6,17,44]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= arr1.length, arr2.length &lt;= 1000</code></li>
	<li><code>0 &lt;= arr1[i], arr2[i] &lt;= 1000</code></li>
	<li>All the elements of <code>arr2</code> are <strong>distinct</strong>.</li>
	<li>Each&nbsp;<code>arr2[i]</code> is in <code>arr1</code>.</li>
</ul>"
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