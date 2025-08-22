---
title: "Recover A Tree From Preorder Traversal"
date: "2025-02-22T19:36:44+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 36 ms (10.00%) | Memory: 18.4 MB (38.53%) - LeetSync"
---

```python
class Solution:
    def __init__(self):
        self.index = 0

    def recoverFromPreorder(self, traversal: str) -> TreeNode:
        return self.helper(traversal, 0)

    def helper(self, traversal, depth):
        if self.index >= len(traversal):
            return None

        dash_count = 0
        while (
            self.index + dash_count < len(traversal)
            and traversal[self.index + dash_count] == "-"
        ):
            dash_count += 1

        # If the number of dashes doesn't match the current depth, return null
        if dash_count != depth:
            return None

        self.index += dash_count

        # Extract the node value
        value = 0
        while self.index < len(traversal) and traversal[self.index].isdigit():
            value = value * 10 + int(traversal[self.index])
            self.index += 1

        # Create the current node
        node = TreeNode(value)

        # Recursively build the left and right subtrees
        node.left = self.helper(traversal, depth + 1)
        node.right = self.helper(traversal, depth + 1)

        return node
```