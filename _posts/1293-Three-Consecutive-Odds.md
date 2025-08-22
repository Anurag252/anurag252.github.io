---
title: "1293 Three Consecutive Odds"
date: "2024-07-01T12:41:26+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: |
  ## [Three Consecutive Odds](https://leetcode.com/problems/three-consecutive-odds) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)Given an integer array arr, return true&nbsp;if there are three consecutive odd numbers in the array. Otherwise, return&nbsp;false.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** arr = [2,6,4,1]
  **Output:** false
  **Explanation:** There are no three consecutive odds.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** arr = [1,2,34,3,4,5,7,23,12]
  **Output:** true
  **Explanation:** [5,7,23] are three consecutive odds.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= arr.length &lt;= 1000
  	1 &lt;= arr[i] &lt;= 1000
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