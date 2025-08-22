---
title: "Count Subarrays With Score Less Than K"
date: "2025-04-29T08:28:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 210 ms (7.36%) | Memory: 30.8 MB (14.21%) - LeetSync"
---

```python
class Solution:
    def countSubarrays(self, nums: List[int], k: int) -> int:

        left = 0
        s = sum(nums)
        total = 0
        res = 0
        right = 0

        while(left < len(nums)):
            while right < len(nums) and (total + nums[right]) * (right - left + 1) < k:
                total += nums[right]
                right += 1

            # After expansion, [left, right-1] are all valid
            res += right - left

            # Move left forward
            total -= nums[left]
            left += 1
        return res

        



        right = len(nums) - 1
        
        while(left < len(nums)):
            if s * (right - left + 1) >= k: # still large
                s -= nums[right]
                right -= 1
                if right < 0:
                    left += 1
                    s = left
                    right = left
            else:
                # found max < k

                res += right - left + 1 # nums of subarray
                s -= nums[left]
                left += 1
                while(s * (right - left + 1) <= k and right < len(nums)-1):
                    right += 1
                    s += nums[right]
        return res


        
```