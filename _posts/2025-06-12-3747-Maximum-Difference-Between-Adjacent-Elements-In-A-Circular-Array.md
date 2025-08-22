---
            title: "3747 Maximum Difference Between Adjacent Elements In A Circular Array"
            date: "2025-06-12T22:03:13+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Difference Between Adjacent Elements in a Circular Array](https://leetcode.com/problems/maximum-difference-between-adjacent-elements-in-a-circular-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given a **circular** array nums, find the **maximum** absolute difference between adjacent elements.

**Note**: In a circular array, the first and last elements are adjacent.

 

Example 1:

**Input:** nums = [1,2,4]

**Output:** 3

**Explanation:**

Because nums is circular, nums[0] and nums[2] are adjacent. They have the maximum absolute difference of |4 - 1| = 3.

Example 2:

**Input:** nums = [-5,-10,-5]

**Output:** 5

**Explanation:**

The adjacent elements nums[0] and nums[1] have the maximum absolute difference of |-5 - (-10)| = 5.

 

**Constraints:**

	2 <= nums.length <= 100
	-100 <= nums[i] <= 100

{% raw %}


```python


class Solution:
    def maxAdjacentDistance(self, nums: List[int]) -> int:
        diff = 0
        for i, k in enumerate(nums):
            diff = max(diff, abs(nums[i-1] - nums[i]))
        return diff




{% endraw %}
