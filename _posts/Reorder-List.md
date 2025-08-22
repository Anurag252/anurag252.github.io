---
title: "Reorder List"
date: "2024-05-11T10:19:48+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 106 ms (5.01%) | Memory: 25.6 MB (6.95%) - LeetSync"
---

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:


    temp = None


    def reorderList(self, head: Optional[ListNode]) -> None:
        """
        Do not return anything, modify head in-place instead.
        """
        if head.next == None:
            return

        self.temp = head
        result = head
        self.Traverse( head, None)
        head = result
    
    def Traverse(self, head : ListNode, prev : ListNode) :
        if head == None:
            return
        
        self.Traverse( head.next, head)
        

        if head.next == None and prev != self.temp and self.temp != None and self.temp.next != None:
            print(head, prev)
            temp1 = self.temp.next
            self.temp.next = head
            head.next = temp1
            self.temp = temp1
            if prev != None:
                prev.next = None
        
```