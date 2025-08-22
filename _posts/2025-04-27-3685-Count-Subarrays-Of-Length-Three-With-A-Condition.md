---
            title: "3685 Count Subarrays Of Length Three With A Condition"
            date: "2025-04-27T09:38:06+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Subarrays of Length Three With a Condition](https://leetcode.com/problems/count-subarrays-of-length-three-with-a-condition) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an integer array nums, return the number of subarrays of length 3 such that the sum of the first and third numbers equals *exactly* half of the second number.

 

Example 1:

**Input:** nums = [1,2,1,4,1]

**Output:** 1

**Explanation:**

Only the subarray [1,4,1] contains exactly 3 elements where the sum of the first and third numbers equals half the middle number.

Example 2:

**Input:** nums = [1,1,1]

**Output:** 0

**Explanation:**

[1,1,1] is the only subarray of length 3. However, its first and third numbers do not add to half the middle number.

 

**Constraints:**

	3 <= nums.length <= 100
	-100 <= nums[i] <= 100

{% raw %}


```python


class Solution:
    def countSubarrays(self, nums: List[int]) -> int:
        left = 0
        right = 2
        res = 0
        while(right < len(nums)):
            if 2 * (nums[left] + nums[right]) == nums[left + 1]:
                res += 1
            left += 1
            right += 1

        return res

        


{% endraw %}
```
