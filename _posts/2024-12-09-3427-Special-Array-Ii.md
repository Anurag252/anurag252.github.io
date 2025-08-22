---
            title: "3427 Special Array Ii"
            date: "2024-12-09T09:17:43+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Special Array II](https://leetcode.com/problems/special-array-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

An array is considered **special** if every pair of its adjacent elements contains two numbers with different parity.

You are given an array of integer nums and a 2D integer matrix queries, where for queries[i] = [fromi, toi] your task is to check that subarray nums[fromi..toi] is **special** or not.

Return an array of booleans answer such that answer[i] is true if nums[fromi..toi] is special.

 

Example 1:

**Input:** nums = [3,4,1,2,6], queries = [[0,4]]

**Output:** [false]

**Explanation:**

The subarray is [3,4,1,2,6]. 2 and 6 are both even.

Example 2:

**Input:** nums = [4,3,1,6], queries = [[0,2],[2,3]]

**Output:** [false,true]

**Explanation:**

	The subarray is [4,3,1]. 3 and 1 are both odd. So the answer to this query is false.
	The subarray is [1,6]. There is only one pair: (1,6) and it contains numbers with different parity. So the answer to this query is true.

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 105
	1 <= queries.length <= 105
	queries[i].length == 2
	0 <= queries[i][0] <= queries[i][1] <= nums.length - 1

{% raw %}


```python


class Solution:
    def isArraySpecial(self, nums: List[int], queries: List[List[int]]) -> List[bool]:
        arr = []

        for k in nums:
            arr.append(k % 2)
        arr2 = [0]
        for idx, k in enumerate(arr):
            if idx + 1 == len(arr):
                break
            arr2.append(k ^ arr[idx + 1])

        temp = 0
        arr1 = []
        for k in arr2:
            temp += k
            arr1.append(temp)
        #print(arr1, arr2, arr)
        result = []
        for k in queries:
            if arr1[k[1]] - arr1[k[0]] == k[1] - k[0]:
                result.append(True)
            else:
                result.append(False)
        return result

        """ 
        1+2 = 3 (od + ev = od)
        2 + 2 = 4 (ev + ev = ev)
        3 + 3 = (od + od = ev)
        diff + 1 ==
        1,0,1,0,0,1,0,1,0
          1,1,1,0,1,1,1,1
          """


{% endraw %}
