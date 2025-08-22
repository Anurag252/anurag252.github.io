---
title: "3171 Minimum Equal Sum Of Two Arrays After Replacing Zeros"
date: "2025-05-10T22:20:08+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Minimum Equal Sum of Two Arrays After Replacing Zeros](https://leetcode.com/problems/minimum-equal-sum-of-two-arrays-after-replacing-zeros) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two arrays nums1 and nums2 consisting of positive integers.

You have to replace **all** the 0's in both arrays with **strictly** positive integers such that the sum of elements of both arrays becomes **equal**.

Return *the **minimum** equal sum you can obtain, or *-1* if it is impossible*.

 

Example 1:

```

**Input:** nums1 = [3,2,0,1,0], nums2 = [6,5,0]
**Output:** 12
**Explanation:** We can replace 0's in the following way:
- Replace the two 0's in nums1 with the values 2 and 4. The resulting array is nums1 = [3,2,2,1,4].
- Replace the 0 in nums2 with the value 1. The resulting array is nums2 = [6,5,1].
Both arrays have an equal sum of 12. It can be shown that it is the minimum sum we can obtain.

```

Example 2:

```

**Input:** nums1 = [2,0,2,0], nums2 = [1,4]
**Output:** -1
**Explanation:** It is impossible to make the sum of both arrays equal.

```

 

**Constraints:**

	1 <= nums1.length, nums2.length <= 105
	0 <= nums1[i], nums2[i] <= 106

                            {% raw %}
                            ```python
                            class Solution:
    def minSum(self, nums1: List[int], nums2: List[int]) -> int:
        
        num_of_zeros_a = 0
        num_of_zeros_b = 0

        for k in nums1:
            if k == 0:
                num_of_zeros_a += 1

        for k in nums2:
            if k == 0:
                num_of_zeros_b += 1

        """
            its not possible if one side is > and other side does not have 0
        """
        if num_of_zeros_b == 0 and num_of_zeros_a == 0 and sum(nums1) != sum(nums2):
            return -1
        
        if sum(nums1) + num_of_zeros_a > sum(nums2) + num_of_zeros_b:
            if num_of_zeros_b == 0 and num_of_zeros_a > 0:
                return -1
            return sum(nums1) + num_of_zeros_a
        else:
            if num_of_zeros_a == 0 and num_of_zeros_b > 0:
                return -1
            return sum(nums2) + num_of_zeros_b


        
                            {% endraw %}
                            