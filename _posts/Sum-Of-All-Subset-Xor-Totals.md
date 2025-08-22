---
title: "Sum Of All Subset Xor Totals"
date: "2025-04-05T07:41:01+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 186 ms (5.12%) | Memory: 18.5 MB (6.14%) - LeetSync"
---

```python
class Solution:
    def subsetXORSum(self, nums: List[int]) -> int:
        # xor -> 0 if same else 1
        t = 0
        def all_subsets(i):
            if i == len(nums)-1:
                return [[nums[i]]]
            res = []
            for s in all_subsets(i+1):
                if s != None:
                    res.append(copy.deepcopy(s))
                    s.append(nums[i])
                    res.append(s)
            res.append([nums[i]])

            return res
        s = all_subsets(0)
        m = 0
        for t in s:
            l = t[0]
            for k in t[1:]:
                l ^= k
            m += l
        return m

        
```