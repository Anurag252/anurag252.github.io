---
title: "Continuous Subarrays"
date: "2024-12-15T10:18:30+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 834 ms (21.05%) | Memory: 27.5 MB (42.25%) - LeetSync"
---

```python

class Solution:
    def continuousSubarrays(self, nums: List[int]) -> int:
        
        left = 0
        right = 0
        arr = {}
        result = 0



        def valid_range(n, arr):
            
            if len(arr) == 0:
                arr[n] = 1
                return True
            #print(arr1, arr1[0], arr1[-1])
            if max(arr.keys()) - n <= 2 and  n - min(arr.keys()) <= 2:
                if n in arr:
                    arr[n] += 1
                else:
                    arr[n] = 1
                return True
            return False 

        while(left < len(nums) and right < len(nums)):
            #print(left, right, arr)
            if valid_range(nums[right], arr):
                result += right - left + 1
                right += 1
            else:
                #result += add(right - left)
                #print(nums[left], arr.index(nums[left]))
                arr[nums[left]] -= 1
                if arr[nums[left]] == 0:
                    del arr[nums[left]]
                left += 1
        #print(arr, left, right)
        #result += add(right - left)
        return result
```