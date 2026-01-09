---
            title: "896 Smallest Subtree With All The Deepest Nodes"
            date: "2026-01-09T21:47:21+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Smallest Subtree with all the Deepest Nodes](https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary tree, the depth of each node is **the shortest distance to the root**.

Return *the smallest subtree* such that it contains **all the deepest nodes** in the original tree.

A node is called **the deepest** if it has the largest depth possible among any node in the entire tree.

The **subtree** of a node is a tree consisting of that node, plus the set of all descendants of that node.

 

Example 1:

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/01/sketch1.png)
```

**Input:** root = [3,5,1,6,2,0,8,null,null,7,4]
**Output:** [2,7,4]
**Explanation:** We return the node with value 2, colored in yellow in the diagram.
The nodes coloured in blue are the deepest nodes of the tree.
Notice that nodes 5, 3 and 2 contain the deepest nodes in the tree but node 2 is the smallest subtree among them, so we return it.

```

Example 2:

```

**Input:** root = [1]
**Output:** [1]
**Explanation:** The root is the deepest node in the tree.

```

Example 3:

```

**Input:** root = [0,1,3,null,2]
**Output:** [2]
**Explanation:** The deepest node in the tree is 2, the valid subtrees are the subtrees of nodes 2, 1 and 0 but the subtree of node 2 is the smallest.

```

 

**Constraints:**

	The number of nodes in the tree will be in the range [1, 500].
	0 <= Node.val <= 500
	The values of the nodes in the tree are **unique**.

 

**Note:** This question is the same as 1123: [https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/](https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/)

{% raw %}


```python


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def subtreeWithAllDeepest(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # lvl ord trav
        # mainntain each levl in array
        # latest lvl with count 1
        r = []
        arr = [root]

        def recurse(arr, r):
            if len(arr) == 0:
                return
            temp = []
            r.append(copy.deepcopy(arr))
            while(arr):
                n = arr.pop()

                if n.left:
                    temp.append(n.left)

                if n.right:
                    temp.append(n.right)

            recurse(temp, r)
        recurse(arr, r)
        #print(r[-1])
        r = r[-1]
        # r has leaf nodes
        ans = {"ans": None}
        def is_valid(root, r, count):
            if root == None:
                return
            #print(root, count)
            if root.val in map(lambda x: x.val, r):
                count["c"] += 1
                return
            is_valid(root.left, r, count) 
            is_valid(root.right, r, count)

            



        def dfs(root, r):
            if not root:
                return 
            count = {"c": 0}
            is_valid(root, r , count)
            #print(count, r)
            if count["c"] == len(r):

                ans["ans"] = root
            dfs(root.left, r)
            dfs(root.right, r) # only one of these will be correct , 
            # if both are true that means parent is the ans

        dfs(root, r)
        return ans["ans"]
        


{% endraw %}
```
