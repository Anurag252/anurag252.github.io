---
title: "N Ary Tree Postorder Traversal"
date: "2024-08-26T07:29:06+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 51 ms (20.28%) | Memory: 18.2 MB (43.75%) - LeetSync"
---

```python
"""
# Definition for a Node.
class Node:
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children
"""

class Solution:
    def __init__(self):
        self.cache = []
    def postorder(self, root: 'Node') -> List[int]:
        if root == None:
            return
        for k in root.children:
            self.postorder(k)
        self.cache.append(root.val)
        return self.cache
        
```