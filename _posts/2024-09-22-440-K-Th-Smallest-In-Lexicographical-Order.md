---
title: "440 K Th Smallest In Lexicographical Order"
date: "2024-09-22T10:23:44+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [K-th Smallest in Lexicographical Order](https://leetcode.com/problems/k-th-smallest-in-lexicographical-order) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given two integers n and k, return *the* kth *lexicographically smallest integer in the range* [1, n].

 

Example 1:

```

**Input:** n = 13, k = 2
**Output:** 10
**Explanation:** The lexicographical order is [1, 10, 11, 12, 13, 2, 3, 4, 5, 6, 7, 8, 9], so the second smallest number is 10.

```

Example 2:

```

**Input:** n = 1, k = 1
**Output:** 1

```

 

**Constraints:**

	1 <= k <= n <= 109

```python
class Solution:
    def findKthNumber(self, n: int, k: int) -> int:
        # Function to count the numbers under the prefix `m`
        def count_prefix(m, n):
            count = 0
            current = m
            next_ = m + 1  # The next prefix to check
            
            while current <= n:
                count += min(n + 1, next_) - current
                current *= 10
                next_ *= 10
            return count

        # Start from the smallest prefix `1`
        current = 1
        k -= 1  # Adjust k for 0-indexing

        while k > 0:
            count = count_prefix(current, n)  # Count the numbers under `current` prefix

            if k >= count:
                # If k is greater than or equal to the count, we skip this prefix
                k -= count
                current += 1  # Move to the next prefix
            else:
                # If k is less than the count, we go deeper into the current prefix
                current *= 10  # Go to the next level down
                k -= 1  # Account for moving into the next level

        return current

```