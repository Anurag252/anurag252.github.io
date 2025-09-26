---
            title: "611 Valid Triangle Number"
            date: "2025-09-26T22:30:55+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Valid Triangle Number](https://leetcode.com/problems/valid-triangle-number) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer array nums, return *the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle*.

 

Example 1:

```

**Input:** nums = [2,2,3,4]
**Output:** 3
**Explanation:** Valid combinations are: 
2,3,4 (using the first 2)
2,3,4 (using the second 2)
2,2,3

```

Example 2:

```

**Input:** nums = [4,2,3,4]
**Output:** 4

```

 

**Constraints:**

	1 <= nums.length <= 1000
	0 <= nums[i] <= 1000

{% raw %}


```python


class Solution:
    def triangleNumber(self, nums: List[int]) -> int:
        nums.sort()
        res = 0

        def search_bin(nums, s, j):
            left = 0
            right = len(nums) - 1

            while(left < right):
                mid = (left + right) // 2
                if nums[mid] > s:
                    right = mid - 1
                else:
                    left = mid + 1
            while left >= 0 and nums[left] >= s:
                left -= 1
            #print(left - j, left, "ll")
            return left - j if left - j >= 0 else 0


        for i, k in enumerate(nums):
            for j, l in enumerate(nums[i+1:]):
                #print(j + i + 1)
                res += search_bin(nums, k + l, j + i + 1)
                #print(res, k, l)
        return res



{% endraw %}
```
