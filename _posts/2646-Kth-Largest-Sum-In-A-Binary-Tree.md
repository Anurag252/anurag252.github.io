---
title: "2646 Kth Largest Sum In A Binary Tree"
date: "2024-10-22T08:17:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Kth Largest Sum in a Binary Tree](https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given the root of a binary tree and a positive integer k.
  
  The **level sum** in the tree is the sum of the values of the nodes that are on the **same** level.
  
  Return* the *kth* **largest** level sum in the tree (not necessarily distinct)*. If there are fewer than k levels in the tree, return -1.
  
  **Note** that two nodes are on the same level if they have the same distance from the root.
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2022/12/14/binaryytreeedrawio-2.png)
  ```
  
  **Input:** root = [5,8,9,2,1,3,7,4,6], k = 2
  **Output:** 13
  **Explanation:** The level sums are the following:
  - Level 1: 5.
  - Level 2: 8 + 9 = 17.
  - Level 3: 2 + 1 + 3 + 7 = 13.
  - Level 4: 4 + 6 = 10.
  The 2nd largest level sum is 13.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2022/12/14/treedrawio-3.png)
  ```
  
  **Input:** root = [1,2,null,3], k = 1
  **Output:** 3
  **Explanation:** The largest level sum is 3.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	The number of nodes in the tree is n.
  	2 &lt;= n &lt;= 105
  	1 &lt;= Node.val &lt;= 106
  	1 &lt;= k &lt;= n
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthLargestLevelSum(self, root: Optional[TreeNode], k: int) -> int:

        ls = []

        q = [root]
        def traverse(q):
            if len(q) == 0:
                return 0
            temp = []
            s = 0
            while(len(q) > 0):
                t =  q.pop()
                s += t.val
                if t.left != None:
                    temp.append(t.left)

                if t.right != None:
                    temp.append(t.right)

            q = temp
            ls.append(s)
            traverse(q)
        
        traverse(q)
        ls.sort(reverse=True)
        #print(ls)
        return ls[k-1] if k-1 >= 0 and k-1 < len(ls) else -1
        




        
```