---
            title: "2067 Maximum Number Of Points With Cost"
            date: "2024-08-17T07:31:15+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Number of Points with Cost](https://leetcode.com/problems/maximum-number-of-points-with-cost) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an m x n integer matrix points (**0-indexed**). Starting with 0 points, you want to **maximize** the number of points you can get from the matrix.

To gain points, you must pick one cell in **each row**. Picking the cell at coordinates (r, c) will **add** points[r][c] to your score.

However, you will lose points if you pick a cell too far from the cell that you picked in the previous row. For every two adjacent rows r and r + 1 (where 0 <= r < m - 1), picking cells at coordinates (r, c1) and (r + 1, c2) will **subtract** abs(c1 - c2) from your score.

Return *the **maximum** number of points you can achieve*.

abs(x) is defined as:

	x for x >= 0.
	-x for x < 0.

 

Example 1:** **

![image](https://assets.leetcode.com/uploads/2021/07/12/screenshot-2021-07-12-at-13-40-26-diagram-drawio-diagrams-net.png)
```

**Input:** points = [[1,2,3],[1,5,1],[3,1,1]]
**Output:** 9
**Explanation:**
The blue cells denote the optimal cells to pick, which have coordinates (0, 2), (1, 1), and (2, 0).
You add 3 + 5 + 3 = 11 to your score.
However, you must subtract abs(2 - 1) + abs(1 - 0) = 2 from your score.
Your final score is 11 - 2 = 9.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/07/12/screenshot-2021-07-12-at-13-42-14-diagram-drawio-diagrams-net.png)
```

**Input:** points = [[1,5],[2,3],[4,2]]
**Output:** 11
**Explanation:**
The blue cells denote the optimal cells to pick, which have coordinates (0, 1), (1, 1), and (2, 0).
You add 5 + 3 + 4 = 12 to your score.
However, you must subtract abs(1 - 1) + abs(1 - 0) = 1 from your score.
Your final score is 12 - 1 = 11.

```

 

**Constraints:**

	m == points.length
	n == points[r].length
	1 <= m, n <= 105
	1 <= m * n <= 105
	0 <= points[r][c] <= 105

{% raw %}


```python


class Solution:
    def __init__(self):
        self.cache = {}
    def maxPoints(self, points: List[List[int]]) -> int:
        n, m = len(points), len(points[0])
        cache = {}

        def precompute_max_arrays(dp_row):
            max_left = [0] * m
            max_right = [0] * m

            max_left[0] = dp_row[0]
            for c in range(1, m):
                max_left[c] = max(max_left[c - 1], dp_row[c] + c)

            max_right[-1] = dp_row[-1] - (m - 1)
            for c in range(m - 2, -1, -1):
                max_right[c] = max(max_right[c + 1], dp_row[c] - c)

            return max_left, max_right

        def dp(r):
            if r in cache:
                return cache[r]
            if r == n - 1:
                return points[r]

            # Get DP row for the next row
            dp_next_row = dp(r + 1)
            max_left, max_right = precompute_max_arrays(dp_next_row)

            current_dp = [0] * m
            for c in range(m):
                current_dp[c] = points[r][c] + max(max_left[c] - c, max_right[c] + c)

            cache[r] = current_dp
            return current_dp

        # Compute result by taking the maximum of the first row
        return max(dp(0))



{% endraw %}
