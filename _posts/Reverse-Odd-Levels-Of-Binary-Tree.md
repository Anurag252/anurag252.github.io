---
title: "Reverse Odd Levels Of Binary Tree"
date: "2024-12-20T08:40:07+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 60 ms (13.54%) | Memory: 23 MB (5.08%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def reverseOddLevels(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        


        def traverse(q, is_odd):
                temp = []
                while(q):
                        item = q.pop(0)
                        if item.right:
                            temp.append(item.right)
                        if item.left:
                            temp.append(item.left)
                if is_odd:
                    for idx, k in enumerate(temp):
                        temp[idx].val,temp[len(temp) - 1- idx].val = temp[len(temp) - 1- idx].val,temp[idx].val
                        if idx == (len(temp) -1) // 2:
                            break

                if temp:
                    traverse(temp, not is_odd)
        traverse([root], True)
        return root
           
```