---
title: "Construct Binary Tree From Preorder And Inorder Traversal"
date: "2024-05-20T13:20:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 147 ms (17.03%) | Memory: 88.6 MB (7.36%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        
        if len(inorder) == 0 and len(preorder) == 0:
            return None
        
        root = TreeNode(preorder[0])
        inorder_index = 0

        inorder_index = inorder.index(preorder[0])

        left_inorder = inorder[:inorder_index]
        right_inorder = inorder[inorder_index+1:]
       
        left_preorder = preorder[1:inorder_index+1]
        right_preorder = preorder[inorder_index+1:]
        
        root.left = self.buildTree( left_preorder, left_inorder)
        root.right = self.buildTree(right_preorder, right_inorder)
        return root
        
```