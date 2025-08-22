---
title: "105 Construct Binary Tree From Preorder And Inorder Traversal"
date: "2024-05-20T13:20:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return *the binary tree*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```

**Input:** preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
**Output:** [3,9,20,null,null,15,7]

```

Example 2:

```

**Input:** preorder = [-1], inorder = [-1]
**Output:** [-1]

```

 

**Constraints:**

	1 <= preorder.length <= 3000
	inorder.length == preorder.length
	-3000 <= preorder[i], inorder[i] <= 3000
	preorder and inorder consist of **unique** values.
	Each value of inorder also appears in preorder.
	preorder is **guaranteed** to be the preorder traversal of the tree.
	inorder is **guaranteed** to be the inorder traversal of the tree.

                            {% raw %}
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
        
                            {% endraw %}
                            