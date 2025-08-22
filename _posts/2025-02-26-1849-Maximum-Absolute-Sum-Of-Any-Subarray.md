---
            title: "1849 Maximum Absolute Sum Of Any Subarray"
            date: "2025-02-26T07:13:44+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Absolute Sum of Any Subarray](https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums. The **absolute sum** of a subarray [numsl, numsl+1, ..., numsr-1, numsr] is abs(numsl + numsl+1 + ... + numsr-1 + numsr).

Return *the **maximum** absolute sum of any **(possibly empty)** subarray of *nums.

Note that abs(x) is defined as follows:

	If x is a negative integer, then abs(x) = -x.
	If x is a non-negative integer, then abs(x) = x.

 

Example 1:

```

**Input:** nums = [1,-3,2,3,-4]
**Output:** 5
**Explanation:** The subarray [2,3] has absolute sum = abs(2+3) = abs(5) = 5.

```

Example 2:

```

**Input:** nums = [2,-5,1,-4,3,-2]
**Output:** 8
**Explanation:** The subarray [-5,1,-4] has absolute sum = abs(-5+1-4) = abs(-8) = 8.

```

 

**Constraints:**

	1 <= nums.length <= 105
	-104 <= nums[i] <= 104

{% raw %}


```python


class Solution:
    def maxAbsoluteSum(self, nums: List[int]) -> int:
        # idea is that every time a +ve appears
        # i include it in sum 
        # but if a negative appears , sum until previous number was better 
        # I start fresh ,-> no abs sum can have negative
        # prefix sum , take non absolute sums till index i
        # and then find  index j at max distt from it and find absolute.
        # 2,-3,-2,-6,-3,-5
        # 
        pref_sum = []
        temp = 0
        for k in nums:
            temp += k
            pref_sum.append(temp)

        max_arr = []
        min_arr =[]
        ma = -100000
        mi = 100000
        for i, k in enumerate(pref_sum):
            ma = max(ma, k)
            mi = min(mi, k)
            max_arr.append(ma)
            min_arr.append(mi)
        #print(pref_sum, max_arr, min_arr)
        res = 0
        for i, k in enumerate(pref_sum):
                res = max(res, abs(k - max_arr[i]) , abs(k - min_arr[i]), abs(k))
        return res


        


{% endraw %}
```
