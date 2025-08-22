---
title: "Count Number Of Maximum Bitwise Or Subsets"
date: "2025-07-28T16:21:41+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 5 ms (50.00%) | Memory: 2.1 MB (83.33%) - LeetSync"
---

```rust
impl Solution {
    pub fn count_max_or_subsets(nums: Vec<i32>) -> i32 {
        // bitwise or is max if done for all elements ?
        //length is 16 
        // so there can be 2^16 subsets , which is quite lrge 
        // but maybe still under pow(10,5) ? IDK 
        // idea is if there is a 1 at a ceratin place 
        // we could exclude the other 1 from other integeres
        // say we have an array of 16
        // we could all 1s at each place,
        // indexes with just 1 1s are mandatory
        // rest are optional
        // final answer would be (optional + 1)*(mandatory count)

        // 010 101

        let mut final_result = 0;
        let mut result = 0;
        for k in &nums {
            final_result |= k;
        }
        println!("{}", final_result);

        fn subset( arr : &Vec<i32>, total : i32, final_result : i32, mut result : &mut i32, index : i32) {
            //println!("{} {} {} {}", total, final_result, result, index);
            if total == final_result && index == arr.len() as i32  {
                *result = *result + 1;
            }
            if index >= arr.len() as i32 {
                return 
            }
            subset(arr, total | arr[index as usize] , final_result, result, index + 1 );
            subset(arr, total , final_result, result, index + 1 );
            

        }
        subset(&nums, 0, final_result, &mut result, 0);
        return result;
    }
}
```