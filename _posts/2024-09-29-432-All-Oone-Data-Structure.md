---
            title: "432 All Oone Data Structure"
            date: "2024-09-29T08:05:20+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [All O`one Data Structure](https://leetcode.com/problems/all-oone-data-structure) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Design a data structure to store the strings' count with the ability to return the strings with minimum and maximum counts.

Implement the AllOne class:

	AllOne() Initializes the object of the data structure.
	inc(String key) Increments the count of the string key by 1. If key does not exist in the data structure, insert it with count 1.
	dec(String key) Decrements the count of the string key by 1. If the count of key is 0 after the decrement, remove it from the data structure. It is guaranteed that key exists in the data structure before the decrement.
	getMaxKey() Returns one of the keys with the maximal count. If no element exists, return an empty string "".
	getMinKey() Returns one of the keys with the minimum count. If no element exists, return an empty string "".

**Note** that each function must run in O(1) average time complexity.

 

Example 1:

```

**Input**
["AllOne", "inc", "inc", "getMaxKey", "getMinKey", "inc", "getMaxKey", "getMinKey"]
[[], ["hello"], ["hello"], [], [], ["leet"], [], []]
**Output**
[null, null, null, "hello", "hello", null, "hello", "leet"]

**Explanation**
AllOne allOne = new AllOne();
allOne.inc("hello");
allOne.inc("hello");
allOne.getMaxKey(); // return "hello"
allOne.getMinKey(); // return "hello"
allOne.inc("leet");
allOne.getMaxKey(); // return "hello"
allOne.getMinKey(); // return "leet"

```

 

**Constraints:**

	1 <= key.length <= 10
	key consists of lowercase English letters.
	It is guaranteed that for each call to dec, key is existing in the data structure.
	At most 5 * 104 calls will be made to inc, dec, getMaxKey, and getMinKey.

{% raw %}


````python


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



{% endraw %}
