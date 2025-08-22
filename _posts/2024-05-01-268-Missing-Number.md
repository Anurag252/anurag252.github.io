---
title: "268 Missing Number"
date: "2024-05-01T22:53:33+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: |
  ## [Missing Number](https://leetcode.com/problems/missing-number) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Given an array nums containing n distinct numbers in the range [0, n], return *the only number in the range that is missing from the array.*
  
   
  
  Example 1:
  
  ```
  
  **Input:** nums = [3,0,1]
  **Output:** 2
  **Explanation:** n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [0,1]
  **Output:** 2
  **Explanation:** n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** nums = [9,6,4,2,3,5,7,0,1]
  **Output:** 8
  **Explanation:** n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
  
  ```
  
   
  
  **Constraints:**
  
  	n == nums.length
  	1 <= n <= 104
  	0 <= nums[i] <= n
  	All the numbers of nums are **unique**.
  
   
  
  **Follow up:** Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?
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