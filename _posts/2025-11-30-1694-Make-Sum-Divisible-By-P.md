---
            title: "1694 Make Sum Divisible By P"
            date: "2025-11-30T21:27:56+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Make Sum Divisible by P](https://leetcode.com/problems/make-sum-divisible-by-p) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an array of positive integers nums, remove the **smallest** subarray (possibly **empty**) such that the **sum** of the remaining elements is divisible by p. It is **not** allowed to remove the whole array.

Return *the length of the smallest subarray that you need to remove, or *-1* if it's impossible*.

A **subarray** is defined as a contiguous block of elements in the array.

 

Example 1:

```

**Input:** nums = [3,1,4,2], p = 6
**Output:** 1
**Explanation:** The sum of the elements in nums is 10, which is not divisible by 6. We can remove the subarray [4], and the sum of the remaining elements is 6, which is divisible by 6.

```

Example 2:

```

**Input:** nums = [6,3,5,2], p = 9
**Output:** 2
**Explanation:** We cannot remove a single element to get a sum divisible by 9. The best way is to remove the subarray [5,2], leaving us with [6,3] with sum 9.

```

Example 3:

```

**Input:** nums = [1,2,3], p = 3
**Output:** 0
**Explanation:** Here the sum is 6. which is already divisible by 3. Thus we do not need to remove anything.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 109
	1 <= p <= 109

{% raw %}


```python


class Solution:
    def minSubarray(self, nums: List[int], p: int) -> int:
        n = len(nums)
        total_sum = 0

        # Step 1: Calculate total sum and target remainder
        for num in nums:
            total_sum = (total_sum + num) % p

        target = total_sum % p
        if target == 0:
            return 0  # The array is already divisible by p

        # Step 2: Use a dict to track prefix sum mod p
        mod_map = {
            0: -1
        }  # To handle the case where the whole prefix is the answer
        current_sum = 0
        min_len = n

        # Step 3: Iterate over the array
        for i in range(n):
            current_sum = (current_sum + nums[i]) % p

            # Calculate what we need to remove
            needed = (current_sum - target + p) % p

            # If we have seen the needed remainder, we can consider this subarray
            if needed in mod_map:
                min_len = min(min_len, i - mod_map[needed])

            # Store the current remainder and index
            mod_map[current_sum] = i

        # Step 4: Return result
        return -1 if min_len == n else min_len


{% endraw %}
```
