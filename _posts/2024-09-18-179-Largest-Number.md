---
title: "179 Largest Number"
date: "2024-09-18T21:30:03+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Largest Number](https://leetcode.com/problems/largest-number) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.

Since the result may be very large, so you need to return a string instead of an integer.

 

Example 1:

```

**Input:** nums = [10,2]
**Output:** "210"

```

Example 2:

```

**Input:** nums = [3,30,34,5,9]
**Output:** "9534330"

```

 

**Constraints:**

	1 <= nums.length <= 100
	0 <= nums[i] <= 109

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