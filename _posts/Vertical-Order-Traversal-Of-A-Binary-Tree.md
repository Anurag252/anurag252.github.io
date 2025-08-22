---
title: "Vertical Order Traversal Of A Binary Tree"
date: "2024-08-22T07:50:29+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 41 ms (27.10%) | Memory: 16.8 MB (20.35%) - LeetSync"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def verticalTraversal(self, root: Optional[TreeNode]) -> List[List[int]]:
        map ={ }

        def Traverse(root, row, col):
            if root == None:
                return 
            if col in map:
                map[col].append((root.val, row))
            else:
                map[col] = []
                map[col].append((root.val, row))
            Traverse(root.left, row + 1, col -1)
            Traverse(root.right, row + 1, col +1)
        Traverse(root, 0,0)
        col_min = 0
        col_max = 0
        #print(map)
        for k,_ in map.items():
            col_min = min(col_min, k)
            col_max = max(col_max, k)
        result = [None] * (col_max - col_min + 1)
        #print(result, col_max, col_min)


        for k,v in map.items():
            print(k-col_min)
            if result[k-col_min] == None:
                result[k-col_min] = v
            else:
                result[k-col_min].append(v)
        final = []
        i = 0
        for k in result:
            final.append([])
            k.sort(key= lambda x: (x[1], x[0]))
           
            for v in k:
                final[i].append(v[0])
            i += 1


        
        #print(map, col_min, result)
        return final

        
```