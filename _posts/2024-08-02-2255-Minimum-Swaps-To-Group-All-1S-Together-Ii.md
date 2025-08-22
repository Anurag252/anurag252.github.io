---
            title: "2255 Minimum Swaps To Group All 1S Together Ii"
            date: "2024-08-02T08:40:06+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Swaps to Group All 1's Together II](https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A **swap** is defined as taking two **distinct** positions in an array and swapping the values in them.

A **circular** array is defined as an array where we consider the **first** element and the **last** element to be **adjacent**.

Given a **binary** **circular** array nums, return *the minimum number of swaps required to group all *1*'s present in the array together at **any location***.

 

Example 1:

```

**Input:** nums = [0,1,0,1,1,0,0]
**Output:** 1
**Explanation:** Here are a few of the ways to group all the 1's together:
[0,0,1,1,1,0,0] using 1 swap.
[0,1,1,1,0,0,0] using 1 swap.
[1,1,0,0,0,0,1] using 2 swaps (using the circular property of the array).
There is no way to group all 1's together with 0 swaps.
Thus, the minimum number of swaps required is 1.

```

Example 2:

```

**Input:** nums = [0,1,1,1,0,0,1,1,0]
**Output:** 2
**Explanation:** Here are a few of the ways to group all the 1's together:
[1,1,1,0,0,0,0,1,1] using 2 swaps (using the circular property of the array).
[1,1,1,1,1,0,0,0,0] using 2 swaps.
There is no way to group all 1's together with 0 or 1 swaps.
Thus, the minimum number of swaps required is 2.

```

Example 3:

```

**Input:** nums = [1,1,0,0,1]
**Output:** 0
**Explanation:** All the 1's are already grouped together due to the circular property of the array.
Thus, the minimum number of swaps required is 0.

```

 

**Constraints:**

	1 <= nums.length <= 105
	nums[i] is either 0 or 1.

{% raw %}
```python
class Solution:
    def minSwaps(self, nums: List[int]) -> int:
        op1 = self.min_swaps_helper(nums, 0)  # Grouping all 0s together
        op2 = self.min_swaps_helper(nums, 1)  # Grouping all 1s together
        return min(op1, op2)

    def min_swaps_helper(self, data: List[int], val: int) -> int:
        length = len(data)
        right_suffix_sum = [0] * (length + 1)

        # Construct the suffix sum array for counting opposite values
        # (val ^ 1)
        for i in range(length - 1, -1, -1):
            right_suffix_sum[i] = right_suffix_sum[i + 1]
            if data[i] == (val ^ 1):
                right_suffix_sum[i] += 1

        # Total zeros in the array if `val` is 1 (or vice versa)
        total_swaps_needed = right_suffix_sum[0]
        # Track current number of required swaps in the current segment
        current_swap_count = 0
        minimum_swaps = (
            total_swaps_needed - right_suffix_sum[length - total_swaps_needed]
        )

        # Iterate to find the minimum swaps by sliding
        # the potential block of grouped `val`
        for i in range(total_swaps_needed):
            if data[i] == (val ^ 1):
                current_swap_count += 1
            remaining = total_swaps_needed - i - 1
            required_swaps = ((i + 1) - current_swap_count) + (
                remaining - right_suffix_sum[length - remaining]
            )
            minimum_swaps = min(minimum_swaps, required_swaps)
        return minimum_swaps
{% endraw %}
