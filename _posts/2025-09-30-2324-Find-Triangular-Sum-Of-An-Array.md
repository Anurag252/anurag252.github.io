---
            title: "2324 Find Triangular Sum Of An Array"
            date: "2025-09-30T15:10:12+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Find Triangular Sum of an Array](https://leetcode.com/problems/find-triangular-sum-of-an-array) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array nums, where nums[i] is a digit between 0 and 9 (**inclusive**).

The **triangular sum** of nums is the value of the only element present in nums after the following process terminates:

	Let nums comprise of n elements. If n == 1, **end** the process. Otherwise, **create** a new **0-indexed** integer array newNums of length n - 1.
	For each index i, where 0 <= i < n - 1, **assign** the value of newNums[i] as (nums[i] + nums[i+1]) % 10, where % denotes modulo operator.
	**Replace** the array nums with newNums.
	**Repeat** the entire process starting from step 1.

Return *the triangular sum of* nums.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2022/02/22/ex1drawio.png)
```

**Input:** nums = [1,2,3,4,5]
**Output:** 8
**Explanation:**
The above diagram depicts the process from which we obtain the triangular sum of the array.
```

Example 2:

```

**Input:** nums = [5]
**Output:** 5
**Explanation:**
Since there is only one element in nums, the triangular sum is the value of that element itself.
```

 

**Constraints:**

	1 <= nums.length <= 1000
	0 <= nums[i] <= 9

{% raw %}


```python


class Solution:
    def triangularSum(self, nums: List[int]) -> int:
        """
        1
        1 1
        1 2 1 | 1 2 1 - 1 3 3 1
        1 3 3 1 | 1 3 3 1 - 
        1 4 6 4 1
        1 5 10 10 5 1
        1 2*prev 3*prev
        """

        l = len(nums)

        def recurse(nums):
            if len(nums) == 1:
                return nums[0] % 10
            arr = []
            for i in range(0, len(nums)-1):
                arr.append( (nums[i] + nums[i+1]) % 10)
            return recurse(arr)
        return recurse(nums)





{% endraw %}
```
