---
            title: "3743 Reschedule Meetings For Maximum Free Time I"
            date: "2025-07-09T10:44:30+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Reschedule Meetings for Maximum Free Time I](https://leetcode.com/problems/reschedule-meetings-for-maximum-free-time-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer eventTime denoting the duration of an event, where the event occurs from time t = 0 to time t = eventTime.

You are also given two integer arrays startTime and endTime, each of length n. These represent the start and end time of n **non-overlapping** meetings, where the ith meeting occurs during the time [startTime[i], endTime[i]].

You can reschedule **at most** k meetings by moving their start time while maintaining the **same duration**, to **maximize** the **longest** *continuous period of free time* during the event.

The **relative** order of all the meetings should stay the* same* and they should remain non-overlapping.

Return the **maximum** amount of free time possible after rearranging the meetings.

**Note** that the meetings can **not** be rescheduled to a time outside the event.

 

Example 1:

**Input:** eventTime = 5, k = 1, startTime = [1,3], endTime = [2,5]

**Output:** 2

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/12/21/example0_rescheduled.png)

Reschedule the meeting at [1, 2] to [2, 3], leaving no meetings during the time [0, 2].

Example 2:

**Input:** eventTime = 10, k = 1, startTime = [0,2,9], endTime = [1,4,10]

**Output:** 6

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/12/21/example1_rescheduled.png)

Reschedule the meeting at [2, 4] to [1, 3], leaving no meetings during the time [3, 9].

Example 3:

**Input:** eventTime = 5, k = 2, startTime = [0,1,2,3,4], endTime = [1,2,3,4,5]

**Output:** 0

**Explanation:**

There is no time during the event not occupied by meetings.

 

**Constraints:**

	1 <= eventTime <= 109
	n == startTime.length == endTime.length
	2 <= n <= 105
	1 <= k <= n
	0 <= startTime[i] < endTime[i] <= eventTime
	endTime[i] <= startTime[i + 1] where i lies in the range [0, n - 2].

{% raw %}


```python


class Solution:
    def maxFreeTime(self, eventTime: int, k: int, startTime: List[int], endTime: List[int]) -> int:
        """
        the longest free time can be achived if they are all togather
        also to maintain the order, find the smallest empty gaps and reduce it further -> no this may not work
        then find largest empty gaps and increase it 
        y greedy works - say increasing largest by x  does not yield the largest time, then it means inc 2nd largest by x yields ? which cannot be true as if x > y, then x + 3 > y + 3
            maybe we take all free spaces and then start moving empty spaces to larger one k times
            start by reducing largest meeting 
        # this greedy did not work as it was possible to move left or right side as well, rather take k window and 
        find me maximum output
        """
        duration = []
        start_time = 0
        end_time = 0
        for i, (start, end) in enumerate(zip(startTime, endTime)):
            duration.append((i,start-end_time))
            start_time = start
            end_time = end
        duration.append((i+1, eventTime - endTime[-1]))
        
        total = 0
        left = 0
        right = 0
        print(duration)
        while(right - left < k + 1) and right < len(duration):
                total += duration[right][1]
                right += 1
        max_total = total

        # Slide the window
        while right < len(duration):
            total -= duration[left][1]
            total += duration[right][1]
            left += 1
            right += 1
            max_total = max(max_total, total)

        return max_total

        




        
        
        
        
        

        return duration[0] + total   if len(duration) > 0 else 0




{% endraw %}
```
