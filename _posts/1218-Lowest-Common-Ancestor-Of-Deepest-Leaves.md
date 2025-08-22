---
title: "./1218 Lowest Common Ancestor Of Deepest Leaves"
date: "2025-04-04T19:11:16+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves">Lowest Common Ancestor of Deepest Leaves</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given the <code>root</code> of a binary tree, return <em>the lowest common ancestor of its deepest leaves</em>.</p>

<p>Recall that:</p>

<ul>
	<li>The node of a binary tree is a leaf if and only if it has no children</li>
	<li>The depth of the root of the tree is <code>0</code>. if the depth of a node is <code>d</code>, the depth of each of its children is <code>d + 1</code>.</li>
	<li>The lowest common ancestor of a set <code>S</code> of nodes, is the node <code>A</code> with the largest depth such that every node in <code>S</code> is in the subtree with root <code>A</code>.</li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/01/sketch1.png" style="width: 600px; height: 510px;" />
<pre>
<strong>Input:</strong> root = [3,5,1,6,2,0,8,null,null,7,4]
<strong>Output:</strong> [2,7,4]
<strong>Explanation:</strong> We return the node with value 2, colored in yellow in the diagram.
The nodes coloured in blue are the deepest leaf-nodes of the tree.
Note that nodes 6, 0, and 8 are also leaf nodes, but the depth of them is 2, but the depth of nodes 7 and 4 is 3.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> root = [1]
<strong>Output:</strong> [1]
<strong>Explanation:</strong> The root is the deepest node in the tree, and it&#39;s the lca of itself.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> root = [0,1,3,null,2]
<strong>Output:</strong> [2]
<strong>Explanation:</strong> The deepest leaf node in the tree is 2, the lca of one node is itself.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li>The number of nodes in the tree will be in the range <code>[1, 1000]</code>.</li>
	<li><code>0 &lt;= Node.val &lt;= 1000</code></li>
	<li>The values of the nodes in the tree are <strong>unique</strong>.</li>
</ul>

<p>&nbsp;</p>
<p><strong>Note:</strong> This question is the same as 865: <a href="https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/" target="_blank">https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/</a></p>"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def lcaDeepestLeaves(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # Step 1: Level-order traversal to get the deepest level nodes
        lvl = [root]

        def test(lvl):
            temp = []
            prev = []
            while lvl:
                r = lvl.pop()
                prev.append(r)
                if r.left is not None:
                    temp.append(r.left)
                if r.right is not None:
                    temp.append(r.right)
            if temp:
                return test(temp)
            else:
                return prev

        prev = test(lvl)  # deepest leaves
        prev_set = set(prev)  # for faster lookup
        total = len(prev_set)
        res = None

        # Step 2: DFS to find LCA of deepest leaves
        def dfs(node):
            nonlocal res
            if node is None:
                return 0
            left = dfs(node.left)
            right = dfs(node.right)
            self_count = 1 if node in prev_set else 0
            count = left + right + self_count
            if count == total and res is None:
                res = node
            return count

        dfs(root)
        return res

```