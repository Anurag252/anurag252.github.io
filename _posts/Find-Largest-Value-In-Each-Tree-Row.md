---
title: "Find Largest Value In Each Tree Row"
date: "2024-12-25T07:57:04+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3 ms (48.85%) | Memory: 19.7 MB (9.99%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def largestValues(self, root: Optional[TreeNode]) -> List[int]:
        
        res =[]
        INF = - 2 ** 32

        def recurse(q, res):
            temp = []
            mx = INF
            while(q):
                item = q.pop(0)
                mx = max(mx, item.val)
                if item.left:
                    temp.append(item.left)

                if item.right:
                    temp.append(item.right)
            if mx != INF:
                res.append(mx)
            if temp:
                recurse(temp, res)
        if root != None:
            recurse([root], res)
        return res
```