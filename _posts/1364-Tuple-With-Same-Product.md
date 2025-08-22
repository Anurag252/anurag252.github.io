---
title: "1364 Tuple With Same Product"
date: "2025-02-06T08:16:01+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: |
  ## [Tuple with Same Product](https://leetcode.com/problems/tuple-with-same-product) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given an array nums of **distinct** positive integers, return *the number of tuples *(a, b, c, d)* such that *a * b = c * d* where *a*, *b*, *c*, and *d* are elements of *nums*, and *a != b != c != d*.*
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** nums = [2,3,4,6]
  **Output:** 8
  **Explanation:** There are 8 valid tuples:
  (2,6,3,4) , (2,6,4,3) , (6,2,3,4) , (6,2,4,3)
  (3,4,2,6) , (4,3,2,6) , (3,4,6,2) , (4,3,6,2)
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** nums = [1,2,4,5,10]
  **Output:** 16
  **Explanation:** There are 16 valid tuples:
  (1,10,2,5) , (1,10,5,2) , (10,1,2,5) , (10,1,5,2)
  (2,5,1,10) , (2,5,10,1) , (5,2,1,10) , (5,2,10,1)
  (2,10,4,5) , (2,10,5,4) , (10,2,4,5) , (10,2,5,4)
  (4,5,2,10) , (4,5,10,2) , (5,4,2,10) , (5,4,10,2)
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= nums.length &lt;= 1000
  	1 &lt;= nums[i] &lt;= 104
  	All elements in nums are **distinct**.
---

```go
func tupleSameProduct(nums []int) int {
    mp := make(map[int]int)

    for _, k1 := range nums {
        for _ , k2 := range nums {
            if k1 != k2 {
                mp[k1*k2] += 1
            }
        }
    }   

    //fmt.Println(mp)
    res := 0
    // 4-> 8
    // 6 -> 24 
    // a b c d perm -> 8
    // ab cd
    // ab cd ef-> 8
    // ab cd, ba cd, ab dc, ba dc, 
    // groups of v / 2 -> from this select 2
    // groups of 4/ 2 = 2 -> from this select 2 only 1 way
    // gropus of 6/2 = 3 -> from this select 2 only 3 ways 
    for _, v := range mp {
        if v >= 4 {
            groups := v/2
            sel := (groups * (groups -1)) / 2
            res += (8 * sel)
        }
    }

   
    return res

}
```