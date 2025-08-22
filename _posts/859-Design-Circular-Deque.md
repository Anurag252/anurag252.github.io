---
title: "./859 Design Circular Deque"
date: "2024-09-28T09:11:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/design-circular-deque">Design Circular Deque</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Design your implementation of the circular double-ended queue (deque).</p>

<p>Implement the <code>MyCircularDeque</code> class:</p>

<ul>
	<li><code>MyCircularDeque(int k)</code> Initializes the deque with a maximum size of <code>k</code>.</li>
	<li><code>boolean insertFront()</code> Adds an item at the front of Deque. Returns <code>true</code> if the operation is successful, or <code>false</code> otherwise.</li>
	<li><code>boolean insertLast()</code> Adds an item at the rear of Deque. Returns <code>true</code> if the operation is successful, or <code>false</code> otherwise.</li>
	<li><code>boolean deleteFront()</code> Deletes an item from the front of Deque. Returns <code>true</code> if the operation is successful, or <code>false</code> otherwise.</li>
	<li><code>boolean deleteLast()</code> Deletes an item from the rear of Deque. Returns <code>true</code> if the operation is successful, or <code>false</code> otherwise.</li>
	<li><code>int getFront()</code> Returns the front item from the Deque. Returns <code>-1</code> if the deque is empty.</li>
	<li><code>int getRear()</code> Returns the last item from Deque. Returns <code>-1</code> if the deque is empty.</li>
	<li><code>boolean isEmpty()</code> Returns <code>true</code> if the deque is empty, or <code>false</code> otherwise.</li>
	<li><code>boolean isFull()</code> Returns <code>true</code> if the deque is full, or <code>false</code> otherwise.</li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input</strong>
[&quot;MyCircularDeque&quot;, &quot;insertLast&quot;, &quot;insertLast&quot;, &quot;insertFront&quot;, &quot;insertFront&quot;, &quot;getRear&quot;, &quot;isFull&quot;, &quot;deleteLast&quot;, &quot;insertFront&quot;, &quot;getFront&quot;]
[[3], [1], [2], [3], [4], [], [], [], [4], []]
<strong>Output</strong>
[null, true, true, true, false, 2, true, true, true, 4]

<strong>Explanation</strong>
MyCircularDeque myCircularDeque = new MyCircularDeque(3);
myCircularDeque.insertLast(1);  // return True
myCircularDeque.insertLast(2);  // return True
myCircularDeque.insertFront(3); // return True
myCircularDeque.insertFront(4); // return False, the queue is full.
myCircularDeque.getRear();      // return 2
myCircularDeque.isFull();       // return True
myCircularDeque.deleteLast();   // return True
myCircularDeque.insertFront(4); // return True
myCircularDeque.getFront();     // return 4
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= k &lt;= 1000</code></li>
	<li><code>0 &lt;= value &lt;= 1000</code></li>
	<li>At most <code>2000</code> calls will be made to <code>insertFront</code>, <code>insertLast</code>, <code>deleteFront</code>, <code>deleteLast</code>, <code>getFront</code>, <code>getRear</code>, <code>isEmpty</code>, <code>isFull</code>.</li>
</ul>"
---

```python
class MyCircularDeque:

    def __init__(self, k: int):
        self.arr = []
        self.size = k
        

    def insertFront(self, value: int) -> bool:
        if len(self.arr) + 1 <= self.size:
            self.arr = [value] + self.arr
            return True
        else:
            return False

    def insertLast(self, value: int) -> bool:
        if len(self.arr) + 1 <= self.size:
            self.arr.append(value)
            return True
        else:
            return False
        

    def deleteFront(self) -> bool:
        if len(self.arr) - 1 >= 0:
            self.arr.pop(0)
            return True
        else:
            return False
        

    def deleteLast(self) -> bool:
        if len(self.arr) - 1 >= 0:
            self.arr.pop()
            return True
        else:
            return False
        

    def getFront(self) -> int:
        if len(self.arr) > 0:
            return self.arr[0]
        else:
            return -1
        

    def getRear(self) -> int:
        if len(self.arr) > 0:
            return self.arr[-1]
        else:
            return -1  

    def isEmpty(self) -> bool:
        return len(self.arr) == 0

    def isFull(self) -> bool:
        return self.size == len(self.arr)
        


# Your MyCircularDeque object will be instantiated and called as such:
# obj = MyCircularDeque(k)
# param_1 = obj.insertFront(value)
# param_2 = obj.insertLast(value)
# param_3 = obj.deleteFront()
# param_4 = obj.deleteLast()
# param_5 = obj.getFront()
# param_6 = obj.getRear()
# param_7 = obj.isEmpty()
# param_8 = obj.isFull()
```