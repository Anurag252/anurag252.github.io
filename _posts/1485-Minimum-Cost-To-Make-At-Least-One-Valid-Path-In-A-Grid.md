---
title: "./1485 Minimum Cost To Make At Least One Valid Path In A Grid"
date: "2025-01-18T09:35:25+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-cost-to-make-at-least-one-valid-path-in-a-grid">Minimum Cost to Make at Least One Valid Path in a Grid</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>Given an <code>m x n</code> grid. Each cell of the grid has a sign pointing to the next cell you should visit if you are currently in this cell. The sign of <code>grid[i][j]</code> can be:</p>

<ul>
	<li><code>1</code> which means go to the cell to the right. (i.e go from <code>grid[i][j]</code> to <code>grid[i][j + 1]</code>)</li>
	<li><code>2</code> which means go to the cell to the left. (i.e go from <code>grid[i][j]</code> to <code>grid[i][j - 1]</code>)</li>
	<li><code>3</code> which means go to the lower cell. (i.e go from <code>grid[i][j]</code> to <code>grid[i + 1][j]</code>)</li>
	<li><code>4</code> which means go to the upper cell. (i.e go from <code>grid[i][j]</code> to <code>grid[i - 1][j]</code>)</li>
</ul>

<p>Notice that there could be some signs on the cells of the grid that point outside the grid.</p>

<p>You will initially start at the upper left cell <code>(0, 0)</code>. A valid path in the grid is a path that starts from the upper left cell <code>(0, 0)</code> and ends at the bottom-right cell <code>(m - 1, n - 1)</code> following the signs on the grid. The valid path does not have to be the shortest.</p>

<p>You can modify the sign on a cell with <code>cost = 1</code>. You can modify the sign on a cell <strong>one time only</strong>.</p>

<p>Return <em>the minimum cost to make the grid have at least one valid path</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/02/13/grid1.png" style="width: 400px; height: 390px;" />
<pre>
<strong>Input:</strong> grid = [[1,1,1,1],[2,2,2,2],[1,1,1,1],[2,2,2,2]]
<strong>Output:</strong> 3
<strong>Explanation:</strong> You will start at point (0, 0).
The path to (3, 3) is as follows. (0, 0) --&gt; (0, 1) --&gt; (0, 2) --&gt; (0, 3) change the arrow to down with cost = 1 --&gt; (1, 3) --&gt; (1, 2) --&gt; (1, 1) --&gt; (1, 0) change the arrow to down with cost = 1 --&gt; (2, 0) --&gt; (2, 1) --&gt; (2, 2) --&gt; (2, 3) change the arrow to down with cost = 1 --&gt; (3, 3)
The total cost = 3.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/02/13/grid2.png" style="width: 350px; height: 341px;" />
<pre>
<strong>Input:</strong> grid = [[1,1,3],[3,2,2],[1,1,4]]
<strong>Output:</strong> 0
<strong>Explanation:</strong> You can follow the path from (0, 0) to (2, 2).
</pre>

<p><strong class="example">Example 3:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/02/13/grid3.png" style="width: 200px; height: 192px;" />
<pre>
<strong>Input:</strong> grid = [[1,2],[4,3]]
<strong>Output:</strong> 1
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == grid.length</code></li>
	<li><code>n == grid[i].length</code></li>
	<li><code>1 &lt;= m, n &lt;= 100</code></li>
	<li><code>1 &lt;= grid[i][j] &lt;= 4</code></li>
</ul>"
---

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
```