---
title: "2558 Minimum Number Of Operations To Sort A Binary Tree By Level"
date: "2024-12-23T10:02:49+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Minimum Number of Operations to Sort a Binary Tree by Level](https://leetcode.com/problems/minimum-number-of-operations-to-sort-a-binary-tree-by-level) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given the root of a binary tree with **unique values**.
  
  In one operation, you can choose any two nodes **at the same level** and swap their values.
  
  Return *the minimum number of operations needed to make the values at each level sorted in a **strictly increasing order***.
  
  The **level** of a node is the number of edges along the path between it and the root node*.*
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2022/09/18/image-20220918174006-2.png)
  ```
  
  **Input:** root = [1,4,3,7,6,8,5,null,null,null,null,9,null,10]
  **Output:** 3
  **Explanation:**
  - Swap 4 and 3. The 2nd level becomes [3,4].
  - Swap 7 and 5. The 3rd level becomes [5,6,8,7].
  - Swap 8 and 7. The 3rd level becomes [5,6,7,8].
  We used 3 operations so return 3.
  It can be proven that 3 is the minimum number of operations needed.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2022/09/18/image-20220918174026-3.png)
  ```
  
  **Input:** root = [1,3,2,7,6,5,4]
  **Output:** 3
  **Explanation:**
  - Swap 3 and 2. The 2nd level becomes [2,3].
  - Swap 7 and 4. The 3rd level becomes [4,6,5,7].
  - Swap 6 and 5. The 3rd level becomes [4,5,6,7].
  We used 3 operations so return 3.
  It can be proven that 3 is the minimum number of operations needed.
  
  ```
  
  Example 3:
  
  ![image](https://assets.leetcode.com/uploads/2022/09/18/image-20220918174052-4.png)
  ```
  
  **Input:** root = [1,2,3,4,5,6]
  **Output:** 0
  **Explanation:** Each level is already sorted in increasing order so return 0.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	The number of nodes in the tree is in the range [1, 105].
  	1 &lt;= Node.val &lt;= 105
  	All the values of the tree are **unique**.
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minimumOperations(self, root: Optional[TreeNode]) -> int:
        """
        10,15,30,45
        15,45,30,10

        1-0,2-1,3,4,5,6,7-6
        1-0,7-1,5,3,6,4,2-6 1 + 1 + 1 + 1
        """

        def recurse(q):
            freq = {}
            
            
            sorted_q = sorted(list(map(lambda x: x.val , q)))
            
            # Create a mapping of node values to their original indices
            freq = {node.val: idx for idx, node in enumerate(q)}
            count = 0
            idx = 0
            idx = 0
            count = 0
            #print(sorted_q, freq)
            while(idx < len(q)):
                if sorted_q[idx] != q[idx].val:
                    a = sorted_q[idx]
                    b = q[idx].val
                    correct_index = freq[sorted_q[idx]]
                    q[idx].val, q[correct_index].val = q[correct_index].val, q[idx].val
                    freq[a], freq[b] = freq[b],freq[a]
                    count += 1
                    #print(list(map(lambda x:x.val, q)), sorted_q)
                idx += 1
            #print(freq, count)

            # 7,6,8,5 -> 5,6,7,8
            # 5 != 7
            # index of 5 in priginal arr 
            # swap 5 and 7 in original arr
            # swap index of 5 and 7 

            temp = []

            while(q):
                item = q.pop(0)

                if item.left:
                    temp.append(item.left)
                if item.right:
                    temp.append(item.right)
            return count + recurse(temp) if temp else count
        return recurse([root])



        
```