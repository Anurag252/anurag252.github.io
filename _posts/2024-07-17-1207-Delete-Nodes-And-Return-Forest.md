---
            title: "1207 Delete Nodes And Return Forest"
            date: "2024-07-17T06:28:16+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Delete Nodes And Return Forest](https://leetcode.com/problems/delete-nodes-and-return-forest) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary tree, each node in the tree has a distinct value.

After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).

Return the roots of the trees in the remaining forest. You may return the result in any order.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2019/07/01/screen-shot-2019-07-01-at-53836-pm.png)
```

**Input:** root = [1,2,3,4,5,6,7], to_delete = [3,5]
**Output:** [[1,2,null,4],[6],[7]]

```

Example 2:

```

**Input:** root = [1,2,4,null,3], to_delete = [3]
**Output:** [[1,2,4]]

```

 

**Constraints:**

	The number of nodes in the given tree is at most 1000.
	Each node has a distinct value between 1 and 1000.
	to_delete.length <= 1000
	to_delete contains distinct values between 1 and 1000.

{% raw %}
```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def delNodes(self, root: Optional[TreeNode], to_delete: List[int]) -> List[TreeNode]:
        result = []
        parent = []
        def dfs(root, to_delete, start):
            if root == None:
                return
            if start and root.val not in to_delete:
                result.append(root)
            if root.val in to_delete:
                dfs(root.left, to_delete,True)
                dfs(root.right, to_delete,True)
                parent.append(root)
            else:
                dfs(root.left, to_delete,False)
                dfs(root.right, to_delete,False)
            if root.left in parent:
                root.left = None
            if root.right in parent:
                root.right = None
        
        dfs(root, to_delete, False)
        if root not in parent:
            result.append(root)
        return result
        
        
{% endraw %}
