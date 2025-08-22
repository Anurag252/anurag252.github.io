---
            title: "3522 Find The Power Of K Size Subarrays I"
            date: "2024-11-16T10:59:48+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Find the Power of K-Size Subarrays I](https://leetcode.com/problems/find-the-power-of-k-size-subarrays-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array of integers nums of length n and a *positive* integer k.

The **power** of an array is defined as:

	Its **maximum** element if *all* of its elements are **consecutive** and **sorted** in **ascending** order.
	-1 otherwise.

You need to find the **power** of all subarrays of nums of size k.

Return an integer array results of size n - k + 1, where results[i] is the *power* of nums[i..(i + k - 1)].

 

Example 1:

**Input:** nums = [1,2,3,4,3,2,5], k = 3

**Output:** [3,4,-1,-1,-1]

**Explanation:**

There are 5 subarrays of nums of size 3:

	[1, 2, 3] with the maximum element 3.
	[2, 3, 4] with the maximum element 4.
	[3, 4, 3] whose elements are **not** consecutive.
	[4, 3, 2] whose elements are **not** sorted.
	[3, 2, 5] whose elements are **not** consecutive.

Example 2:

**Input:** nums = [2,2,2,2,2], k = 4

**Output:** [-1,-1]

Example 3:

**Input:** nums = [3,2,3,2,3,2], k = 2

**Output:** [-1,3,-1,3,-1]

 

**Constraints:**

	1 <= n == nums.length <= 500
	1 <= nums[i] <= 105
	1 <= k <= n

{% raw %}


```python


class Solution:
    def resultsArray(self, nums: List[int], k: int) -> List[int]:

        left = 0
        right = 1
        result = []
        prev = False
        count = 1
        if len(nums) == 1:
            return nums

        if k == 1:
            return nums
        while(right < len(nums)):
            if nums[right] == nums[right-1] + 1:
                count += 1
                if count == k:
                    left += 1
                    count -= 1
                    result.append(nums[right])
            else:
                for a in range(0, right - left):
                    #print(a)
                    result.append(-1)
                left = right
                count = 1
            
            right += 1
        return result[:len(nums) - k + 1]








        


{% endraw %}
```
