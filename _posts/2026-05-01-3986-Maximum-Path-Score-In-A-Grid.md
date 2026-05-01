---
            title: "3986 Maximum Path Score In A Grid"
            date: "2026-05-01T22:06:08+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximum Path Score in a Grid](https://leetcode.com/problems/maximum-path-score-in-a-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an m x n grid where each cell contains one of the values 0, 1, or 2. You are also given an integer k.

You start from the top-left corner (0, 0) and want to reach the bottom-right corner (m - 1, n - 1) by moving only **right** or **down**.

Each cell contributes a specific score and incurs an associated cost, according to their cell values:

	0: adds 0 to your score and costs 0.
	1: adds 1 to your score and costs 1.
	2: adds 2 to your score and costs 1. ​​​​​​​

Return the **maximum** score achievable without exceeding a total cost of k, or -1 if no valid path exists.

**Note:** If you reach the last cell but the total cost exceeds k, the path is invalid.

 

Example 1:

**Input:** grid = [[0, 1],[2, 0]], k = 1

**Output:** 2

**Explanation:**​​​​​​​

The optimal path is:

			Cell
			grid[i][j]
			Score
			Total

			Score
			Cost
			Total

			Cost

			(0, 0)
			0
			0
			0
			0
			0

			(1, 0)
			2
			2
			2
			1
			1

			(1, 1)
			0
			0
			2
			0
			1

Thus, the maximum possible score is 2.

Example 2:

**Input:** grid = [[0, 1],[1, 2]], k = 1

**Output:** -1

**Explanation:**

There is no path that reaches cell (1, 1)​​​​​​​ without exceeding cost k. Thus, the answer is -1.

 

**Constraints:**

	1 <= m, n <= 200
	0 <= k <= 103​​​​​​​
	​​​​​​​grid[0][0] == 0
	0 <= grid[i][j] <= 2

{% raw %}


```rust


impl Solution {
    pub fn max_path_score(grid: Vec<Vec<i32>>, k: i32) -> i32 {
        let m = grid.len();
        let n = grid[0].len();
        let k = k as usize;

        let inf = i32::MIN / 2;
        let mut dp = vec![vec![vec![inf; k + 1]; n]; m];

        dp[0][0][0] = 0;

        for i in 0..m {
            for j in 0..n {
                for c in 0..=k {
                    if dp[i][j][c] == inf {
                        continue;
                    }

                    if i + 1 < m {
                        let val = grid[i + 1][j];
                        let cost = if val == 0 { 0 } else { 1 };
                        if c + cost <= k {
                            dp[i + 1][j][c + cost] =
                                dp[i + 1][j][c + cost].max(dp[i][j][c] + val);
                        }
                    }

                    if j + 1 < n {
                        let val = grid[i][j + 1];
                        let cost = if val == 0 { 0 } else { 1 };
                        if c + cost <= k {
                            dp[i][j + 1][c + cost] =
                                dp[i][j + 1][c + cost].max(dp[i][j][c] + val);
                        }
                    }
                }
            }
        }

        let mut ans = inf;
        for c in 0..=k {
            ans = ans.max(dp[m - 1][n - 1][c]);
        }

        if ans < 0 { -1 } else { ans }
    }
}


{% endraw %}
```
