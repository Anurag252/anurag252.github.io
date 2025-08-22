---
title: "Minimum Number Of Operations To Sort A Binary Tree By Level"
date: "2024-12-23T10:02:49+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 412 ms (17.65%) | Memory: 67.1 MB (5.23%) - LeetSync"
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