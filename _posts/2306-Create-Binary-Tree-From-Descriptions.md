---
title: "2306 Create Binary Tree From Descriptions"
date: "2024-07-15T06:38:52+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Create Binary Tree From Descriptions](https://leetcode.com/problems/create-binary-tree-from-descriptions) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a 2D integer array descriptions where descriptions[i] = [parenti, childi, isLefti] indicates that parenti is the **parent** of childi in a **binary** tree of **unique** values. Furthermore,
  
  	If isLefti == 1, then childi is the left child of parenti.
  	If isLefti == 0, then childi is the right child of parenti.
  
  Construct the binary tree described by descriptions and return *its **root***.
  
  The test cases will be generated such that the binary tree is **valid**.
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2022/02/09/example1drawio.png)
  ```
  
  **Input:** descriptions = [[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]]
  **Output:** [50,20,80,15,17,19]
  **Explanation:** The root node is the node with value 50 since it has no parent.
  The resulting binary tree is shown in the diagram.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2022/02/09/example2drawio.png)
  ```
  
  **Input:** descriptions = [[1,2,1],[2,3,0],[3,4,1]]
  **Output:** [1,2,null,null,3,4]
  **Explanation:** The root node is the node with value 1 since it has no parent.
  The resulting binary tree is shown in the diagram.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= descriptions.length &lt;= 104
  	descriptions[i].length == 3
  	1 &lt;= parenti, childi &lt;= 105
  	0 &lt;= isLefti &lt;= 1
  	The binary tree described by descriptions is valid.
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