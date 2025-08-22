---
            title: "1631 Number Of Sub Arrays With Odd Sum"
            date: "2025-02-25T06:09:47+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Number of Sub-arrays With Odd Sum](https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an array of integers arr, return *the number of subarrays with an **odd** sum*.

Since the answer can be very large, return it modulo 109 + 7.

 

Example 1:

```

**Input:** arr = [1,3,5]
**Output:** 4
**Explanation:** All subarrays are [[1],[1,3],[1,3,5],[3],[3,5],[5]]
All sub-arrays sum are [1,4,9,3,8,5].
Odd sums are [1,9,3,5] so the answer is 4.

```

Example 2:

```

**Input:** arr = [2,4,6]
**Output:** 0
**Explanation:** All subarrays are [[2],[2,4],[2,4,6],[4],[4,6],[6]]
All sub-arrays sum are [2,6,12,4,10,6].
All sub-arrays have even sum and the answer is 0.

```

Example 3:

```

**Input:** arr = [1,2,3,4,5,6,7]
**Output:** 16

```

 

**Constraints:**

	1 <= arr.length <= 105
	1 <= arr[i] <= 100

{% raw %}
```python
class Solution:
    def numOfSubarrays(self, arr: List[int]) -> int:
        # odd sum is odd + even, but odd + odd is even
        # prefix sum can give sum till n
        # but diff between i and j of prefix sum may not work fo 10^5 input
        # if we have an even at i in prefix sum, we need a preious odd
        # if we have an add at i in prefix sum, we need a preious even
        # so at every i , if its even see total odd at i-1 , add diff to result

        pref_sum = []
        temp = 0
        for k in arr:
            temp += k
            pref_sum.append(temp)
        
        odds = []
        evens = []
        odd = 0
        even = 0
        for k in pref_sum:
            if k % 2 == 0:
                even += 1
            else:
                odd += 1 # check zero
            odds.append(odd)
            evens.append(even)
        
        res = 0
        for i, k in enumerate(pref_sum):
            if i == 0:
                continue
            if k % 2 == 0:
                res += odds[i-1]
            else:
                res += evens[i-1]
            res = res % (pow(10,9)+ 7)

        return (res + odd) % (pow(10,9) + 7)
        


        
{% endraw %}
