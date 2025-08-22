---
title: "./2646 Kth Largest Sum In A Binary Tree"
date: "2024-10-22T08:17:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree">Kth Largest Sum in a Binary Tree</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given the <code>root</code> of a binary tree and a positive integer <code>k</code>.</p>

<p>The <strong>level sum</strong> in the tree is the sum of the values of the nodes that are on the <strong>same</strong> level.</p>

<p>Return<em> the </em><code>k<sup>th</sup></code><em> <strong>largest</strong> level sum in the tree (not necessarily distinct)</em>. If there are fewer than <code>k</code> levels in the tree, return <code>-1</code>.</p>

<p><strong>Note</strong> that two nodes are on the same level if they have the same distance from the root.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2022/12/14/binaryytreeedrawio-2.png" style="width: 301px; height: 284px;" />
<pre>
<strong>Input:</strong> root = [5,8,9,2,1,3,7,4,6], k = 2
<strong>Output:</strong> 13
<strong>Explanation:</strong> The level sums are the following:
- Level 1: 5.
- Level 2: 8 + 9 = 17.
- Level 3: 2 + 1 + 3 + 7 = 13.
- Level 4: 4 + 6 = 10.
The 2<sup>nd</sup> largest level sum is 13.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2022/12/14/treedrawio-3.png" style="width: 181px; height: 181px;" />
<pre>
<strong>Input:</strong> root = [1,2,null,3], k = 1
<strong>Output:</strong> 3
<strong>Explanation:</strong> The largest level sum is 3.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li>The number of nodes in the tree is <code>n</code>.</li>
	<li><code>2 &lt;= n &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= Node.val &lt;= 10<sup>6</sup></code></li>
	<li><code>1 &lt;= k &lt;= n</code></li>
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
    def kthLargestLevelSum(self, root: Optional[TreeNode], k: int) -> int:

        ls = []

        q = [root]
        def traverse(q):
            if len(q) == 0:
                return 0
            temp = []
            s = 0
            while(len(q) > 0):
                t =  q.pop()
                s += t.val
                if t.left != None:
                    temp.append(t.left)

                if t.right != None:
                    temp.append(t.right)

            q = temp
            ls.append(s)
            traverse(q)
        
        traverse(q)
        ls.sort(reverse=True)
        #print(ls)
        return ls[k-1] if k-1 >= 0 and k-1 < len(ls) else -1
        




        
```