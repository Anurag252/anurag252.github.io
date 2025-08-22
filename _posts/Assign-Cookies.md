---
title: "Assign Cookies"
date: "2025-07-13T07:01:58+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 83 ms (5.18%) | Memory: 23.9 MB (7.19%) - LeetSync"
---

```python
class Solution:
    def findContentChildren(self, players: List[int], trainers: List[int]) -> int:
        """
        there can be multiple possibilities to match, one of these will lead to max
        looking at const it appears greedy, than backtracking
        what if we match with someone just smallest possible, as larger ones
        will already be a match in case this matched
        sorting both of these seems doable
        after sorting it appears to be paran matching
        """
        arr =[]

        for i in players:
            arr.append((i,'p'))

        for i in trainers:
            arr.append((i,'t'))

        arr.sort(key=lambda x : x[0])

        st = []
        count = 0
        i = 0
        while(i < len(arr)):
            if st and st[-1][1] == 'p' and arr[i][1] == 't':
                st.pop()
                count += 1
                i += 1
            else:
                st.append(arr[i])
                i += 1
        return count
```