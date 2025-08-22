---
title: "2217 Step By Step Directions From A Binary Tree Node To Another"
date: "2024-07-16T10:07:07+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Step-By-Step Directions From a Binary Tree Node to Another](https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given the root of a **binary tree** with n nodes. Each node is uniquely assigned a value from 1 to n. You are also given an integer startValue representing the value of the start node s, and a different integer destValue representing the value of the destination node t.

Find the **shortest path** starting from node s and ending at node t. Generate step-by-step directions of such path as a string consisting of only the **uppercase** letters 'L', 'R', and 'U'. Each letter indicates a specific direction:

	'L' means to go from a node to its **left child** node.
	'R' means to go from a node to its **right child** node.
	'U' means to go from a node to its **parent** node.

Return *the step-by-step directions of the **shortest path** from node *s* to node* t.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/11/15/eg1.png)
```

**Input:** root = [5,1,2,3,null,6,4], startValue = 3, destValue = 6
**Output:** "UURL"
**Explanation:** The shortest path is: 3 → 1 → 5 → 2 → 6.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/11/15/eg2.png)
```

**Input:** root = [2,1], startValue = 2, destValue = 1
**Output:** "L"
**Explanation:** The shortest path is: 2 → 1.

```

 

**Constraints:**

	The number of nodes in the tree is n.
	2 <= n <= 105
	1 <= Node.val <= n
	All the values in the tree are **unique**.
	1 <= startValue, destValue <= n
	startValue != destValue

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class TreeN:
     def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
        self.parent = None
        self.visited = False
        
class Solution:
    def getDirections(
        self, root: TreeNode, startValue: int, destValue: int
    ) -> str:
        start_path = []
        dest_path = []

        # Find paths from root to start and destination nodes
        self._find_path(root, startValue, start_path)
        self._find_path(root, destValue, dest_path)

        directions = []
        common_path_length = 0

        # Find the length of the common path
        while (
            common_path_length < len(start_path)
            and common_path_length < len(dest_path)
            and start_path[common_path_length] == dest_path[common_path_length]
        ):
            common_path_length += 1

        # Add "U" for each step to go up from start to common ancestor
        directions.extend("U" * (len(start_path) - common_path_length))

        # Add directions from common ancestor to destination
        directions.extend(dest_path[common_path_length:])

        return "".join(directions)

    def _find_path(self, node: TreeNode, target: int, path: List[str]) -> bool:
        if node is None:
            return False

        if node.val == target:
            return True

        # Try left subtree
        path.append("L")
        if self._find_path(node.left, target, path):
            return True
        path.pop()  # Remove last character

        # Try right subtree
        path.append("R")
        if self._find_path(node.right, target, path):
            return True
        path.pop()  # Remove last character

        return False

        

        
        
```