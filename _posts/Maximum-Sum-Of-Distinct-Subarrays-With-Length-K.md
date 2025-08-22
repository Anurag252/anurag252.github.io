---
title: "Maximum Sum Of Distinct Subarrays With Length K"
date: "2024-11-19T09:03:25+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 126 ms (49.45%) | Memory: 36.5 MB (21.72%) - LeetSync"
---

```python
class Solution:
    def maximumSubarraySum(self, nums: List[int], k: int) -> int:
        s = sum(nums[:k])
        dic = {}
        for m in nums[:k]:
            if m not in dic:
                dic[m] = 1
            else:
                dic[m] += 1
        
        print(nums[:k])
        start = 0
        ans = 0
        
        while(start + k < len(nums) ):
            #print(s, sum(arr))
            if len(dic) == k:
                ans = max(ans, s)
            s -= nums[start]
            dic[nums[start]] -= 1
            if dic[nums[start]] == 0:
                del dic[nums[start]]
 
            s += nums[start + k]
            if nums[start + k] not in dic:
                dic[nums[start + k]] = 1
            else:
                dic[nums[start + k]] += 1
            start += 1
            

        if len(dic) == k:
                ans = max(ans, s)
        return ans


```