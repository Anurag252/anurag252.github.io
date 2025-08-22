---
title: "./432 All Oone Data Structure"
date: "2024-09-29T08:05:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/all-oone-data-structure">All O`one Data Structure</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Design a data structure to store the strings&#39; count with the ability to return the strings with minimum and maximum counts.</p>

<p>Implement the <code>AllOne</code> class:</p>

<ul>
	<li><code>AllOne()</code> Initializes the object of the data structure.</li>
	<li><code>inc(String key)</code> Increments the count of the string <code>key</code> by <code>1</code>. If <code>key</code> does not exist in the data structure, insert it with count <code>1</code>.</li>
	<li><code>dec(String key)</code> Decrements the count of the string <code>key</code> by <code>1</code>. If the count of <code>key</code> is <code>0</code> after the decrement, remove it from the data structure. It is guaranteed that <code>key</code> exists in the data structure before the decrement.</li>
	<li><code>getMaxKey()</code> Returns one of the keys with the maximal count. If no element exists, return an empty string <code>&quot;&quot;</code>.</li>
	<li><code>getMinKey()</code> Returns one of the keys with the minimum count. If no element exists, return an empty string <code>&quot;&quot;</code>.</li>
</ul>

<p><strong>Note</strong> that each function must run in <code>O(1)</code> average time complexity.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input</strong>
[&quot;AllOne&quot;, &quot;inc&quot;, &quot;inc&quot;, &quot;getMaxKey&quot;, &quot;getMinKey&quot;, &quot;inc&quot;, &quot;getMaxKey&quot;, &quot;getMinKey&quot;]
[[], [&quot;hello&quot;], [&quot;hello&quot;], [], [], [&quot;leet&quot;], [], []]
<strong>Output</strong>
[null, null, null, &quot;hello&quot;, &quot;hello&quot;, null, &quot;hello&quot;, &quot;leet&quot;]

<strong>Explanation</strong>
AllOne allOne = new AllOne();
allOne.inc(&quot;hello&quot;);
allOne.inc(&quot;hello&quot;);
allOne.getMaxKey(); // return &quot;hello&quot;
allOne.getMinKey(); // return &quot;hello&quot;
allOne.inc(&quot;leet&quot;);
allOne.getMaxKey(); // return &quot;hello&quot;
allOne.getMinKey(); // return &quot;leet&quot;
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= key.length &lt;= 10</code></li>
	<li><code>key</code> consists of lowercase English letters.</li>
	<li>It is guaranteed that for each call to <code>dec</code>, <code>key</code> is existing in the data structure.</li>
	<li>At most <code>5 * 10<sup>4</sup></code>&nbsp;calls will be made to <code>inc</code>, <code>dec</code>, <code>getMaxKey</code>, and <code>getMinKey</code>.</li>
</ul>"
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