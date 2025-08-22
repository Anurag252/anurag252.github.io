---
title: "Binary Tree Postorder Traversal"
date: "2024-08-25T20:20:14+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 41 ms (15.76%) | Memory: 16.5 MB (20.02%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def __init__(self):
        self.cache = []
    def postorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        if root == None:
            return
        
        self.postorderTraversal(root.left)
        self.postorderTraversal(root.right)
        self.cache.append(root.val)
        return self.cache

        
```