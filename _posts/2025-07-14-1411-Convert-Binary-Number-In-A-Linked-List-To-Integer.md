---
            title: "1411 Convert Binary Number In A Linked List To Integer"
            date: "2025-07-14T08:27:14+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Convert Binary Number in a Linked List to Integer](https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.

Return the *decimal value* of the number in the linked list.

The **most significant bit** is at the head of the linked list.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2019/12/05/graph-1.png)
```

**Input:** head = [1,0,1]
**Output:** 5
**Explanation:** (101) in base 2 = (5) in base 10

```

Example 2:

```

**Input:** head = [0]
**Output:** 0

```

 

**Constraints:**

	The Linked List is not empty.
	Number of nodes will not exceed 30.
	Each node's value is either 0 or 1.

{% raw %}


````rust


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


{% endraw %}
