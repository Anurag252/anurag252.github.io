---
title: "Construct Binary Tree From Preorder And Postorder Traversal"
date: "2025-02-23T09:54:29+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 2 ms (7.14%) | Memory: 5.1 MB (25.00%) - LeetSync"
---

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
```