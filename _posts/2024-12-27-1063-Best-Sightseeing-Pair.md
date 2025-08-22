---
            title: "1063 Best Sightseeing Pair"
            date: "2024-12-27T08:55:21+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Best Sightseeing Pair](https://leetcode.com/problems/best-sightseeing-pair) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array values where values[i] represents the value of the ith sightseeing spot. Two sightseeing spots i and j have a **distance** j - i between them.

The score of a pair (i < j) of sightseeing spots is values[i] + values[j] + i - j: the sum of the values of the sightseeing spots, minus the distance between them.

Return *the maximum score of a pair of sightseeing spots*.

 

Example 1:

```

**Input:** values = [8,1,5,2,6]
**Output:** 11
**Explanation:** i = 0, j = 2, values[i] + values[j] + i - j = 8 + 5 + 0 - 2 = 11

```

Example 2:

```

**Input:** values = [1,2]
**Output:** 2

```

 

**Constraints:**

	2 <= values.length <= 5 * 104
	1 <= values[i] <= 1000

{% raw %}


```python


class Solution:
    def maxScoreSightseeingPair(self, values: List[int]) -> int:
        # maximize the value and minimize the gap
        # closest one and has largest value preferably/not necessarily larger than itself
        st = []

        addn = []

        subs = []

        pref_sum = [0] * len(values) 

        temp = -10 ** 8
        for idx, k in enumerate(values):
            addn.append(k + idx)

        for idx, k in enumerate(values):
            subs.append(k - idx)
        #print(subs)

        for idx, k in enumerate(subs[::-1]):
            if k > temp:
                temp = k
                #print(len(subs) - 1 - idx)
            pref_sum[len(subs) - 1 - idx] = temp
        #print(pref_sum, subs, addn)

        s = 0
        for idx, k in enumerate(addn):
            if idx + 1 < len(pref_sum) and k + pref_sum[idx+1] > s:
                s = k + pref_sum[idx+1]
        return s

        

        """
        [(0,8), (1,1), (2,5), (3,2), (4,6)]
         [8, 2, 7, 5, 10]
        =[8, 0, 3, -1, 2]

        [8, ]
        """





{% endraw %}
```
