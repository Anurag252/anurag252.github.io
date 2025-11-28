---
            title: "2521 Paths In Matrix Whose Sum Is Divisible By K"
            date: "2025-11-28T20:08:47+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Paths in Matrix Whose Sum Is Divisible by K](https://leetcode.com/problems/paths-in-matrix-whose-sum-is-divisible-by-k) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given a **0-indexed** m x n integer matrix grid and an integer k. You are currently at position (0, 0) and you want to reach position (m - 1, n - 1) moving only **down** or **right**.

Return* the number of paths where the sum of the elements on the path is divisible by *k. Since the answer may be very large, return it **modulo** 109 + 7.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2022/08/13/image-20220813183124-1.png)
```

**Input:** grid = [[5,2,4],[3,0,5],[0,7,2]], k = 3
**Output:** 2
**Explanation:** There are two paths where the sum of the elements on the path is divisible by k.
The first path highlighted in red has a sum of 5 + 2 + 4 + 5 + 2 = 18 which is divisible by 3.
The second path highlighted in blue has a sum of 5 + 3 + 0 + 5 + 2 = 15 which is divisible by 3.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2022/08/17/image-20220817112930-3.png)
```

**Input:** grid = [[0,0]], k = 5
**Output:** 1
**Explanation:** The path highlighted in red has a sum of 0 + 0 = 0 which is divisible by 5.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2022/08/12/image-20220812224605-3.png)
```

**Input:** grid = [[7,3,4,9],[2,3,6,2],[2,3,7,0]], k = 1
**Output:** 10
**Explanation:** Every integer is divisible by 1 so the sum of the elements on every possible path is divisible by k.

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	1 <= m, n <= 5 * 104
	1 <= m * n <= 5 * 104
	0 <= grid[i][j] <= 100
	1 <= k <= 50

{% raw %}


```python


class Solution:
    def numberOfPaths(self, grid: List[List[int]], k: int) -> int:
        MOD = 10**9 + 7
        m, n = len(grid), len(grid[0])

        dp = [[[0] * k for _ in range(n + 1)] for _ in range(m + 1)]

        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if i == 1 and j == 1:
                    dp[i][j][grid[0][0] % k] = 1
                    continue

                value = grid[i - 1][j - 1] % k
                for r in range(k):
                    prev_mod = (r - value + k) % k
                    dp[i][j][r] = (
                        dp[i - 1][j][prev_mod] + dp[i][j - 1][prev_mod]
                    ) % MOD

        return dp[m][n][0]


{% endraw %}
```
