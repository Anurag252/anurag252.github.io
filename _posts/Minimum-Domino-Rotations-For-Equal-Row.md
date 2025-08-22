---
title: "Minimum Domino Rotations For Equal Row"
date: "2025-05-03T06:53:46+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 11 ms (7.69%) | Memory: 2.5 MB (53.85%) - LeetSync"
---

```rust
use std::collections::HashMap;
use std::cmp::max;
use std::cmp::min;



impl Solution {
    pub fn min_domino_rotations(tops: Vec<i32>, bottoms: Vec<i32>) -> i32 {
        let mut dominoes = HashMap::new();
        let mut dominoes_tops = HashMap::new();
        let mut dominoes_bottoms = HashMap::new();


        for (top, bottom) in tops.iter().zip(bottoms.iter()) {
    if top == bottom {
        *dominoes.entry(*top).or_insert(0) += 1;
        // skip adding to tops or bottoms individually
    } else {
        *dominoes.entry(*top).or_insert(0) += 1;
        *dominoes.entry(*bottom).or_insert(0) += 1;
        *dominoes_tops.entry(*top).or_insert(0) += 1;
        *dominoes_bottoms.entry(*bottom).or_insert(0) += 1;
    }
}


        let mut mx_k = 0;
        let mut mx_v = 0;

        for (k, v) in &dominoes {
            if *v > mx_v {
                mx_v = *v;
                mx_k = *k;
            }
        }

        let top_count = *dominoes_tops.get(&mx_k).unwrap_or(&0);
        let bottom_count = *dominoes_bottoms.get(&mx_k).unwrap_or(&0);

        println!("dominoes_tops: {:?}", dominoes_tops);
        println!("dominoes_bottoms: {:?}", dominoes_bottoms);
        println!("dominoes (combined): {:?}", dominoes);
        println!("Max key: {}, Top count: {}, Bottom count: {}", mx_k, top_count, bottom_count);

        if *dominoes.get(&mx_k).unwrap_or(&0) < (tops.len()) {
            return -1
        }
        return min(top_count as i32 , bottom_count as i32);

    }
}

```