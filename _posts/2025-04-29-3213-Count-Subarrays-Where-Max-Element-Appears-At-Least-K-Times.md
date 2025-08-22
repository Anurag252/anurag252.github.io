---
            title: "3213 Count Subarrays Where Max Element Appears At Least K Times"
            date: "2025-04-29T09:53:25+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Subarrays Where Max Element Appears at Least K Times](https://leetcode.com/problems/count-subarrays-where-max-element-appears-at-least-k-times) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums and a **positive** integer k.

Return *the number of subarrays where the **maximum** element of *nums* appears **at least** *k* times in that subarray.*

A **subarray** is a contiguous sequence of elements within an array.

 

Example 1:

```

**Input:** nums = [1,3,2,3,3], k = 2
**Output:** 6
**Explanation:** The subarrays that contain the element 3 at least 2 times are: [1,3,2,3], [1,3,2,3,3], [3,2,3], [3,2,3,3], [2,3,3] and [3,3].

```

Example 2:

```

**Input:** nums = [1,4,2,1], k = 3
**Output:** 0
**Explanation:** No subarray contains the element 4 at least 3 times.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 106
	1 <= k <= 105

{% raw %}


```python


class Solution:
    def countSubarrays(self, nums: List[int], k: int) -> int:
        max_element = max(nums)
        indexes_of_max_elements = []
        ans = 0

        for index, element in enumerate(nums):

            if element == max_element:
                indexes_of_max_elements.append(index)

            freq = len(indexes_of_max_elements)
            if freq >= k:
                ans += indexes_of_max_elements[-k] + 1

        return ans


{% endraw %}
```
