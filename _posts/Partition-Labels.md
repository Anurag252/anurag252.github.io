---
title: "Partition Labels"
date: "2025-03-30T10:38:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 7 ms (41.22%) | Memory: 17.7 MB (57.51%) - LeetSync"
---

```python
class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # create a map of char and last index
        # take a start elem
        # loop till start < end , end = max(cend, mp[char])
        # when start == end , add end - start + 1 to arr and then start = end + 1
        # do this till start < len(s)

        mp = {}

        for id, k in enumerate(s):
            mp[k] = id

        start = 0
        end = 0
        curr = 0
        res = []
        while(start <= end) :
            if curr == len(s):
                return res 
            end = max(end, mp[s[curr]])
            if curr == end:
                res.append(end - start + 1)
                start = end + 1
                curr = end
                end += 1
            curr += 1
        return res
            


        
```