---
            title: "2614 Maximum Count Of Positive Integer And Negative Integer"
            date: "2025-03-12T10:28:00+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Count of Positive Integer and Negative Integer](https://leetcode.com/problems/maximum-count-of-positive-integer-and-negative-integer) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array nums sorted in **non-decreasing** order, return *the maximum between the number of positive integers and the number of negative integers.*

	In other words, if the number of positive integers in nums is pos and the number of negative integers is neg, then return the maximum of pos and neg.

**Note** that 0 is neither positive nor negative.

 

Example 1:

```

**Input:** nums = [-2,-1,-1,1,2,3]
**Output:** 3
**Explanation:** There are 3 positive integers and 3 negative integers. The maximum count among them is 3.

```

Example 2:

```

**Input:** nums = [-3,-2,-1,0,0,1,2]
**Output:** 3
**Explanation:** There are 2 positive integers and 3 negative integers. The maximum count among them is 3.

```

Example 3:

```

**Input:** nums = [5,20,66,1314]
**Output:** 4
**Explanation:** There are 4 positive integers and 0 negative integers. The maximum count among them is 4.

```

 

**Constraints:**

	1 <= nums.length <= 2000
	-2000 <= nums[i] <= 2000
	nums is sorted in a **non-decreasing order**.

 

**Follow up:** Can you solve the problem in O(log(n)) time complexity?

{% raw %}
```python
class Solution:
    def maximumCount(self, nums: List[int]) -> int:

        if len(nums) == 1:
            return 1 if nums[0] != 0 else 0
        res = 0
        left = 0
        right = len(nums)-1
        while(left + 1 < right):
            
            mid = (left + right) // 2
            if nums[mid] == 0:
                while( mid < len(nums) and nums[mid] == 0):
                    mid += 1
                right = mid
                mid -= 1
                while(mid >= 0 and nums[mid] == 0):
                    mid -= 1
                left = mid
                break

            if nums[mid] < 0:
                left = mid
            else:
                right = mid

        
        if right == len(nums) - 1 and nums[right] < 0: 
            return left + 1 + 1
        if left == 0 and nums[left] > 0:
            return len(nums) - right + 1

        return max(left + 1, len(nums) - right)



        
{% endraw %}
