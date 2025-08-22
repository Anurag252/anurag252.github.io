---
title: "Delete Nodes And Return Forest"
date: "2024-07-17T06:28:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 68 ms (9.44%) | Memory: 17.1 MB (24.30%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def delNodes(self, root: Optional[TreeNode], to_delete: List[int]) -> List[TreeNode]:
        result = []
        parent = []
        def dfs(root, to_delete, start):
            if root == None:
                return
            if start and root.val not in to_delete:
                result.append(root)
            if root.val in to_delete:
                dfs(root.left, to_delete,True)
                dfs(root.right, to_delete,True)
                parent.append(root)
            else:
                dfs(root.left, to_delete,False)
                dfs(root.right, to_delete,False)
            if root.left in parent:
                root.left = None
            if root.right in parent:
                root.right = None
        
        dfs(root, to_delete, False)
        if root not in parent:
            result.append(root)
        return result
        
        
```