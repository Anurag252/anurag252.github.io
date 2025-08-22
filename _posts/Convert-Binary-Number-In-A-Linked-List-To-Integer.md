---
title: "Convert Binary Number In A Linked List To Integer"
date: "2025-07-14T08:27:14+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 2.2 MB (0.00%) - LeetSync"
---

```rust
// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
// 
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
use std::ptr::null;
impl Solution {
    pub fn get_decimal_value(mut head: Option<Box<ListNode>>) -> i32 {
        let mut res = 0;
        while let Some(node) = head {
            res = (res << 1) | node.val;
            head = node.next;
        }
        res

    }
}
```