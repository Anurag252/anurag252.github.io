---
title: "All Oone Data Structure"
date: "2024-09-29T08:05:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 148 ms (79.52%) | Memory: 32.5 MB (36.69%) - LeetSync"
---

```python
class Node:
    def __init__(self, count=0):
        self.next = None
        self.prev = None
        self.elem = set()
        self.count = count

class DLL:
    def __init__(self):
        self.head = Node()  # Sentinel head with count 0
        self.tail = Node()  # Sentinel tail with count infinity
        self.head.next = self.tail
        self.tail.prev = self.head

    def insert_after(self, node, new_node):
        """Insert new_node after the given node"""
        new_node.prev = node
        new_node.next = node.next
        node.next.prev = new_node
        node.next = new_node

    def remove(self, node):
        """Remove the node from the list"""
        node.prev.next = node.next
        node.next.prev = node.prev

    def is_empty(self, node):
        """Check if the node has no elements"""
        return len(node.elem) == 0


class AllOne:

    def __init__(self):
        self.hash = {}  # Key to node mapping
        self.dll = DLL()  # Doubly linked list to track counts
        
    def inc(self, key: str) -> None:
        if key in self.hash:
            node = self.hash[key]
            node.elem.remove(key)

            # Move to the next node (count + 1)
            if node.next.count == node.count + 1:
                node.next.elem.add(key)
                self.hash[key] = node.next
            else:
                # Create a new node with count + 1
                new_node = Node(node.count + 1)
                new_node.elem.add(key)
                self.dll.insert_after(node, new_node)
                self.hash[key] = new_node
            
            # Remove the node if it's empty
            if self.dll.is_empty(node):
                self.dll.remove(node)
        else:
            # Insert the key with count 1 in the node after head
            if self.dll.head.next.count == 1:
                self.dll.head.next.elem.add(key)
                self.hash[key] = self.dll.head.next
            else:
                new_node = Node(1)
                new_node.elem.add(key)
                self.dll.insert_after(self.dll.head, new_node)
                self.hash[key] = new_node

    def dec(self, key: str) -> None:
        if key not in self.hash:
            return
        
        node = self.hash[key]
        node.elem.remove(key)

        if node.count > 1:
            # Move to the previous node (count - 1)
            if node.prev.count == node.count - 1:
                node.prev.elem.add(key)
                self.hash[key] = node.prev
            else:
                # Create a new node with count - 1
                new_node = Node(node.count - 1)
                new_node.elem.add(key)
                self.dll.insert_after(node.prev, new_node)
                self.hash[key] = new_node
        else:
            # If count becomes 0, remove the key from hash
            del self.hash[key]

        # Remove the node if it's empty
        if self.dll.is_empty(node):
            self.dll.remove(node)

    def getMaxKey(self) -> str:
        if self.dll.tail.prev == self.dll.head:
            return ""
        return next(iter(self.dll.tail.prev.elem))

    def getMinKey(self) -> str:
        if self.dll.head.next == self.dll.tail:
            return ""
        return next(iter(self.dll.head.next.elem))

```