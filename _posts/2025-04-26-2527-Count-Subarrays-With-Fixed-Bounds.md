---
            title: "2527 Count Subarrays With Fixed Bounds"
            date: "2025-04-26T13:13:50+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Subarrays With Fixed Bounds](https://leetcode.com/problems/count-subarrays-with-fixed-bounds) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given an integer array nums and two integers minK and maxK.

A **fixed-bound subarray** of nums is a subarray that satisfies the following conditions:

	The **minimum** value in the subarray is equal to minK.
	The **maximum** value in the subarray is equal to maxK.

Return *the **number** of fixed-bound subarrays*.

A **subarray** is a **contiguous** part of an array.

 

Example 1:

```

**Input:** nums = [1,3,5,2,7,5], minK = 1, maxK = 5
**Output:** 2
**Explanation:** The fixed-bound subarrays are [1,3,5] and [1,3,5,2].

```

Example 2:

```

**Input:** nums = [1,1,1,1], minK = 1, maxK = 1
**Output:** 10
**Explanation:** Every subarray of nums is a fixed-bound subarray. There are 10 possible subarrays.

```

 

**Constraints:**

	2 <= nums.length <= 105
	1 <= nums[i], minK, maxK <= 106

{% raw %}


```python


class Solution:
    def countSubarrays(self, nums: List[int], minK: int, maxK: int) -> int:
        # consider the elements mark min and max
        # also mark lower and upper numbers as 0  
        # now we need sub arrays that include min amd max - a....b...c...d -> d - a 
        # other possibility is a .... b ....d....c -? no subarray 
        for i, k in enumerate(nums):
            if k < minK or k > maxK:
                nums[i] = 0

        left = 0
        right = 0
        founda = -1  # Index of last minK
        foundb = -1  # Index of last maxK
        res = 0
        nums = [0] + nums + [0]  # Add boundary zeros

        for i in range(len(nums)):
            if nums[i] == 0:
                left = i
                founda = -1
                foundb = -1
            else:
                if nums[i] == minK:
                    founda = i
                if nums[i] == maxK:
                    foundb = i
                if founda != -1 and foundb != -1:
                    res += min(founda, foundb) - left

        return res
        

            

            

            

        


{% endraw %}
```
