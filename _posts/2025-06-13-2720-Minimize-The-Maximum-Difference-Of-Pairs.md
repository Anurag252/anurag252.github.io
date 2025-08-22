---
            title: "2720 Minimize The Maximum Difference Of Pairs"
            date: "2025-06-13T10:15:26+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Minimize the Maximum Difference of Pairs](https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array nums and an integer p. Find p pairs of indices of nums such that the **maximum** difference amongst all the pairs is **minimized**. Also, ensure no index appears more than once amongst the p pairs.

Note that for a pair of elements at the index i and j, the difference of this pair is |nums[i] - nums[j]|, where |x| represents the **absolute** **value** of x.

Return *the **minimum** **maximum** difference among all *p *pairs.* We define the maximum of an empty set to be zero.

 

Example 1:

```

**Input:** nums = [10,1,2,7,1,3], p = 2
**Output:** 1
**Explanation:** The first pair is formed from the indices 1 and 4, and the second pair is formed from the indices 2 and 5. 
The maximum difference is max(|nums[1] - nums[4]|, |nums[2] - nums[5]|) = max(0, 1) = 1. Therefore, we return 1.

```

Example 2:

```

**Input:** nums = [4,2,1,2], p = 1
**Output:** 0
**Explanation:** Let the indices 1 and 3 form a pair. The difference of that pair is |2 - 2| = 0, which is the minimum we can attain.

```

 

**Constraints:**

	1 <= nums.length <= 105
	0 <= nums[i] <= 109
	0 <= p <= (nums.length)/2

            {% raw %}
            ```python
            from typing import List
from functools import cache

class Solution:
        def minimizeMax(self, A: List[int], p: int) -> int:
            A.sort()
            n = len(A)
            left, right = 0, A[-1] - A[0]
            while left < right:
                mid = (left + right) // 2
                k = 0
                i = 1
                while i < n:
                    if A[i] - A[i - 1] <= mid:
                        k += 1
                        i += 1
                    i += 1
                if k >= p:
                    right = mid
                else:
                    left = mid + 1
            return left
            {% endraw %}
            