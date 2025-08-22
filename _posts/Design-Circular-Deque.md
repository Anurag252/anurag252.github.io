---
title: "Design Circular Deque"
date: "2024-09-28T09:11:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 62 ms (42.52%) | Memory: 17.5 MB (26.32%) - LeetSync"
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