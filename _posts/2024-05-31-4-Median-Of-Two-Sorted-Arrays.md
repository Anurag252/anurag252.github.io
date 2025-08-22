---
            title: "4 Median Of Two Sorted Arrays"
            date: "2024-05-31T18:54:00+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given two sorted arrays nums1 and nums2 of size m and n respectively, return **the median** of the two sorted arrays.

The overall run time complexity should be O(log (m+n)).

 

Example 1:

```

**Input:** nums1 = [1,3], nums2 = [2]
**Output:** 2.00000
**Explanation:** merged array = [1,2,3] and median is 2.

```

Example 2:

```

**Input:** nums1 = [1,2], nums2 = [3,4]
**Output:** 2.50000
**Explanation:** merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

```

 

**Constraints:**

	nums1.length == m
	nums2.length == n
	0 <= m <= 1000
	0 <= n <= 1000
	1 <= m + n <= 2000
	-106 <= nums1[i], nums2[i] <= 106

{% raw %}


```python


class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        i = 0
        j = 0
        newarr = [None] * (len(nums1) + len(nums2))
        t = 0
        while t < len(newarr):
            if i < len(nums1) and j < len(nums2)  and nums1[i] < nums2[j]:
                newarr[t] = nums1[i]
                t = t + 1
                i = i + 1

            elif j < len(nums2)  and i < len(nums1) and   nums1[i] > nums2[j]:
                newarr[t] = nums2[j]
                t = t + 1
                j = j + 1

            elif j < len(nums2):
                newarr[t] = nums2[j]
                t = t + 1
                j = j + 1

            elif i < len(nums1):
                newarr[t] = nums1[i]
                t = t + 1
                i = i + 1
        print(newarr)
        if len(newarr) % 2 == 1:
            return newarr[int(len(newarr)/2)]
        else:
            a = ceil((len(newarr)-1)/2)
            b = floor((len(newarr)-1)/2)
            return (newarr[a] + newarr[b])/2
        return 0.0





{% endraw %}
```
