---
            title: "1029 Vertical Order Traversal Of A Binary Tree"
            date: "2024-08-22T07:50:29+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Vertical Order Traversal of a Binary Tree](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given the root of a binary tree, calculate the **vertical order traversal** of the binary tree.

For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).

The **vertical order traversal** of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

Return *the **vertical order traversal** of the binary tree*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/01/29/vtree1.jpg)
```

**Input:** root = [3,9,20,null,null,15,7]
**Output:** [[9],[3,15],[20],[7]]
**Explanation:**
Column -1: Only node 9 is in this column.
Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
Column 1: Only node 20 is in this column.
Column 2: Only node 7 is in this column.
```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/01/29/vtree2.jpg)
```

**Input:** root = [1,2,3,4,5,6,7]
**Output:** [[4],[2],[1,5,6],[3],[7]]
**Explanation:**
Column -2: Only node 4 is in this column.
Column -1: Only node 2 is in this column.
Column 0: Nodes 1, 5, and 6 are in this column.
          1 is at the top, so it comes first.
          5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
Column 1: Only node 3 is in this column.
Column 2: Only node 7 is in this column.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/01/29/vtree3.jpg)
```

**Input:** root = [1,2,3,4,6,5,7]
**Output:** [[4],[2],[1,5,6],[3],[7]]
**Explanation:**
This case is the exact same as example 2, but with nodes 5 and 6 swapped.
Note that the solution remains the same since 5 and 6 are in the same location and should be ordered by their values.

```

 

**Constraints:**

	The number of nodes in the tree is in the range [1, 1000].
	0 <= Node.val <= 1000

{% raw %}
```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def verticalTraversal(self, root: Optional[TreeNode]) -> List[List[int]]:
        map ={ }

        def Traverse(root, row, col):
            if root == None:
                return 
            if col in map:
                map[col].append((root.val, row))
            else:
                map[col] = []
                map[col].append((root.val, row))
            Traverse(root.left, row + 1, col -1)
            Traverse(root.right, row + 1, col +1)
        Traverse(root, 0,0)
        col_min = 0
        col_max = 0
        #print(map)
        for k,_ in map.items():
            col_min = min(col_min, k)
            col_max = max(col_max, k)
        result = [None] * (col_max - col_min + 1)
        #print(result, col_max, col_min)


        for k,v in map.items():
            print(k-col_min)
            if result[k-col_min] == None:
                result[k-col_min] = v
            else:
                result[k-col_min].append(v)
        final = []
        i = 0
        for k in result:
            final.append([])
            k.sort(key= lambda x: (x[1], x[0]))
           
            for v in k:
                final[i].append(v[0])
            i += 1


        
        #print(map, col_min, result)
        return final

        
{% endraw %}
