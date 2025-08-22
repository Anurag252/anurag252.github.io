---
title: "731 My Calendar Ii"
date: "2024-09-28T09:43:30+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [My Calendar II](https://leetcode.com/problems/my-calendar-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are implementing a program to use as your calendar. We can add a new event if adding the event will not cause a **triple booking**.
  
  A **triple booking** happens when three events have some non-empty intersection (i.e., some moment is common to all the three events.).
  
  The event can be represented as a pair of integers start and end that represents a booking on the half-open interval [start, end), the range of real numbers x such that start &lt;= x &lt; end.
  
  Implement the MyCalendarTwo class:
  
  	MyCalendarTwo() Initializes the calendar object.
  	boolean book(int start, int end) Returns true if the event can be added to the calendar successfully without causing a **triple booking**. Otherwise, return false and do not add the event to the calendar.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input**
  [\"MyCalendarTwo\", \"book\", \"book\", \"book\", \"book\", \"book\", \"book\"]
  [[], [10, 20], [50, 60], [10, 40], [5, 15], [5, 10], [25, 55]]
  **Output**
  [null, true, true, true, false, true, true]
  
  **Explanation**
  MyCalendarTwo myCalendarTwo = new MyCalendarTwo();
  myCalendarTwo.book(10, 20); // return True, The event can be booked. 
  myCalendarTwo.book(50, 60); // return True, The event can be booked. 
  myCalendarTwo.book(10, 40); // return True, The event can be double booked. 
  myCalendarTwo.book(5, 15);  // return False, The event cannot be booked, because it would result in a triple booking.
  myCalendarTwo.book(5, 10); // return True, The event can be booked, as it does not use time 10 which is already double booked.
  myCalendarTwo.book(25, 55); // return True, The event can be booked, as the time in [25, 40) will be double booked with the third event, the time [40, 50) will be single booked, and the time [50, 55) will be double booked with the second event.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	0 &lt;= start &lt; end &lt;= 109
  	At most 1000 calls will be made to book.
---

```python
class MyCalendarTwo:

    def __init__(self):
        self.cal = []

        

    def book(self, start: int, end: int) -> bool:
        overlap = []

        for  idx1, k in enumerate(self.cal):
            if k[0] <= start and start < k[1]:
                s = start
                e = min(end, k[1])
                for idx2,l in enumerate(self.cal):
                    if l[0] <= s and s < l[1] and idx1 != idx2:
                        #print(start, end, l[0], l[1], s , e)
                        return False
                    if l[0] < e and e <= l[1] and idx1 != idx2:
                        #print(start, end, l[0], l[1], s , e)
                        return False
                    if l[0] < e and l[0] >= s and idx1 != idx2:
                        return False

            elif k[0] < end and end <= k[1]:
                s = max(k[0],start)
                e = end
                for idx2,l in enumerate(self.cal):
                    if l[0] <= s and s < l[1] and idx1 != idx2:
                        #print(start, end, l[0], l[1], s , e)
                        return False
                    if l[0] < e and e <= l[1] and idx1 != idx2:
                        #print(start, end, l[0], l[1], s , e)
                        return False
                    if l[0] < e and l[0] >= s and idx1 != idx2:
                        return False

            elif k[0] < end and k[0] >= start:
                s = k[0]
                e = k[1]
                for idx2,l in enumerate(self.cal):
                    if l[0] <= s and s < l[1] and idx1 != idx2:
                        #print(start, end, l[0], l[1], s , e)
                        return False
                    if l[0] < e and e <= l[1] and idx1 != idx2:
                        #print(start, end, l[0], l[1], s , e)
                        return False
                    if l[0] < e and l[0] >= s and idx1 != idx2:
                        return False

        self.cal.append((start, end))
        return True
        

        


# Your MyCalendarTwo object will be instantiated and called as such:
# obj = MyCalendarTwo()
# param_1 = obj.book(start,end)
```