---
            title: "2432 Number Of Zero Filled Subarrays"
            date: "2025-08-19T13:59:51+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Number of Zero-Filled Subarrays](https://leetcode.com/problems/number-of-zero-filled-subarrays) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer array nums, return *the number of **subarrays** filled with *0.

A **subarray** is a contiguous non-empty sequence of elements within an array.

 

Example 1:

```

**Input:** nums = [1,3,0,0,2,0,0,4]
**Output:** 6
**Explanation:** 
There are 4 occurrences of [0] as a subarray.
There are 2 occurrences of [0,0] as a subarray.
There is no occurrence of a subarray with a size more than 2 filled with 0. Therefore, we return 6.
```

Example 2:

```

**Input:** nums = [0,0,0,2,0,0]
**Output:** 9
Explanation:
There are 5 occurrences of [0] as a subarray.
There are 3 occurrences of [0,0] as a subarray.
There is 1 occurrence of [0,0,0] as a subarray.
There is no occurrence of a subarray with a size more than 3 filled with 0. Therefore, we return 9.

```

Example 3:

```

**Input:** nums = [2,10,2019]
**Output:** 0
**Explanation:** There is no subarray filled with 0. Therefore, we return 0.

```

 

**Constraints:**

	1 <= nums.length <= 105
	-109 <= nums[i] <= 109

{% raw %}
```python
class Solution:
    def zeroFilledSubarray(self, nums: List[int]) -> int:
        """
        count the number of contiguous 0s
        and store then in arr
        sum all values from 1 to n
        """
        res = []
        prev = False
        temp = 0
        for k in nums:
            if k == 0:
                temp += 1
            else:
                res.append(temp)
                temp = 0
        if temp > 0:
            res.append(temp)
        ans = 0
        print(res)
        for k in res:
            ans += int((k*(k+1))/2)
        return ans




        
{% endraw %}
