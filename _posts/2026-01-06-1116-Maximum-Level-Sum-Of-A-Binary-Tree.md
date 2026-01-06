---
            title: "1116 Maximum Level Sum Of A Binary Tree"
            date: "2026-01-06T23:17:32+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Level Sum of a Binary Tree](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.

Return the **smallest** level x such that the sum of all the values of nodes at level x is **maximal**.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2019/05/03/capture.JPG)
```

**Input:** root = [1,7,0,7,-8,null,null]
**Output:** 2
**Explanation: **
Level 1 sum = 1.
Level 2 sum = 7 + 0 = 7.
Level 3 sum = 7 + -8 = -1.
So we return the level with the maximum sum which is level 2.

```

Example 2:

```

**Input:** root = [989,null,10250,98693,-89388,null,null,null,-32127]
**Output:** 2

```

 

**Constraints:**

	The number of nodes in the tree is in the range [1, 104].
	-105 <= Node.val <= 105

{% raw %}


```python


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        
        arr = [root]
        mx_sum = -100000
        mx_lvl = {"ans": 0}

        def recurse(arr, lvl, mx_sum, mx_lvl):

            if len(arr) == 0 :
                return
            curr_sum = 0
            curr_lvl = 0
            temp = []
            while(arr):
                node = arr.pop()
                if node.left:
                    temp.append(node.left)
                if node.right:
                    temp.append(node.right)
                curr_sum += node.val
            #print(curr_sum, mx_sum, lvl, mx_lvl)
            if curr_sum > mx_sum:
                mx_lvl["ans"] = lvl
                mx_sum = curr_sum
            recurse(temp, lvl + 1, mx_sum, mx_lvl)

        recurse(arr, 1, mx_sum, mx_lvl)
        return mx_lvl["ans"]
        
                



{% endraw %}
```
