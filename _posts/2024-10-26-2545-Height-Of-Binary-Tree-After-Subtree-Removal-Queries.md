---
            title: "2545 Height Of Binary Tree After Subtree Removal Queries"
            date: "2024-10-26T03:53:39+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Height of Binary Tree After Subtree Removal Queries](https://leetcode.com/problems/height-of-binary-tree-after-subtree-removal-queries) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given the root of a **binary tree** with n nodes. Each node is assigned a unique value from 1 to n. You are also given an array queries of size m.

You have to perform m **independent** queries on the tree where in the ith query you do the following:

	**Remove** the subtree rooted at the node with the value queries[i] from the tree. It is **guaranteed** that queries[i] will **not** be equal to the value of the root.

Return *an array *answer* of size *m* where *answer[i]* is the height of the tree after performing the *ith* query*.

**Note**:

	The queries are independent, so the tree returns to its **initial** state after each query.
	The height of a tree is the **number of edges in the longest simple path** from the root to some node in the tree.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2022/09/07/binaryytreeedrawio-1.png)
```

**Input:** root = [1,3,4,2,null,6,5,null,null,null,null,null,7], queries = [4]
**Output:** [2]
**Explanation:** The diagram above shows the tree after removing the subtree rooted at node with value 4.
The height of the tree is 2 (The path 1 -> 3 -> 2).

```

Example 2:

![image](https://assets.leetcode.com/uploads/2022/09/07/binaryytreeedrawio-2.png)
```

**Input:** root = [5,8,9,2,1,3,7,4,6], queries = [3,2,4,8]
**Output:** [3,2,3,2]
**Explanation:** We have the following queries:
- Removing the subtree rooted at node with value 3. The height of the tree becomes 3 (The path 5 -> 8 -> 2 -> 4).
- Removing the subtree rooted at node with value 2. The height of the tree becomes 2 (The path 5 -> 8 -> 1).
- Removing the subtree rooted at node with value 4. The height of the tree becomes 3 (The path 5 -> 8 -> 2 -> 6).
- Removing the subtree rooted at node with value 8. The height of the tree becomes 2 (The path 5 -> 9 -> 3).

```

 

**Constraints:**

	The number of nodes in the tree is n.
	2 <= n <= 105
	1 <= Node.val <= n
	All the values in the tree are **unique**.
	m == queries.length
	1 <= m <= min(n, 104)
	1 <= queries[i] <= n
	queries[i] != root.val

            {% raw %}
            ```python
            class Solution:
    def treeQueries(
        self, root: Optional[TreeNode], queries: List[int]
    ) -> List[int]:
        max_height_after_removal = [0] * 100001
        self.current_max_height = 0

        def _traverse_left_to_right(node, current_height):
            if not node:
                return

            # Store the maximum height if this node were removed
            max_height_after_removal[node.val] = self.current_max_height

            # Update the current maximum height
            self.current_max_height = max(
                self.current_max_height, current_height
            )

            # Traverse left subtree first, then right
            _traverse_left_to_right(node.left, current_height + 1)
            _traverse_left_to_right(node.right, current_height + 1)

        def _traverse_right_to_left(node, current_height):
            if not node:
                return

            # Update the maximum height if this node were removed
            max_height_after_removal[node.val] = max(
                max_height_after_removal[node.val], self.current_max_height
            )

            # Update the current maximum height
            self.current_max_height = max(
                current_height, self.current_max_height
            )

            # Traverse right subtree first, then left
            _traverse_right_to_left(node.right, current_height + 1)
            _traverse_right_to_left(node.left, current_height + 1)

        _traverse_left_to_right(root, 0)
        self.current_max_height = 0  # Reset for the second traversal
        _traverse_right_to_left(root, 0)

        # Process queries and build the result list
        return [max_height_after_removal[q] for q in queries]
            {% endraw %}
            