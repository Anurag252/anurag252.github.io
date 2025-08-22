---
title: "Partition Array Such That Maximum Difference Is K"
date: "2025-06-19T07:24:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 95 ms (38.14%) | Memory: 29.1 MB (73.61%) - LeetSync"
---

```python
class Solution:
    def partitionArray(self, nums: List[int], k: int) -> int:
        """
        what if we went greedy, for every subsequence keep taking all
        elems , till max and min is satified
        and leave others
        is this union find ?
        find all nodes that at at most k 
        this approach is n2
        greedy does not work in case
        3,5,6,1,2-
        3,5 | 6 | 1,2
        5,6 | 3,1,2
        starting at index i, take longest subsequence, this greedy works
        /////// missed that sorting already works, I assumed soring will
        ////// only work for grps, rest was fine
        """
        nums.sort()
        grps = 1
        curr_min, curr_max = nums[0], nums[0]
        for k1 in nums:
            if k1 - curr_min <= k and k1 - curr_max <= k:
                curr_max = k1
                continue
            else:
                grps += 1
                curr_min = k1
                curr_max = k1
        return grps







        
```