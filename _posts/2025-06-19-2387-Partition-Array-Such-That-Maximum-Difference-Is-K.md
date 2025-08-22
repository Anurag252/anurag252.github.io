---
            title: "2387 Partition Array Such That Maximum Difference Is K"
            date: "2025-06-19T07:24:12+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Partition Array Such That Maximum Difference Is K](https://leetcode.com/problems/partition-array-such-that-maximum-difference-is-k) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums and an integer k. You may partition nums into one or more **subsequences** such that each element in nums appears in **exactly** one of the subsequences.

Return *the **minimum **number of subsequences needed such that the difference between the maximum and minimum values in each subsequence is **at most** *k*.*

A **subsequence** is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

 

Example 1:

```

**Input:** nums = [3,6,1,2,5], k = 2
**Output:** 2
**Explanation:**
We can partition nums into the two subsequences [3,1,2] and [6,5].
The difference between the maximum and minimum value in the first subsequence is 3 - 1 = 2.
The difference between the maximum and minimum value in the second subsequence is 6 - 5 = 1.
Since two subsequences were created, we return 2. It can be shown that 2 is the minimum number of subsequences needed.

```

Example 2:

```

**Input:** nums = [1,2,3], k = 1
**Output:** 2
**Explanation:**
We can partition nums into the two subsequences [1,2] and [3].
The difference between the maximum and minimum value in the first subsequence is 2 - 1 = 1.
The difference between the maximum and minimum value in the second subsequence is 3 - 3 = 0.
Since two subsequences were created, we return 2. Note that another optimal solution is to partition nums into the two subsequences [1] and [2,3].

```

Example 3:

```

**Input:** nums = [2,2,4,5], k = 0
**Output:** 3
**Explanation:**
We can partition nums into the three subsequences [2,2], [4], and [5].
The difference between the maximum and minimum value in the first subsequences is 2 - 2 = 0.
The difference between the maximum and minimum value in the second subsequences is 4 - 4 = 0.
The difference between the maximum and minimum value in the third subsequences is 5 - 5 = 0.
Since three subsequences were created, we return 3. It can be shown that 3 is the minimum number of subsequences needed.

```

 

**Constraints:**

	1 <= nums.length <= 105
	0 <= nums[i] <= 105
	0 <= k <= 105

{% raw %}


```python


class Solution:
    def partitionArray(self, nums: List[int], k: int) -> int:
        """
        what if we went greedy, for every subsequence keep taking all
        elems , till max and min is satified
        and leave others
        is this union find ?
        find all nodes that at at most k 
        this approach is n2
        greedy does not work in case
        3,5,6,1,2-
        3,5 | 6 | 1,2
        5,6 | 3,1,2
        starting at index i, take longest subsequence, this greedy works
        /////// missed that sorting already works, I assumed soring will
        ////// only work for grps, rest was fine
        """
        nums.sort()
        grps = 1
        curr_min, curr_max = nums[0], nums[0]
        for k1 in nums:
            if k1 - curr_min <= k and k1 - curr_max <= k:
                curr_max = k1
                continue
            else:
                grps += 1
                curr_min = k1
                curr_max = k1
        return grps







        


{% endraw %}
```
