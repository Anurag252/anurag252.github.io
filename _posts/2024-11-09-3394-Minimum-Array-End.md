---
            title: "3394 Minimum Array End"
            date: "2024-11-09T09:04:30+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Array End](https://leetcode.com/problems/minimum-array-end) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two integers n and x. You have to construct an array of **positive** integers nums of size n where for every 0 <= i < n - 1, nums[i + 1] is **greater than** nums[i], and the result of the bitwise AND operation between all elements of nums is x.

Return the **minimum** possible value of nums[n - 1].

 

Example 1:

**Input:** n = 3, x = 4

**Output:** 6

**Explanation:**

nums can be [4,5,6] and its last element is 6.

Example 2:

**Input:** n = 2, x = 7

**Output:** 15

**Explanation:**

nums can be [7,15] and its last element is 15.

 

**Constraints:**

	1 <= n, x <= 108

{% raw %}


```python


class Solution:
    def minEnd(self, n: int, x: int) -> int:
        # Identify positions of zero bits in `x`
        zero_positions = []
        bit_position = 0
        temp_x = x

        # Record all positions where `x` has zero bits
        while temp_x > 0 or bit_position < 64:  # Considering 32-bit integers for general cases
            if (temp_x & 1) == 0:
                zero_positions.append(bit_position)
            temp_x >>= 1
            bit_position += 1

        # Generate the nth valid number by filling zero bit positions in all combinations up to `n`
        result = x
        for i in range(len(zero_positions)):
            # If the i-th bit in `n-1` is set, we flip the corresponding zero bit position in `result`
            if (n - 1) & (1 << i):
                result |= (1 << zero_positions[i])

        return result



{% endraw %}
