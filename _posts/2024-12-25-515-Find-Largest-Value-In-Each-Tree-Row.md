---
title: "515 Find Largest Value In Each Tree Row"
date: "2024-12-25T07:57:04+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Find Largest Value in Each Tree Row](https://leetcode.com/problems/find-largest-value-in-each-tree-row) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary tree, return *an array of the largest value in each row* of the tree **(0-indexed)**.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/08/21/largest_e1.jpg)
```

**Input:** root = [1,3,2,5,3,null,9]
**Output:** [1,3,9]

```

Example 2:

```

**Input:** root = [1,2,3]
**Output:** [1,3]

```

 

**Constraints:**

	The number of nodes in the tree will be in the range [0, 104].
	-231 <= Node.val <= 231 - 1

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