---
            title: "3492 Count Submatrices With Equal Frequency Of X And Y"
            date: "2026-03-19T21:02:26+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Submatrices With Equal Frequency of X and Y](https://leetcode.com/problems/count-submatrices-with-equal-frequency-of-x-and-y) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a 2D character matrix grid, where grid[i][j] is either 'X', 'Y', or '.', return the number of submatrices that contain:

	grid[0][0]
	an **equal** frequency of 'X' and 'Y'.
	**at least** one 'X'.

 

Example 1:

**Input:** grid = [["X","Y","."],["Y",".","."]]

**Output:** 3

**Explanation:**

**![image](https://assets.leetcode.com/uploads/2024/06/07/examplems.png)**

Example 2:

**Input:** grid = [["X","X"],["X","Y"]]

**Output:** 0

**Explanation:**

No submatrix has an equal frequency of 'X' and 'Y'.

Example 3:

**Input:** grid = [[".","."],[".","."]]

**Output:** 0

**Explanation:**

No submatrix has at least one 'X'.

 

**Constraints:**

	1 <= grid.length, grid[i].length <= 1000
	grid[i][j] is either 'X', 'Y', or '.'.

{% raw %}


```python


class Solution:
    def numberOfSubmatrices(self, grid: List[List[str]]) -> int:
        n, m = len(grid), len(grid[0])
        ans = 0
        sum = [[[0, 0] for _ in range(m + 1)] for _ in range(n + 1)]

        for i in range(n):
            for j in range(m):
                if grid[i][j] == "X":
                    sum[i + 1][j + 1][0] = (
                        sum[i + 1][j][0] + sum[i][j + 1][0] - sum[i][j][0] + 1
                    )
                    sum[i + 1][j + 1][1] = 1
                elif grid[i][j] == "Y":
                    sum[i + 1][j + 1][0] = (
                        sum[i + 1][j][0] + sum[i][j + 1][0] - sum[i][j][0] - 1
                    )
                    sum[i + 1][j + 1][1] = sum[i + 1][j][1] | sum[i][j + 1][1]
                else:
                    sum[i + 1][j + 1][0] = (
                        sum[i + 1][j][0] + sum[i][j + 1][0] - sum[i][j][0]
                    )
                    sum[i + 1][j + 1][1] = sum[i + 1][j][1] | sum[i][j + 1][1]
                if sum[i + 1][j + 1][0] == 0 and sum[i + 1][j + 1][1] == 1:
                    ans += 1

        return ans


{% endraw %}
```
