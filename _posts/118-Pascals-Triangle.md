---
title: "118 Pascals Triangle"
date: "2025-08-01T22:14:37+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: |
  ## [Pascal's Triangle](https://leetcode.com/problems/pascals-triangle) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Given an integer numRows, return the first numRows of **Pascal&#39;s triangle**.
  
  In **Pascal&#39;s triangle**, each number is the sum of the two numbers directly above it as shown:
  
  ![image](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)
  
  &nbsp;
  
  Example 1:
  
  ```
  **Input:** numRows = 5
  **Output:** [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
  
  ```
  
  Example 2:
  
  ```
  **Input:** numRows = 1
  **Output:** [[1]]
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= numRows &lt;= 30
---

```rust
impl Solution {
    pub fn generate(num_rows: i32) -> Vec<Vec<i32>> {
        let mut res : Vec<Vec<i32>> = Vec::new();
        let mut temp : Vec<i32> = Vec::new();
        temp.push(1);
        res.push(temp.clone());
        for i in 1..num_rows {
            let mut f = 0;
            let mut r = 1;
            let mut temp_to_add = Vec::new();
            temp_to_add.push(1);
            while (r < temp.len()) {
                temp_to_add.push(temp[f] + temp[r]);
                f += 1;
                r += 1;
            }
            temp_to_add.push(1);
            res.push(temp_to_add.clone());
            temp = temp_to_add;
        }
        res
    }
}
```