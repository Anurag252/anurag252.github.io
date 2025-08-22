---
title: "368 Largest Divisible Subset"
date: "2025-04-06T07:01:53+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Largest Divisible Subset](https://leetcode.com/problems/largest-divisible-subset) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a set of **distinct** positive integers nums, return the largest subset answer such that every pair (answer[i], answer[j]) of elements in this subset satisfies:

	answer[i] % answer[j] == 0, or
	answer[j] % answer[i] == 0

If there are multiple solutions, return any of them.

 

Example 1:

```

**Input:** nums = [1,2,3]
**Output:** [1,2]
**Explanation:** [1,3] is also accepted.

```

Example 2:

```

**Input:** nums = [1,2,4,8]
**Output:** [1,2,4,8]

```

 

**Constraints:**

	1 <= nums.length <= 1000
	1 <= nums[i] <= 2 * 109
	All the integers in nums are **unique**.

                            {% raw %}
                            ```python
                            class Solution:
    def largestDivisibleSubset(self, nums: List[int]) -> List[int]:
        nums.sort()
        if len(nums) == 1:
            return nums
        
        res = [(0,0)] * len(nums)
        mx = 0
        for i, k in enumerate(nums):
            t = 0
            p = 0
            for j in range(0,i+1):
                if k % nums[j] == 0:
                    if j != i and res[j][0] + 1 > t:
                        p = max(p, j)
                    t = max(res[j][0] + 1, t) 
                    mx = max(t,mx)
                    
            res[i] = (t,p)
        print(res, mx)
        if mx == 1:
            return [nums[0]]
        ans = [0] * mx
        index = 0
        for i, k in enumerate(res):
            if k[0] == mx:
                # found max
                index = k[1]
                ans[-1] = nums[i]

                break
        print(index)
        def rec(ans, index, i):
            if i == 0:
                ans[i] = nums[index]
                return
            ans[i] = nums[index]
            rec(ans, res[index][1], i - 1)
        rec(ans, index, len(ans)-2)
        return ans

        


        return res
        # T[n] = max(T[n-i]) for all i if k[i] % k[n-i] == 0
        # 

        
                            {% endraw %}
                            