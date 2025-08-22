---
            title: "2552 Maximum Sum Of Distinct Subarrays With Length K"
            date: "2024-11-19T09:03:25+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Sum of Distinct Subarrays With Length K](https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums and an integer k. Find the maximum subarray sum of all the subarrays of nums that meet the following conditions:

	The length of the subarray is k, and
	All the elements of the subarray are **distinct**.

Return *the maximum subarray sum of all the subarrays that meet the conditions**.* If no subarray meets the conditions, return 0.

*A **subarray** is a contiguous non-empty sequence of elements within an array.*

 

Example 1:

```

**Input:** nums = [1,5,4,2,9,9,9], k = 3
**Output:** 15
**Explanation:** The subarrays of nums with length 3 are:
- [1,5,4] which meets the requirements and has a sum of 10.
- [5,4,2] which meets the requirements and has a sum of 11.
- [4,2,9] which meets the requirements and has a sum of 15.
- [2,9,9] which does not meet the requirements because the element 9 is repeated.
- [9,9,9] which does not meet the requirements because the element 9 is repeated.
We return 15 because it is the maximum subarray sum of all the subarrays that meet the conditions

```

Example 2:

```

**Input:** nums = [4,4,4], k = 3
**Output:** 0
**Explanation:** The subarrays of nums with length 3 are:
- [4,4,4] which does not meet the requirements because the element 4 is repeated.
We return 0 because no subarrays meet the conditions.

```

 

**Constraints:**

	1 <= k <= nums.length <= 105
	1 <= nums[i] <= 105

{% raw %}


```python


class Solution:
    def maximumSubarraySum(self, nums: List[int], k: int) -> int:
        s = sum(nums[:k])
        dic = {}
        for m in nums[:k]:
            if m not in dic:
                dic[m] = 1
            else:
                dic[m] += 1
        
        print(nums[:k])
        start = 0
        ans = 0
        
        while(start + k < len(nums) ):
            #print(s, sum(arr))
            if len(dic) == k:
                ans = max(ans, s)
            s -= nums[start]
            dic[nums[start]] -= 1
            if dic[nums[start]] == 0:
                del dic[nums[start]]
 
            s += nums[start + k]
            if nums[start + k] not in dic:
                dic[nums[start + k]] = 1
            else:
                dic[nums[start + k]] += 1
            start += 1
            

        if len(dic) == k:
                ans = max(ans, s)
        return ans




{% endraw %}
```
