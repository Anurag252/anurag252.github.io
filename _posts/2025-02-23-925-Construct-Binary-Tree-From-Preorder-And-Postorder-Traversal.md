---
title: "925 Construct Binary Tree From Preorder And Postorder Traversal"
date: "2025-02-23T09:54:29+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---


                            ## [Construct Binary Tree from Preorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two integer arrays, preorder and postorder where preorder is the preorder traversal of a binary tree of **distinct** values and postorder is the postorder traversal of the same tree, reconstruct and return *the binary tree*.

If there exist multiple answers, you can **return any** of them.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/07/24/lc-prepost.jpg)
```

**Input:** preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]
**Output:** [1,2,3,4,5,6,7]

```

Example 2:

```

**Input:** preorder = [1], postorder = [1]
**Output:** [1]

```

 

**Constraints:**

	1 <= preorder.length <= 30
	1 <= preorder[i] <= preorder.length
	All the values of preorder are **unique**.
	postorder.length == preorder.length
	1 <= postorder[i] <= postorder.length
	All the values of postorder are **unique**.
	It is guaranteed that preorder and postorder are the preorder traversal and postorder traversal of the same binary tree.

                            {% raw %}
                            ```go
                            /**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func constructFromPrePost(preorder []int, postorder []int) *TreeNode {
    // in preorder 
    // root -> left -> right
    // left -> right -> root
    // read preorder first element as root , 
    // read next from preorder , it can be both left or right 
    // from root attach leftmost node to root
    // preorder[0] is root and postorder[-1] is root
    // create root and remove both 
    // again  preorder[0] is root and 
    // find preorder[0] in postorder  , cut arr at preorder[0] and recurse for left 
    // this may work as there are multiple answers
    // after this is done cur for rest and recurse for right
    // Q is, is this left or right -> recurse for new tree with left node
    

    var root *TreeNode 
    recurse(&root, preorder, postorder)
    return root
    //return nil
}

func recurse(root **TreeNode, preorder []int, postorder []int) {
    if len(preorder) == 0 {
        return
    }

    *root = &TreeNode{
        Val : preorder[0],
    }
    a := preorder[1:]
    b := postorder[:len(postorder)-1]
    if len(a) == 0 {
        return
    }
    newroot := a[0]
    for i, k := range b {
        if k == newroot {
            recurse(&((*root).Left), a[:i+1]  , b[:i+1]) // This is crazy
            recurse(&((*root).Right), a[i+1:]  , b[i+1:])
            return
        }
    }
}
                            {% endraw %}
                            