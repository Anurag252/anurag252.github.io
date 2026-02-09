---
            title: "1285 Balance A Binary Search Tree"
            date: "2026-02-09T22:43:11+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Balance a Binary Search Tree](https://leetcode.com/problems/balance-a-binary-search-tree) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary search tree, return *a **balanced** binary search tree with the same node values*. If there is more than one answer, return **any of them**.

A binary search tree is **balanced** if the depth of the two subtrees of every node never differs by more than 1.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/08/10/balance1-tree.jpg)
```

**Input:** root = [1,null,2,null,3,null,4,null,null]
**Output:** [2,1,3,null,null,null,4]
**Explanation:** This is not the only correct answer, [3,1,4,null,2] is also correct.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/08/10/balanced2-tree.jpg)
```

**Input:** root = [2,1,3]
**Output:** [2,1,3]

```

 

**Constraints:**

	The number of nodes in the tree is in the range [1, 104].
	1 <= Node.val <= 105

{% raw %}


```rust


// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
// 
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
use std::rc::Rc;
use std::cell::RefCell;
impl Solution {
    pub fn balance_bst(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        // how abt i just take amiddle 
        // element and then 
        // find mid of left and right
        // and create left and right 
        let mut arr : Vec<i32> = Vec::new();

        fn recurse(root: Option<Rc<RefCell<TreeNode>>>, arr: &mut Vec<i32>) {
    if let Some(node) = root {          // “If the file exists…”
        let node_ref = node.borrow();   // “Open the file for reading”
        recurse(node_ref.left.clone(), arr);  // “Read left child”
        arr.push(node_ref.val);                // “Read this file’s value and save it”
        recurse(node_ref.right.clone(), arr); // “Read right child”
    }
}

        recurse(root, &mut arr);
        
        fn build(arr: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
            if arr.is_empty() { return None; }
            let mid = arr.len() / 2;
            let root = Rc::new(RefCell::new(TreeNode::new(arr[mid])));
            root.borrow_mut().left = build(&arr[..mid]);
            root.borrow_mut().right = build(&arr[mid+1..]);
            Some(root)
        }

        
        //print!("{:?}", arr);
        return build(&arr);
    }
}


{% endraw %}
```
