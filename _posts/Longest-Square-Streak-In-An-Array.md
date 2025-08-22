---
title: "Longest Square Streak In An Array"
date: "2024-10-28T04:18:21+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 862 ms (5.41%) | Memory: 37.7 MB (12.33%) - LeetSync"
---

```python
class Solution:
    def longestSquareStreak(self, nums: List[int]) -> int:
        nums.sort()
        res = []
        mp = {}
        for k in nums:
            s = int(math.sqrt(k))
            print(s,math.sqrt(k), s == math.sqrt(k) )
            if s in mp and s == math.sqrt(k):
                mp[k] = (mp[s] + 1)
                res.append(mp[k])
                
            else:
                mp[k] = 0
        #print(res, mp)
        return max(res) +  1 if len(res) > 0 else -1


```