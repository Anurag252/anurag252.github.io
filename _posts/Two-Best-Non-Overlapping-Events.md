---
title: "Two Best Non Overlapping Events"
date: "2024-12-08T12:09:05+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1243 ms (5.34%) | Memory: 57.5 MB (58.05%) - LeetSync"
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