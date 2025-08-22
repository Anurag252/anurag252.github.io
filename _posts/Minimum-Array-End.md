---
title: "Minimum Array End"
date: "2024-11-09T09:04:30+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 5 ms (27.66%) | Memory: 16.7 MB (33.33%) - LeetSync"
---

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

```