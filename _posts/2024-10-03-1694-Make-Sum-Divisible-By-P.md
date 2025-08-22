---
            title: "1694 Make Sum Divisible By P"
            date: "2024-10-03T08:49:43+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Make Sum Divisible by P](https://leetcode.com/problems/make-sum-divisible-by-p) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an array of positive integers nums, remove the **smallest** subarray (possibly **empty**) such that the **sum** of the remaining elements is divisible by p. It is **not** allowed to remove the whole array.

Return *the length of the smallest subarray that you need to remove, or *-1* if it's impossible*.

A **subarray** is defined as a contiguous block of elements in the array.

 

Example 1:

```

**Input:** nums = [3,1,4,2], p = 6
**Output:** 1
**Explanation:** The sum of the elements in nums is 10, which is not divisible by 6. We can remove the subarray [4], and the sum of the remaining elements is 6, which is divisible by 6.

```

Example 2:

```

**Input:** nums = [6,3,5,2], p = 9
**Output:** 2
**Explanation:** We cannot remove a single element to get a sum divisible by 9. The best way is to remove the subarray [5,2], leaving us with [6,3] with sum 9.

```

Example 3:

```

**Input:** nums = [1,2,3], p = 3
**Output:** 0
**Explanation:** Here the sum is 6. which is already divisible by 3. Thus we do not need to remove anything.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 109
	1 <= p <= 109

{% raw %}


```python


class Solution:
    def minSubarray(self, nums: List[int], p: int) -> int:
        prefix_sum = []
        suffix_sum = []
        temp = 0
        for k in nums:
            temp += k
            prefix_sum.append(temp%p)
            
        #prefix_sum.append(temp)

        temp = 0
        for k in nums[::-1]:
            temp += k
            suffix_sum.append(temp%p)
            
        #suffix_sum.append(temp)

        map = {}
        result = 10**5
        for idx,k in enumerate(prefix_sum):
            if k == 0:
                result = min(result, len(nums) - idx-1)
            if k in map:
                map[k].append(idx)
            else:
                map[k] = [idx]
           
        for idx,k in enumerate(suffix_sum[::-1]):
            if k == 0:
                result = min(result, idx)
            if p-k in map:
                for m in map[p-k]:
                    if m < idx:
                        result = min(result, idx-m-1)
        return result if result < 10 ** 5 else -1





        


{% endraw %}
