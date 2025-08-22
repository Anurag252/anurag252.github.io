---
title: "./731 My Calendar Ii"
date: "2024-09-28T09:43:30+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/my-calendar-ii">My Calendar II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are implementing a program to use as your calendar. We can add a new event if adding the event will not cause a <strong>triple booking</strong>.</p>

<p>A <strong>triple booking</strong> happens when three events have some non-empty intersection (i.e., some moment is common to all the three events.).</p>

<p>The event can be represented as a pair of integers <code>start</code> and <code>end</code> that represents a booking on the half-open interval <code>[start, end)</code>, the range of real numbers <code>x</code> such that <code>start &lt;= x &lt; end</code>.</p>

<p>Implement the <code>MyCalendarTwo</code> class:</p>

<ul>
	<li><code>MyCalendarTwo()</code> Initializes the calendar object.</li>
	<li><code>boolean book(int start, int end)</code> Returns <code>true</code> if the event can be added to the calendar successfully without causing a <strong>triple booking</strong>. Otherwise, return <code>false</code> and do not add the event to the calendar.</li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input</strong>
[&quot;MyCalendarTwo&quot;, &quot;book&quot;, &quot;book&quot;, &quot;book&quot;, &quot;book&quot;, &quot;book&quot;, &quot;book&quot;]
[[], [10, 20], [50, 60], [10, 40], [5, 15], [5, 10], [25, 55]]
<strong>Output</strong>
[null, true, true, true, false, true, true]

<strong>Explanation</strong>
MyCalendarTwo myCalendarTwo = new MyCalendarTwo();
myCalendarTwo.book(10, 20); // return True, The event can be booked. 
myCalendarTwo.book(50, 60); // return True, The event can be booked. 
myCalendarTwo.book(10, 40); // return True, The event can be double booked. 
myCalendarTwo.book(5, 15);  // return False, The event cannot be booked, because it would result in a triple booking.
myCalendarTwo.book(5, 10); // return True, The event can be booked, as it does not use time 10 which is already double booked.
myCalendarTwo.book(25, 55); // return True, The event can be booked, as the time in [25, 40) will be double booked with the third event, the time [40, 50) will be single booked, and the time [50, 55) will be double booked with the second event.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>0 &lt;= start &lt; end &lt;= 10<sup>9</sup></code></li>
	<li>At most <code>1000</code> calls will be made to <code>book</code>.</li>
</ul>"
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