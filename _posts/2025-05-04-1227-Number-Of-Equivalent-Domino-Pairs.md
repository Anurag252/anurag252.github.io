---
title: "1227 Number Of Equivalent Domino Pairs"
date: "2025-05-04T17:55:49+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: |
  ## [Number of Equivalent Domino Pairs](https://leetcode.com/problems/number-of-equivalent-domino-pairs) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Given a list of dominoes, dominoes[i] = [a, b] is **equivalent to** dominoes[j] = [c, d] if and only if either (a == c and b == d), or (a == d and b == c) - that is, one domino can be rotated to be equal to another domino.
  
  Return *the number of pairs *(i, j)* for which *0 <= i < j < dominoes.length*, and *dominoes[i]* is **equivalent to** *dominoes[j].
  
   
  
  Example 1:
  
  ```
  
  **Input:** dominoes = [[1,2],[2,1],[3,4],[5,6]]
  **Output:** 1
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** dominoes = [[1,2],[1,2],[1,1],[1,2],[2,2]]
  **Output:** 3
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= dominoes.length <= 4 * 104
  	dominoes[i].length == 2
  	1 <= dominoes[i][j] <= 9
---

```rust
use std::collections::HashMap ;
use std::cmp::max;

impl Solution {
    pub fn num_equiv_domino_pairs(dominoes: Vec<Vec<i32>>) -> i32 {
        let mut mp = HashMap::new();
        for k in dominoes {
            if k[0] > k[1] {
                let state = mp.entry((k[1], k[0])).or_insert(0);
                *state += 1;

            } else {
                let state = mp.entry((k[0], k[1])).or_insert(0);
                *state += 1;
            }
            
        }
        let mut res = 0;
        for (k,v) in mp {
            if v > 1 {
                res += v * (v-1) / 2;
            }
        }
        return res 
    }
}
```