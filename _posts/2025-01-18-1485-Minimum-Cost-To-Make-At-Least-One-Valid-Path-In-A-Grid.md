---
title: "1485 Minimum Cost To Make At Least One Valid Path In A Grid"
date: "2025-01-18T09:35:25+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Minimum Cost to Make at Least One Valid Path in a Grid](https://leetcode.com/problems/minimum-cost-to-make-at-least-one-valid-path-in-a-grid) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given an m x n grid. Each cell of the grid has a sign pointing to the next cell you should visit if you are currently in this cell. The sign of grid[i][j] can be:

	1 which means go to the cell to the right. (i.e go from grid[i][j] to grid[i][j + 1])
	2 which means go to the cell to the left. (i.e go from grid[i][j] to grid[i][j - 1])
	3 which means go to the lower cell. (i.e go from grid[i][j] to grid[i + 1][j])
	4 which means go to the upper cell. (i.e go from grid[i][j] to grid[i - 1][j])

Notice that there could be some signs on the cells of the grid that point outside the grid.

You will initially start at the upper left cell (0, 0). A valid path in the grid is a path that starts from the upper left cell (0, 0) and ends at the bottom-right cell (m - 1, n - 1) following the signs on the grid. The valid path does not have to be the shortest.

You can modify the sign on a cell with cost = 1. You can modify the sign on a cell **one time only**.

Return *the minimum cost to make the grid have at least one valid path*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/02/13/grid1.png)
```

**Input:** grid = [[1,1,1,1],[2,2,2,2],[1,1,1,1],[2,2,2,2]]
**Output:** 3
**Explanation:** You will start at point (0, 0).
The path to (3, 3) is as follows. (0, 0) --> (0, 1) --> (0, 2) --> (0, 3) change the arrow to down with cost = 1 --> (1, 3) --> (1, 2) --> (1, 1) --> (1, 0) change the arrow to down with cost = 1 --> (2, 0) --> (2, 1) --> (2, 2) --> (2, 3) change the arrow to down with cost = 1 --> (3, 3)
The total cost = 3.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/02/13/grid2.png)
```

**Input:** grid = [[1,1,3],[3,2,2],[1,1,4]]
**Output:** 0
**Explanation:** You can follow the path from (0, 0) to (2, 2).

```

Example 3:

![image](https://assets.leetcode.com/uploads/2020/02/13/grid3.png)
```

**Input:** grid = [[1,2],[4,3]]
**Output:** 1

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	1 <= m, n <= 100
	1 <= grid[i][j] <= 4

                            {% raw %}
                            ```python
                            class Solution:
    def minCost(self, grid: List[List[int]]) -> int:
        num_rows, num_cols = len(grid), len(grid[0])

        # Initialize all cells with max value
        min_changes = [[float("inf")] * num_cols for _ in range(num_rows)]
        min_changes[0][0] = 0

        while True:
            # Store previous state to check for convergence
            prev_state = [row[:] for row in min_changes]

            # Forward pass: check cells coming from left and top
            for row in range(num_rows):
                for col in range(num_cols):
                    # Check cell above
                    if row > 0:
                        min_changes[row][col] = min(
                            min_changes[row][col],
                            min_changes[row - 1][col]
                            + (0 if grid[row - 1][col] == 3 else 1),
                        )
                    # Check cell to the left
                    if col > 0:
                        min_changes[row][col] = min(
                            min_changes[row][col],
                            min_changes[row][col - 1]
                            + (0 if grid[row][col - 1] == 1 else 1),
                        )

            # Backward pass: check cells coming from right and bottom
            for row in range(num_rows - 1, -1, -1):
                for col in range(num_cols - 1, -1, -1):
                    # Check cell below
                    if row < num_rows - 1:
                        min_changes[row][col] = min(
                            min_changes[row][col],
                            min_changes[row + 1][col]
                            + (0 if grid[row + 1][col] == 4 else 1),
                        )
                    # Check cell to the right
                    if col < num_cols - 1:
                        min_changes[row][col] = min(
                            min_changes[row][col],
                            min_changes[row][col + 1]
                            + (0 if grid[row][col + 1] == 2 else 1),
                        )
            # If no changes were made in this iteration, we've found optimal solution
            if min_changes == prev_state:
                break

        return min_changes[num_rows - 1][num_cols - 1]
                            {% endraw %}
                            