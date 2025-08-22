---
title: "3643 Zero Array Transformation Ii"
date: "2025-03-13T11:01:29+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Zero Array Transformation II](https://leetcode.com/problems/zero-array-transformation-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums of length n and a 2D array queries where queries[i] = [li, ri, vali].

Each queries[i] represents the following action on nums:

	Decrement the value at each index in the range [li, ri] in nums by **at most** vali.
	The amount by which each value is decremented can be chosen **independently** for each index.

A **Zero Array** is an array with all its elements equal to 0.

Return the **minimum** possible **non-negative** value of k, such that after processing the first k queries in **sequence**, nums becomes a **Zero Array**. If no such k exists, return -1.

 

Example 1:

**Input:** nums = [2,0,2], queries = [[0,2,1],[0,2,1],[1,1,3]]

**Output:** 2

**Explanation:**

	**For i = 0 (l = 0, r = 2, val = 1):**

		Decrement values at indices [0, 1, 2] by [1, 0, 1] respectively.
		The array will become [1, 0, 1].

	**For i = 1 (l = 0, r = 2, val = 1):**

		Decrement values at indices [0, 1, 2] by [1, 0, 1] respectively.
		The array will become [0, 0, 0], which is a Zero Array. Therefore, the minimum value of k is 2.

Example 2:

**Input:** nums = [4,3,2,1], queries = [[1,3,2],[0,2,1]]

**Output:** -1

**Explanation:**

	**For i = 0 (l = 1, r = 3, val = 2):**

		Decrement values at indices [1, 2, 3] by [2, 2, 1] respectively.
		The array will become [4, 1, 0, 0].

	**For i = 1 (l = 0, r = 2, val = 1):**

		Decrement values at indices [0, 1, 2] by [1, 1, 0] respectively.
		The array will become [3, 0, 0, 0], which is not a Zero Array.

 

**Constraints:**

	1 <= nums.length <= 105
	0 <= nums[i] <= 5 * 105
	1 <= queries.length <= 105
	queries[i].length == 3
	0 <= li <= ri < nums.length
	1 <= vali <= 5

                            {% raw %}
                            ```python
                            class Solution:
    def minZeroArray(self, nums: List[int], queries: List[List[int]]) -> int:
        n = len(nums)
        left, right = 0, len(queries)

        # Zero array isn't formed after all queries are processed
        if not self.can_form_zero_array(nums, queries, right):
            return -1

        # Binary Search
        while left <= right:
            middle = left + (right - left) // 2
            if self.can_form_zero_array(nums, queries, middle):
                right = middle - 1
            else:
                left = middle + 1

        # Return earliest query that zero array can be formed
        return left

    def can_form_zero_array(
        self, nums: List[int], queries: List[List[int]], k: int
    ) -> bool:
        n = len(nums)
        total_sum = 0
        difference_array = [0] * (n + 1)

        # Process query
        for query_index in range(k):
            start, end, val = queries[query_index]

            # Process start and end of range
            difference_array[start] += val
            difference_array[end + 1] -= val

        # Check if zero array can be formed
        for num_index in range(n):
            total_sum += difference_array[num_index]
            if total_sum < nums[num_index]:
                return False
        return True
                            {% endraw %}
                            