---
title: "Serialize And Deserialize Bst"
date: "2024-05-19T12:50:42+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 198 ms (5.18%) | Memory: 26.9 MB (9.36%) - LeetSync"
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