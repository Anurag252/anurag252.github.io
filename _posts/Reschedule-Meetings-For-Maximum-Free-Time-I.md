---
title: "Reschedule Meetings For Maximum Free Time I"
date: "2025-07-09T10:44:30+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 181 ms (5.32%) | Memory: 46.3 MB (5.32%) - LeetSync"
---

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


```