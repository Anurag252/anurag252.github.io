---
title: "Check If Grid Can Be Cut Into Sections"
date: "2025-03-25T04:32:57+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 411 ms (70.95%) | Memory: 83.6 MB (46.62%) - LeetSync"
---

```python
class Solution:
    def checkValidCuts(self, n: int, rectangles: List[List[int]]) -> bool:
        # find at least 3 non overlapping rectangles
        # [0,2] , [2,4], [2,3], [4,5]
        # merge intervals and find at least 3 , nore than 3 also ok ? looks yes

        x_rect = []
        y_rect = []

        for k in rectangles:
            x_rect.append([k[1],k[3]])
            y_rect.append([k[0],k[2]])

        def merge_intervals(arr):
            
            arr.sort(key= lambda x: x[0])
            #print(arr)

            start = -1
            end = -1
            count = 0

            for k in arr:
                if end <= k[0]:
                    count += 1
                    start = k[0]
                    end = k[1]
                else:
                    end = max(k[1], end)

            #print(count)
            return count >= 3
        return merge_intervals(x_rect) or merge_intervals(y_rect)


        
            

        


        
```