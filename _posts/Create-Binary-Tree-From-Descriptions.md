---
title: "Create Binary Tree From Descriptions"
date: "2024-07-15T06:38:52+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1693 ms (14.48%) | Memory: 28.8 MB (8.75%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def createBinaryTree(self, descriptions: List[List[int]]) -> Optional[TreeNode]:
        dic={}
        root = {}
        r = 0
        for k in descriptions:
            if k[0] not in root:
                root[k[0]] = 0
            
            if k[1] in root:
                root[k[1]]  = root[k[1]] + 1
            else:
                root[k[1]]  =  1

            if k[0] in dic:
                
                dic[k[0]].append((k[1], k[2]))
            else:
                dic[k[0]] = [(k[1], k[2])]

        for k in root:
            if root[k] == 0:
                r = k
                break

       
        def recurse(elem) -> Optional[TreeNode]:
            
            t = TreeNode(elem)
            if elem not in dic:
                return t
            if len(dic[elem]) >= 1:
                if dic[elem][0][1] == 1:
                    t.left = recurse(dic[elem][0][0])
                else:
                    t.right = recurse(dic[elem][0][0])

            if len(dic[elem]) == 2:
                if dic[elem][1][1] == 1:
                    t.left = recurse(dic[elem][1][0])
                else:
                    t.right = recurse(dic[elem][1][0])
            return t
        return recurse(r)

        
```