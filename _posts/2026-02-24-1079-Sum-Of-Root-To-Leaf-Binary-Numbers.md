---
            title: "1079 Sum Of Root To Leaf Binary Numbers"
            date: "2026-02-24T20:46:37+01:00"
            categories: ["leetcode"]
            tags: [csharp]
            layout: post
---
            
## [Sum of Root To Leaf Binary Numbers](https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given the root of a binary tree where each node has a value 0 or 1. Each root-to-leaf path represents a binary number starting with the most significant bit.

	For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.

For all leaves in the tree, consider the numbers represented by the path from the root to that leaf. Return *the sum of these numbers*.

The test cases are generated so that the answer fits in a **32-bits** integer.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2019/04/04/sum-of-root-to-leaf-binary-numbers.png)
```

**Input:** root = [1,0,1,0,1,0,1]
**Output:** 22
**Explanation: **(100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22

```

Example 2:

```

**Input:** root = [0]
**Output:** 0

```

 

**Constraints:**

	The number of nodes in the tree is in the range [1, 1000].
	Node.val is 0 or 1.

{% raw %}


```csharp


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    int sum = 0 ;
    public int SumRootToLeaf(TreeNode root) {
        string s = "";
        Calc(root ,s);
        return sum ;
    }
    
    public void Calc(TreeNode root , string s)
    {       
        if(root == null)
        {
            return ;
        }
        if( root.left == null && root.right == null)
        {
            
            Console.WriteLine(s);
            sum = sum + Convert.ToInt32(s + root.val , 2);
            return ;
        }
        Calc(root.left , s + root.val);
        
        Calc(root.right , s + root.val);
    }
}


{% endraw %}
```
