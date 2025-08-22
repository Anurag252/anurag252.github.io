---
title: "859 Design Circular Deque"
date: "2024-09-28T09:11:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Design Circular Deque](https://leetcode.com/problems/design-circular-deque) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Design your implementation of the circular double-ended queue (deque).
  
  Implement the MyCircularDeque class:
  
  	MyCircularDeque(int k) Initializes the deque with a maximum size of k.
  	boolean insertFront() Adds an item at the front of Deque. Returns true if the operation is successful, or false otherwise.
  	boolean insertLast() Adds an item at the rear of Deque. Returns true if the operation is successful, or false otherwise.
  	boolean deleteFront() Deletes an item from the front of Deque. Returns true if the operation is successful, or false otherwise.
  	boolean deleteLast() Deletes an item from the rear of Deque. Returns true if the operation is successful, or false otherwise.
  	int getFront() Returns the front item from the Deque. Returns -1 if the deque is empty.
  	int getRear() Returns the last item from Deque. Returns -1 if the deque is empty.
  	boolean isEmpty() Returns true if the deque is empty, or false otherwise.
  	boolean isFull() Returns true if the deque is full, or false otherwise.
  
   
  
  Example 1:
  
  ```
  
  **Input**
  [\"MyCircularDeque\", \"insertLast\", \"insertLast\", \"insertFront\", \"insertFront\", \"getRear\", \"isFull\", \"deleteLast\", \"insertFront\", \"getFront\"]
  [[3], [1], [2], [3], [4], [], [], [], [4], []]
  **Output**
  [null, true, true, true, false, 2, true, true, true, 4]
  
  **Explanation**
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
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= k <= 1000
  	0 <= value <= 1000
  	At most 2000 calls will be made to insertFront, insertLast, deleteFront, deleteLast, getFront, getRear, isEmpty, isFull.
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