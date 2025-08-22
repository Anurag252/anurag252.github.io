---
title: "Best Sightseeing Pair"
date: "2024-12-27T08:55:21+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 83 ms (21.22%) | Memory: 26.6 MB (5.12%) - LeetSync"
---

```python
class Solution:
    def maxScoreSightseeingPair(self, values: List[int]) -> int:
        # maximize the value and minimize the gap
        # closest one and has largest value preferably/not necessarily larger than itself
        st = []

        addn = []

        subs = []

        pref_sum = [0] * len(values) 

        temp = -10 ** 8
        for idx, k in enumerate(values):
            addn.append(k + idx)

        for idx, k in enumerate(values):
            subs.append(k - idx)
        #print(subs)

        for idx, k in enumerate(subs[::-1]):
            if k > temp:
                temp = k
                #print(len(subs) - 1 - idx)
            pref_sum[len(subs) - 1 - idx] = temp
        #print(pref_sum, subs, addn)

        s = 0
        for idx, k in enumerate(addn):
            if idx + 1 < len(pref_sum) and k + pref_sum[idx+1] > s:
                s = k + pref_sum[idx+1]
        return s

        

        """
        [(0,8), (1,1), (2,5), (3,2), (4,6)]
         [8, 2, 7, 5, 10]
        =[8, 0, 3, -1, 2]

        [8, ]
        """



```