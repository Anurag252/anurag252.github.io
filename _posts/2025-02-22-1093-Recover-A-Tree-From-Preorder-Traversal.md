---
            title: "1093 Recover A Tree From Preorder Traversal"
            date: "2025-02-22T19:36:44+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Recover a Tree From Preorder Traversal](https://leetcode.com/problems/recover-a-tree-from-preorder-traversal) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

We run a preorder depth-first search (DFS) on the root of a binary tree.

At each node in this traversal, we output D dashes (where D is the depth of this node), then we output the value of this node.  If the depth of a node is D, the depth of its immediate child is D + 1.  The depth of the root node is 0.

If a node has only one child, that child is guaranteed to be **the left child**.

Given the output traversal of this traversal, recover the tree and return *its* root.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2024/09/10/recover_tree_ex1.png)
```

**Input:** traversal = "1-2--3--4-5--6--7"
**Output:** [1,2,5,3,4,6,7]

```

Example 2:

![image](https://assets.leetcode.com/uploads/2024/09/10/recover_tree_ex2.png)
```

**Input:** traversal = "1-2--3---4-5--6---7"
**Output:** [1,2,5,3,null,6,null,4,null,7]

```

Example 3:

![image](https://assets.leetcode.com/uploads/2024/09/10/recover_tree_ex3.png)
```

**Input:** traversal = "1-401--349---90--88"
**Output:** [1,401,null,349,88,90]

```

 

**Constraints:**

	The number of nodes in the original tree is in the range [1, 1000].
	1 <= Node.val <= 109

{% raw %}


```python


class Solution:
    def __init__(self):
        self.index = 0

    def recoverFromPreorder(self, traversal: str) -> TreeNode:
        return self.helper(traversal, 0)

    def helper(self, traversal, depth):
        if self.index >= len(traversal):
            return None

        dash_count = 0
        while (
            self.index + dash_count < len(traversal)
            and traversal[self.index + dash_count] == "-"
        ):
            dash_count += 1

        # If the number of dashes doesn't match the current depth, return null
        if dash_count != depth:
            return None

        self.index += dash_count

        # Extract the node value
        value = 0
        while self.index < len(traversal) and traversal[self.index].isdigit():
            value = value * 10 + int(traversal[self.index])
            self.index += 1

        # Create the current node
        node = TreeNode(value)

        # Recursively build the left and right subtrees
        node.left = self.helper(traversal, depth + 1)
        node.right = self.helper(traversal, depth + 1)

        return node


{% endraw %}
```
