---
title: "Count Of Interesting Subarrays"
date: "2025-04-25T12:14:09+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 138 ms (75.86%) | Memory: 47.9 MB (26.44%) - LeetSync"
---

```python
class Solution:
    def countInterestingSubarrays(self, nums: List[int], modulo: int, k: int) -> int:
        # in a subarr, find all indexes where % is k
        # then if the number of such elements i multiple of k -> interesting
        # so basically 5 , multiples of 5
        # 6 multiples of 6 and so on
        # make all multiples as -1
        # prepare an arr of ints with indexes of -1 occurences
        # then subarray would be newarr[k + 1] - newarr[k]
        prefix = 0
        freq = defaultdict(int)
        freq[0] = 1  # to count subarrays starting at index 0
        res = 0

        for num in nums:
            if num % modulo == k:
                prefix += 1
            
            # we want previous prefix sums that satisfy:
            # (prefix - prev) % modulo == k
            # => prev % modulo == (prefix - k + modulo) % modulo
            target = (prefix - k) % modulo
            res += freq[target]
            freq[prefix % modulo] += 1
        
        return res
        prepare = []
        for i, m in enumerate(nums):
            if m % modulo == k:
                prepare.append(i)
        res = 0
        

        print(prepare)
        for i, m in enumerate(prepare):
            if (i ) % modulo == k and i - 1 >= 0:
                res += prepare[i] - prepare[i-1]

        if len(prepare) == 1:
            res += len(nums)  - prepare[0]

        return res



        

        
```