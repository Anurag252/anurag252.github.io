---
            title: "1586 Longest Subarray Of 1S After Deleting One Element"
            date: "2025-08-24T11:29:31+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Longest Subarray of 1's After Deleting One Element](https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a binary array nums, you should delete one element from it.

Return *the size of the longest non-empty subarray containing only *1*'s in the resulting array*. Return 0 if there is no such subarray.

 

Example 1:

```

**Input:** nums = [1,1,0,1]
**Output:** 3
**Explanation:** After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.

```

Example 2:

```

**Input:** nums = [0,1,1,1,0,1,1,0,1]
**Output:** 5
**Explanation:** After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].

```

Example 3:

```

**Input:** nums = [1,1,1]
**Output:** 2
**Explanation:** You must delete one element.

```

 

**Constraints:**

	1 <= nums.length <= 105
	nums[i] is either 0 or 1.

{% raw %}


```python


class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        pref = []
        suff = []
        temp = 0
        for k in nums:
            if k == 0:
                temp = 0
            else:
                temp += 1
            pref.append(temp)
        temp = 0
        for k in nums[::-1]:
            if k == 0:
                temp = 0
            else:
                temp += 1
            suff.append(temp)
        suff.reverse()
        print(nums, pref)
        try:
            nums.index(0) # no zeros
            res = 0
            for i, k in enumerate(nums):
                if k == 0 and i + 1 < len(suff) and i - 1 >= 0 :
                    res = max(res, pref[i-1] + suff[i+1])
                elif k == 0 :
                    if i + 1 >= 0:
                        res = max(res, pref[i-1])
                    else:
                        rews = max(res, suff[i+1])
            return res
        except:
             return sum(nums) - 1



        


{% endraw %}
```
