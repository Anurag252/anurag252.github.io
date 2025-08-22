---
title: "Longest Harmonious Subsequence"
date: "2025-06-30T09:30:18+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 177 ms (5.03%) | Memory: 20 MB (5.28%) - LeetSync"
---

```python
class Solution:
    def findLHS(self, nums: List[int]) -> int:
        """
        lhs[i] = lhs[i-1] + 1, lhs[]
        again I would like to sort, does order matter in ans ?
        no

        """

        

        nums.sort()
        
        ans = 0
        res = 0
        print(nums)
        count = 0
        mp = {}

        for k in nums:
            if k in mp:
                mp[k] += 1
            else:
                mp[k]  = 1
        print(mp)
        arr = list(set(nums))
        arr.sort()
        prev = arr[0]
        for i, k in enumerate(arr):
            print(i, k , ans, mp[prev], mp[k])
            if k - prev == 1:
                ans = max(ans, mp[prev] + mp[k])
            prev = k
        return ans

        for i, k in enumerate(nums):
            print(ans, res,  prev, count,i)
            if k - prev == 0:
                res += 1

            if k - prev == 1:
                count += 1
                res += 1
            elif k - prev > 1:
                if count > 0:
                    ans = max(ans, res)
                prev = nums[i-1]
                res = count + 1
                count = 0
        if count > 0:
            ans = max(ans, res)
        print(ans, res,  prev, count)
        return ans





        
        
        res = 0
        ans = 0
        prev = arr[0][1]
        prev_new = 0

        prev_indx = 0
        print(arr)
        for i, k in enumerate(arr):
            print(prev_new, prev, prev_indx, res, ans)
            if prev != k[1] and prev == arr[prev_new][1]:
                prev_new = i
            if k[1] - prev <= 1 and prev_indx >= k[0]:
                prev_indx = k[0]
                res += 1
            else:
                ans = max(ans, res)
                res = 0
                prev = arr[prev_new][1]
                prev_indx = k[0]
                
        return ans



        
```