---
title: "./2164 Two Best Non Overlapping Events"
date: "2024-12-08T12:09:05+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/two-best-non-overlapping-events">Two Best Non-Overlapping Events</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> 2D integer array of <code>events</code> where <code>events[i] = [startTime<sub>i</sub>, endTime<sub>i</sub>, value<sub>i</sub>]</code>. The <code>i<sup>th</sup></code> event starts at <code>startTime<sub>i</sub></code><sub> </sub>and ends at <code>endTime<sub>i</sub></code>, and if you attend this event, you will receive a value of <code>value<sub>i</sub></code>. You can choose <strong>at most</strong> <strong>two</strong> <strong>non-overlapping</strong> events to attend such that the sum of their values is <strong>maximized</strong>.</p>

<p>Return <em>this <strong>maximum</strong> sum.</em></p>

<p>Note that the start time and end time is <strong>inclusive</strong>: that is, you cannot attend two events where one of them starts and the other ends at the same time. More specifically, if you attend an event with end time <code>t</code>, the next event must start at or after <code>t + 1</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/09/21/picture5.png" style="width: 400px; height: 75px;" />
<pre>
<strong>Input:</strong> events = [[1,3,2],[4,5,2],[2,4,3]]
<strong>Output:</strong> 4
<strong>Explanation: </strong>Choose the green events, 0 and 1 for a sum of 2 + 2 = 4.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="Example 1 Diagram" src="https://assets.leetcode.com/uploads/2021/09/21/picture1.png" style="width: 400px; height: 77px;" />
<pre>
<strong>Input:</strong> events = [[1,3,2],[4,5,2],[1,5,5]]
<strong>Output:</strong> 5
<strong>Explanation: </strong>Choose event 2 for a sum of 5.
</pre>

<p><strong class="example">Example 3:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/09/21/picture3.png" style="width: 400px; height: 66px;" />
<pre>
<strong>Input:</strong> events = [[1,5,3],[1,5,1],[6,6,5]]
<strong>Output:</strong> 8
<strong>Explanation: </strong>Choose events 0 and 2 for a sum of 3 + 5 = 8.</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= events.length &lt;= 10<sup>5</sup></code></li>
	<li><code>events[i].length == 3</code></li>
	<li><code>1 &lt;= startTime<sub>i</sub> &lt;= endTime<sub>i</sub> &lt;= 10<sup>9</sup></code></li>
	<li><code>1 &lt;= value<sub>i</sub> &lt;= 10<sup>6</sup></code></li>
</ul>"
---

```python
class Solution:
    def maxTwoEvents(self, events: List[List[int]]) -> int:
        events.sort(key= lambda x : (x[0],x[1]) )

        arr = [0]
        temp = 0
        events.reverse()
        for k in events:
            temp = max(temp, k[2])
            arr.append(temp)
        events.reverse()
        arr.reverse()
        
        
        def good(idx, mid):
            if events[idx][1] < events[mid][0]:
                return True
            return False


        ans = 0
        events.append([10**6, 10**6,0])
        #print(events, arr)

        for idx, k in enumerate(events):
            left = idx + 1
            right = len(events) - 1
            while(left < right):
                mid = (right + left) // 2
                #print(mid)
                if good(idx, mid):
                    print("yes")
                    right = mid
                else:
                    left = mid + 1
            #if left == len(events)-1 or left == idx:
                #continue
            if right == len(events) - 1 :
                ans = max(ans , k[2] )
            else:
                ans = max(ans , k[2] + arr[left])
            print(idx, ans, left)
        return ans
            
        


        # take a max and 2nd max
        # or take a max only if 2nd max is
        # start with max, if end element is less than max/2 and overlapping then we cannot find 2 elements that sum to max so ans
        # if 2nd element is > max/2 and overlapping then count next two elements if we missed two elements
        # that means 
        # loop over every n and do bin search in log n inside to see if this overlaps 
        # if it doesn't overlap move to left 
        # if it overlaps move right

```