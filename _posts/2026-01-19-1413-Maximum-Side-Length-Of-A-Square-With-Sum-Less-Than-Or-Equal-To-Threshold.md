---
            title: "1413 Maximum Side Length Of A Square With Sum Less Than Or Equal To Threshold"
            date: "2026-01-19T21:58:27+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Side Length of a Square with Sum Less than or Equal to Threshold](https://leetcode.com/problems/maximum-side-length-of-a-square-with-sum-less-than-or-equal-to-threshold) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a m x n matrix mat and an integer threshold, return *the maximum side-length of a square with a sum less than or equal to *threshold* or return *0* if there is no such square*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2019/12/05/e1.png)
```

**Input:** mat = [[1,1,3,2,4,3,2],[1,1,3,2,4,3,2],[1,1,3,2,4,3,2]], threshold = 4
**Output:** 2
**Explanation:** The maximum side length of square with sum less than 4 is 2 as shown.

```

Example 2:

```

**Input:** mat = [[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]], threshold = 1
**Output:** 0

```

 

**Constraints:**

	m == mat.length
	n == mat[i].length
	1 <= m, n <= 300
	0 <= mat[i][j] <= 104
	0 <= threshold <= 105

{% raw %}


```python


class Solution:
    def maxSideLength(self, mat: List[List[int]], threshold: int) -> int:
        m, n = len(mat), len(mat[0])
        P = [[0] * (n + 1) for _ in range(m + 1)]
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                P[i][j] = (
                    P[i - 1][j]
                    + P[i][j - 1]
                    - P[i - 1][j - 1]
                    + mat[i - 1][j - 1]
                )

        def getRect(x1, y1, x2, y2):
            return P[x2][y2] - P[x1 - 1][y2] - P[x2][y1 - 1] + P[x1 - 1][y1 - 1]

        l, r, ans = 1, min(m, n), 0
        while l <= r:
            mid = (l + r) // 2
            find = any(
                getRect(i, j, i + mid - 1, j + mid - 1) <= threshold
                for i in range(1, m - mid + 2)
                for j in range(1, n - mid + 2)
            )
            if find:
                ans = mid
                l = mid + 1
            else:
                r = mid - 1
        return ans


{% endraw %}
```
