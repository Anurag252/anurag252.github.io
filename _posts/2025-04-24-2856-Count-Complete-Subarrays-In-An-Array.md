---
            title: "2856 Count Complete Subarrays In An Array"
            date: "2025-04-24T23:01:37+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Complete Subarrays in an Array](https://leetcode.com/problems/count-complete-subarrays-in-an-array) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array nums consisting of **positive** integers.

We call a subarray of an array **complete** if the following condition is satisfied:

	The number of **distinct** elements in the subarray is equal to the number of distinct elements in the whole array.

Return *the number of **complete** subarrays*.

A **subarray** is a contiguous non-empty part of an array.

 

Example 1:

```

**Input:** nums = [1,3,1,2,2]
**Output:** 4
**Explanation:** The complete subarrays are the following: [1,3,1,2], [1,3,1,2,2], [3,1,2] and [3,1,2,2].

```

Example 2:

```

**Input:** nums = [5,5,5,5]
**Output:** 10
**Explanation:** The array consists only of the integer 5, so any subarray is complete. The number of subarrays that we can choose is 10.

```

 

**Constraints:**

	1 <= nums.length <= 1000
	1 <= nums[i] <= 2000

{% raw %}


```python


class Solution:
    def countCompleteSubarrays(self, nums: List[int]) -> int:
        s = set(nums)
        unique = len(s)
        res = 0
        for i , k in enumerate(nums):
            a = set()
            for j , l in enumerate(nums[i:]):
                a.add(l)
                if len(a) == unique:
                    res += (len(nums) - j - i)
                    break
        return res




        


{% endraw %}
