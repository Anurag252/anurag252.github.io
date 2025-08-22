---
title: "./2306 Create Binary Tree From Descriptions"
date: "2024-07-15T06:38:52+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/create-binary-tree-from-descriptions">Create Binary Tree From Descriptions</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a 2D integer array <code>descriptions</code> where <code>descriptions[i] = [parent<sub>i</sub>, child<sub>i</sub>, isLeft<sub>i</sub>]</code> indicates that <code>parent<sub>i</sub></code> is the <strong>parent</strong> of <code>child<sub>i</sub></code> in a <strong>binary</strong> tree of <strong>unique</strong> values. Furthermore,</p>

<ul>
	<li>If <code>isLeft<sub>i</sub> == 1</code>, then <code>child<sub>i</sub></code> is the left child of <code>parent<sub>i</sub></code>.</li>
	<li>If <code>isLeft<sub>i</sub> == 0</code>, then <code>child<sub>i</sub></code> is the right child of <code>parent<sub>i</sub></code>.</li>
</ul>

<p>Construct the binary tree described by <code>descriptions</code> and return <em>its <strong>root</strong></em>.</p>

<p>The test cases will be generated such that the binary tree is <strong>valid</strong>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2022/02/09/example1drawio.png" style="width: 300px; height: 236px;" />
<pre>
<strong>Input:</strong> descriptions = [[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]]
<strong>Output:</strong> [50,20,80,15,17,19]
<strong>Explanation:</strong> The root node is the node with value 50 since it has no parent.
The resulting binary tree is shown in the diagram.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2022/02/09/example2drawio.png" style="width: 131px; height: 300px;" />
<pre>
<strong>Input:</strong> descriptions = [[1,2,1],[2,3,0],[3,4,1]]
<strong>Output:</strong> [1,2,null,null,3,4]
<strong>Explanation:</strong> The root node is the node with value 1 since it has no parent.
The resulting binary tree is shown in the diagram.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= descriptions.length &lt;= 10<sup>4</sup></code></li>
	<li><code>descriptions[i].length == 3</code></li>
	<li><code>1 &lt;= parent<sub>i</sub>, child<sub>i</sub> &lt;= 10<sup>5</sup></code></li>
	<li><code>0 &lt;= isLeft<sub>i</sub> &lt;= 1</code></li>
	<li>The binary tree described by <code>descriptions</code> is valid.</li>
</ul>"
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def createBinaryTree(self, descriptions: List[List[int]]) -> Optional[TreeNode]:
        dic={}
        root = {}
        r = 0
        for k in descriptions:
            if k[0] not in root:
                root[k[0]] = 0
            
            if k[1] in root:
                root[k[1]]  = root[k[1]] + 1
            else:
                root[k[1]]  =  1

            if k[0] in dic:
                
                dic[k[0]].append((k[1], k[2]))
            else:
                dic[k[0]] = [(k[1], k[2])]

        for k in root:
            if root[k] == 0:
                r = k
                break

       
        def recurse(elem) -> Optional[TreeNode]:
            
            t = TreeNode(elem)
            if elem not in dic:
                return t
            if len(dic[elem]) >= 1:
                if dic[elem][0][1] == 1:
                    t.left = recurse(dic[elem][0][0])
                else:
                    t.right = recurse(dic[elem][0][0])

            if len(dic[elem]) == 2:
                if dic[elem][1][1] == 1:
                    t.left = recurse(dic[elem][1][0])
                else:
                    t.right = recurse(dic[elem][1][0])
            return t
        return recurse(r)

        
```