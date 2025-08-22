---
            title: "2699 Count The Number Of Fair Pairs"
            date: "2025-04-19T22:40:57+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Count the Number of Fair Pairs](https://leetcode.com/problems/count-the-number-of-fair-pairs) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a **0-indexed** integer array nums of size n and two integers lower and upper, return *the number of fair pairs*.

A pair (i, j) is **fair **if:

	0 <= i < j < n, and
	lower <= nums[i] + nums[j] <= upper

 

Example 1:

```

**Input:** nums = [0,1,7,4,4,5], lower = 3, upper = 6
**Output:** 6
**Explanation:** There are 6 fair pairs: (0,3), (0,4), (0,5), (1,3), (1,4), and (1,5).

```

Example 2:

```

**Input:** nums = [1,7,9,2,5], lower = 11, upper = 11
**Output:** 1
**Explanation:** There is a single fair pair: (2,3).

```

 

**Constraints:**

	1 <= nums.length <= 105
	nums.length == n
	-109 <= nums[i] <= 109
	-109 <= lower <= upper <= 109

            {% raw %}
            ```python
            class Solution:
    def lower_bound(self, nums, low, high, element):
        while low <= high:
            mid = low + ((high - low) // 2)
            if nums[mid] >= element:
                high = mid - 1
            else:
                low = mid + 1
        return low

    def countFairPairs(self, nums, lower, upper):
        nums.sort()
        ans = 0
        for i in range(len(nums)):
            # Assume we have picked nums[i] as the first pair element.

            # `low` indicates the number of possible pairs with sum < lower.
            low = self.lower_bound(nums, i + 1, len(nums) - 1, lower - nums[i])

            # `high` indicates the number of possible pairs with sum <= upper.
            high = self.lower_bound(
                nums, i + 1, len(nums) - 1, upper - nums[i] + 1
            )

            # Their difference gives the number of elements with sum in the
            # given range.
            ans += high - low

        return ans
            {% endraw %}
            