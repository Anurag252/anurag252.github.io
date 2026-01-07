---
            title: "1465 Maximum Product Of Splitted Binary Tree"
            date: "2026-01-07T21:45:28+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Product of Splitted Binary Tree](https://leetcode.com/problems/maximum-product-of-splitted-binary-tree) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary tree, split the binary tree into two subtrees by removing one edge such that the product of the sums of the subtrees is maximized.

Return *the maximum product of the sums of the two subtrees*. Since the answer may be too large, return it **modulo** 109 + 7.

**Note** that you need to maximize the answer before taking the mod and not after taking it.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/01/21/sample_1_1699.png)
```

**Input:** root = [1,2,3,4,5,6]
**Output:** 110
**Explanation:** Remove the red edge and get 2 binary trees with sum 11 and 10. Their product is 110 (11*10)

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/01/21/sample_2_1699.png)
```

**Input:** root = [1,null,2,3,4,null,null,5,6]
**Output:** 90
**Explanation:** Remove the red edge and get 2 binary trees with sum 15 and 6.Their product is 90 (15*6)

```

 

**Constraints:**

	The number of nodes in the tree is in the range [2, 5 * 104].
	1 <= Node.val <= 104

{% raw %}


```python


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxProduct(self, root: Optional[TreeNode]) -> int:
        mp = {}

        def recurse(root):
            if not root:
                return 0
            if not root.left and not root.right:
                # leaf node
                mp[root] = root.val
                return root.val
            a = root.val + recurse(root.left) + recurse(root.right)
            mp[root]= a
            return a
        recurse(root)

        mx = {"ans": 0}
        
        def recurse1(root, mx, total):
            if not root:
                return 
            
            left_sum , right_sum = 0, 0
            if root.left:
                left_sum = mp[root.left]

            if root.right:
                right_sum = mp[root.right]
            #print(left_sum, right_sum)
            mx["ans"] = max(mx["ans"], max( (total - right_sum) * right_sum , (total - left_sum) * left_sum) )
            recurse1(root.left, mx, total)
            recurse1(root.right, mx, total)
        recurse1(root, mx, mp[root])
        return (mx["ans"]) % (10 ** 9 + 7)




{% endraw %}
```
