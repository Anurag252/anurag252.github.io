---
title: "./925 Construct Binary Tree From Preorder And Postorder Traversal"
date: "2025-02-23T09:54:29+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal">Construct Binary Tree from Preorder and Postorder Traversal</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given two integer arrays, <code>preorder</code> and <code>postorder</code> where <code>preorder</code> is the preorder traversal of a binary tree of <strong>distinct</strong> values and <code>postorder</code> is the postorder traversal of the same tree, reconstruct and return <em>the binary tree</em>.</p>

<p>If there exist multiple answers, you can <strong>return any</strong> of them.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/07/24/lc-prepost.jpg" style="width: 304px; height: 265px;" />
<pre>
<strong>Input:</strong> preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]
<strong>Output:</strong> [1,2,3,4,5,6,7]
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> preorder = [1], postorder = [1]
<strong>Output:</strong> [1]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= preorder.length &lt;= 30</code></li>
	<li><code>1 &lt;= preorder[i] &lt;= preorder.length</code></li>
	<li>All the values of <code>preorder</code> are <strong>unique</strong>.</li>
	<li><code>postorder.length == preorder.length</code></li>
	<li><code>1 &lt;= postorder[i] &lt;= postorder.length</code></li>
	<li>All the values of <code>postorder</code> are <strong>unique</strong>.</li>
	<li>It is guaranteed that <code>preorder</code> and <code>postorder</code> are the preorder traversal and postorder traversal of the same binary tree.</li>
</ul>"
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