---
            title: "759 Set Intersection Size At Least Two"
            date: "2025-11-20T13:06:09+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Set Intersection Size At Least Two](https://leetcode.com/problems/set-intersection-size-at-least-two) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given a 2D integer array intervals where intervals[i] = [starti, endi] represents all the integers from starti to endi inclusively.

A **containing set** is an array nums where each interval from intervals has **at least two** integers in nums.

	For example, if intervals = [[1,3], [3,7], [8,9]], then [1,2,4,7,8,9] and [2,3,4,8,9] are **containing sets**.

Return *the minimum possible size of a containing set*.

 

Example 1:

```

**Input:** intervals = [[1,3],[3,7],[8,9]]
**Output:** 5
**Explanation:** let nums = [2, 3, 4, 8, 9].
It can be shown that there cannot be any containing array of size 4.

```

Example 2:

```

**Input:** intervals = [[1,3],[1,4],[2,5],[3,5]]
**Output:** 3
**Explanation:** let nums = [2, 3, 4].
It can be shown that there cannot be any containing array of size 2.

```

Example 3:

```

**Input:** intervals = [[1,2],[2,3],[2,4],[4,5]]
**Output:** 5
**Explanation:** let nums = [1, 2, 3, 4, 5].
It can be shown that there cannot be any containing array of size 4.

```

 

**Constraints:**

	1 <= intervals.length <= 3000
	intervals[i].length == 2
	0 <= starti < endi <= 108

{% raw %}


```python


from typing import List

class Solution:
    def intersectionSizeTwo(self, intervals: List[List[int]]) -> int:
        # Sort by end ascending, start descending
        intervals.sort(key=lambda x: (x[1], -x[0]))

        # The two largest chosen numbers so far
        a = b = -1
        count = 0

        for s, e in intervals:
            need = 0
            # Check how many of {a, b} lie inside the current interval
            if b < s:        # neither a nor b is inside
                need = 2
            elif a < s:      # only b is inside
                need = 1

            # Add needed numbers greedily: choose e, e-1
            for x in range(e - need + 1, e + 1):
                if x > b:
                    a, b = b, x
                    count += 1

        return count



{% endraw %}
```
