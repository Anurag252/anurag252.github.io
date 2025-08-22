---
title: "3154 Maximum Value Of An Ordered Triplet I"
date: "2025-04-02T08:01:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Maximum Value of an Ordered Triplet I](https://leetcode.com/problems/maximum-value-of-an-ordered-triplet-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a **0-indexed** integer array nums.

Return ***the maximum value over all triplets of indices*** (i, j, k) *such that* i < j < k. If all such triplets have a negative value, return 0.

The **value of a triplet of indices** (i, j, k) is equal to (nums[i] - nums[j]) * nums[k].

 

Example 1:

```

**Input:** nums = [12,6,1,2,7]
**Output:** 77
**Explanation:** The value of the triplet (0, 2, 4) is (nums[0] - nums[2]) * nums[4] = 77.
It can be shown that there are no ordered triplets of indices with a value greater than 77. 

```

Example 2:

```

**Input:** nums = [1,10,3,4,19]
**Output:** 133
**Explanation:** The value of the triplet (1, 2, 4) is (nums[1] - nums[2]) * nums[4] = 133.
It can be shown that there are no ordered triplets of indices with a value greater than 133.

```

Example 3:

```

**Input:** nums = [1,2,3]
**Output:** 0
**Explanation:** The only ordered triplet of indices (0, 1, 2) has a negative value of (nums[0] - nums[1]) * nums[2] = -3. Hence, the answer would be 0.

```

 

**Constraints:**

	3 <= nums.length <= 100
	1 <= nums[i] <= 106

                            {% raw %}
                            ```python
                            class Solution:
    def maximumTripletValue(self, nums: List[int]) -> int:
        pos = [0] * len(nums)
        pos1 = [0] * len(nums)
        mn = [0] * len(nums)
        
        temp1 = 0
        temp2 = 0
        temp3 = 1000
        for i, k in enumerate(nums[::-1]):
            if temp1 < k:
                temp1 = k
            pos[len(nums) - i-1] = temp1
        
        for i, k in enumerate(nums):
            if temp2 < k:
                temp2 = k
            pos1[i] = temp2

        for i, k in enumerate(nums[::-1]):
            if temp3 > k:
                temp3 = k
            mn[len(nums) - i-1] = temp3
            
        print(pos, pos1, mn)
        mx = 0

        for i , k in enumerate(nums):
            if i - 1 >= 0 and i + 1 < len(nums):
                mx = max(mx, (pos1[i-1] - k) * pos[i+1])
        return mx

        
                            {% endraw %}
                            