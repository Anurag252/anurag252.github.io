---
title: "Lowest Common Ancestor Of Deepest Leaves"
date: "2025-04-04T19:11:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 2 ms (62.96%) | Memory: 18.3 MB (45.35%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def lcaDeepestLeaves(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # Step 1: Level-order traversal to get the deepest level nodes
        lvl = [root]

        def test(lvl):
            temp = []
            prev = []
            while lvl:
                r = lvl.pop()
                prev.append(r)
                if r.left is not None:
                    temp.append(r.left)
                if r.right is not None:
                    temp.append(r.right)
            if temp:
                return test(temp)
            else:
                return prev

        prev = test(lvl)  # deepest leaves
        prev_set = set(prev)  # for faster lookup
        total = len(prev_set)
        res = None

        # Step 2: DFS to find LCA of deepest leaves
        def dfs(node):
            nonlocal res
            if node is None:
                return 0
            left = dfs(node.left)
            right = dfs(node.right)
            self_count = 1 if node in prev_set else 0
            count = left + right + self_count
            if count == total and res is None:
                res = node
            return count

        dfs(root)
        return res

```