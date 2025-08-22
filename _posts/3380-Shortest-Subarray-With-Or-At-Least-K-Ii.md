---
title: "3380 Shortest Subarray With Or At Least K Ii"
date: "2024-11-10T19:01:34+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Shortest Subarray With OR at Least K II](https://leetcode.com/problems/shortest-subarray-with-or-at-least-k-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given an array nums of **non-negative** integers and an integer k.
  
  An array is called **special** if the bitwise OR of all of its elements is **at least** k.
  
  Return *the length of the **shortest** **special** **non-empty** subarray of* nums, *or return* -1 *if no special subarray exists*.
  
  &nbsp;
  
  Example 1:
  
  **Input:** nums = [1,2,3], k = 2
  
  **Output:** 1
  
  **Explanation:**
  
  The subarray [3] has OR value of 3. Hence, we return 1.
  
  Example 2:
  
  **Input:** nums = [2,1,8], k = 10
  
  **Output:** 3
  
  **Explanation:**
  
  The subarray [2,1,8] has OR value of 11. Hence, we return 3.
  
  Example 3:
  
  **Input:** nums = [1,2], k = 0
  
  **Output:** 1
  
  **Explanation:**
  
  The subarray [1] has OR value of 1. Hence, we return 1.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= nums.length &lt;= 2 * 105
  	0 &lt;= nums[i] &lt;= 109
  	0 &lt;= k &lt;= 109
---

```python
class Solution:
    def minimumSubarrayLength(self, nums: List[int], k: int) -> int:
        min_length = float("inf")
        window_start = window_end = 0
        bit_counts = [0] * 32  # Tracks count of set bits at each position

        # Expand window until end of array
        while window_end < len(nums):
            # Add current number to window
            self._update_bit_counts(bit_counts, nums[window_end], 1)

            # Contract window while OR value is valid
            while (
                window_start <= window_end
                and self._convert_bits_to_num(bit_counts) >= k
            ):
                # Update minimum length found so far
                min_length = min(min_length, window_end - window_start + 1)

                # Remove leftmost number and shrink window
                self._update_bit_counts(bit_counts, nums[window_start], -1)
                window_start += 1

            window_end += 1

        return -1 if min_length == float("inf") else min_length

    def _update_bit_counts(
        self, bit_counts: list, number: int, delta: int
    ) -> None:
        # Update counts for each set bit in the number
        for pos in range(32):
            if number & (1 << pos):
                bit_counts[pos] += delta

    def _convert_bits_to_num(self, bit_counts: list) -> int:
        # Convert bit counts to number using OR operation
        result = 0
        for pos in range(32):
            if bit_counts[pos]:
                result |= 1 << pos
        return result
```