---
title: "2164 Two Best Non Overlapping Events"
date: "2024-12-08T12:09:05+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Two Best Non-Overlapping Events](https://leetcode.com/problems/two-best-non-overlapping-events) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** 2D integer array of events where events[i] = [startTimei, endTimei, valuei]. The ith event starts at startTimei and ends at endTimei, and if you attend this event, you will receive a value of valuei. You can choose **at most** **two** **non-overlapping** events to attend such that the sum of their values is **maximized**.

Return *this **maximum** sum.*

Note that the start time and end time is **inclusive**: that is, you cannot attend two events where one of them starts and the other ends at the same time. More specifically, if you attend an event with end time t, the next event must start at or after t + 1.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/09/21/picture5.png)
```

**Input:** events = [[1,3,2],[4,5,2],[2,4,3]]
**Output:** 4
**Explanation: **Choose the green events, 0 and 1 for a sum of 2 + 2 = 4.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/09/21/picture1.png)
```

**Input:** events = [[1,3,2],[4,5,2],[1,5,5]]
**Output:** 5
**Explanation: **Choose event 2 for a sum of 5.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/09/21/picture3.png)
```

**Input:** events = [[1,5,3],[1,5,1],[6,6,5]]
**Output:** 8
**Explanation: **Choose events 0 and 2 for a sum of 3 + 5 = 8.
```

 

**Constraints:**

	2 <= events.length <= 105
	events[i].length == 3
	1 <= startTimei <= endTimei <= 109
	1 <= valuei <= 106

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