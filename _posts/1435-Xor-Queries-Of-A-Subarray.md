---
title: "1435 Xor Queries Of A Subarray"
date: "2024-09-13T08:06:39+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: |
  ## [XOR Queries of a Subarray](https://leetcode.com/problems/xor-queries-of-a-subarray) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given an array arr of positive integers. You are also given the array queries where queries[i] = [lefti, righti].
  
  For each query i compute the **XOR** of elements from lefti to righti (that is, arr[lefti] XOR arr[lefti + 1] XOR ... XOR arr[righti] ).
  
  Return an array answer where answer[i] is the answer to the ith query.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** arr = [1,3,4,8], queries = [[0,1],[1,2],[0,3],[3,3]]
  **Output:** [2,7,14,8] 
  **Explanation:** 
  The binary representation of the elements in the array are:
  1 = 0001 
  3 = 0011 
  4 = 0100 
  8 = 1000 
  The XOR values for queries are:
  [0,1] = 1 xor 3 = 2 
  [1,2] = 3 xor 4 = 7 
  [0,3] = 1 xor 3 xor 4 xor 8 = 14 
  [3,3] = 8
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** arr = [4,8,2,10], queries = [[2,3],[1,3],[0,0],[0,3]]
  **Output:** [8,0,4,4]
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= arr.length, queries.length &lt;= 3 * 104
  	1 &lt;= arr[i] &lt;= 109
  	queries[i].length == 2
  	0 &lt;= lefti &lt;= righti &lt; arr.length
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