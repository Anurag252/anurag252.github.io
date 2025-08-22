---
title: "449 Serialize And Deserialize Bst"
date: "2024-05-19T12:50:42+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Serialize and Deserialize BST](https://leetcode.com/problems/serialize-and-deserialize-bst) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Serialization is converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
  
  Design an algorithm to serialize and deserialize a **binary search tree**. There is no restriction on how your serialization/deserialization algorithm should work. You need to ensure that a binary search tree can be serialized to a string, and this string can be deserialized to the original tree structure.
  
  **The encoded string should be as compact as possible.**
  
  &nbsp;
  
  Example 1:
  
  ```
  **Input:** root = [2,1,3]
  **Output:** [2,1,3]
  
  ```
  
  Example 2:
  
  ```
  **Input:** root = []
  **Output:** []
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	The number of nodes in the tree is in the range [0, 104].
  	0 &lt;= Node.val &lt;= 104
  	The input tree is **guaranteed** to be a binary search tree.
---

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Codec:
    #l = 2*i + 1
    #r = 2*i + 2
    def __init__(self):
        self.inord = ""
        self.preord = ""

    def preorder(self, root: [TreeNode]) -> str:
        if root != None and root.left == None and root.right == None:
            return  str(root.val)
        if root == None:
            return ""
        
        m = str(root.val)
        l = self.preorder(root.left)
        r = self.preorder(root.right)
        return ",".join(filter(None,[m,l,r]))
        

    def inorder(self, root: [TreeNode]) -> str:
        if root != None and root.left == None and root.right == None:
            return  str(root.val)
        if root == None:
            return ""
        
        l = self.inorder(root.left)
        m = str(root.val)
        r = self.inorder(root.right)
        
        return ",".join(filter(None,[l,m,r]))

        

    def serialize(self, root: Optional[TreeNode]) -> str:
        """Encodes a tree to a single string.
        """
        self.inord= self.inorder(root)
        self.preord = self.preorder(root)
        return self.inord + "#" + self.preord
        
        
        


    def deserialize(self, data: str, index : int = 0) -> Optional[TreeNode]:
        """Decodes your encoded data to tree.
        """
        #print(data)
        arr = data.split("#")

        inorder = arr[0]
        preorder = arr[1]
        return self.build_tree(inorder, preorder)
       
    def build_tree(self, inorder: str, preorder: str) -> TreeNode:
        if len(inorder) == 0 and len(preorder) == 0:
            return None
        inord = inorder.split(',')
        preord = preorder.split(',')
        root = TreeNode(preord[0])
        left_inorder = filter(lambda a: int(a) < int(preord[0]), inord)
        right_inorder = filter(lambda a: int(a) > int(preord[0]), inord)

        left_preorder = filter(lambda a: int(a) < int(preord[0]), preord)
        right_preorder = filter(lambda a: int(a) > int(preord[0]), preord)

        #print(left_inorder, right_inorder, left_preorder, right_preorder)

        root.left = self.build_tree(",".join(filter(None,left_inorder)), ",".join(filter(None, left_preorder)))
        root.right = self.build_tree(",".join(filter(None, right_inorder)), ",".join(filter(None, right_preorder)))
        return root
        

    
        
    
        

# Your Codec object will be instantiated and called as such:
# Your Codec object will be instantiated and called as such:
# ser = Codec()
# deser = Codec()
# tree = ser.serialize(root)
# ans = deser.deserialize(tree)
# return ans
```