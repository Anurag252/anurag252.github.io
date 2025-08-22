---
title: "Largest Number"
date: "2024-09-18T21:30:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 48 ms (18.96%) | Memory: 16.4 MB (96.53%) - LeetSync"
---

```python
class Solution:
    from functools import cmp_to_key

    def largestNumber(self, nums: List[int]) -> str:
        def my_comparator(x,y):
            return int(str(x) + str(y)) - int(str(y) + str(x))

        nums.sort(reverse=True, key=cmp_to_key(my_comparator))
        res = ''.join(str(x) for x in nums)
        i = 0
        while(i < len(res)):
            if res[i] != '0':
                return res[i:]
            i += 1
        return "0"

```