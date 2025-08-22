---
title: "2764 Maximum Number Of Fish In A Grid"
date: "2025-01-28T21:31:30+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---


                            ## [Maximum Number of Fish in a Grid](https://leetcode.com/problems/maximum-number-of-fish-in-a-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** 2D matrix grid of size m x n, where (r, c) represents:

	A **land** cell if grid[r][c] = 0, or
	A **water** cell containing grid[r][c] fish, if grid[r][c] > 0.

A fisher can start at any **water** cell (r, c) and can do the following operations any number of times:

	Catch all the fish at cell (r, c), or
	Move to any adjacent **water** cell.

Return *the **maximum** number of fish the fisher can catch if he chooses his starting cell optimally, or *0 if no water cell exists.

An **adjacent** cell of the cell (r, c), is one of the cells (r, c + 1), (r, c - 1), (r + 1, c) or (r - 1, c) if it exists.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2023/03/29/example.png)
```

**Input:** grid = [[0,2,1,0],[4,0,0,3],[1,0,0,4],[0,3,2,0]]
**Output:** 7
**Explanation:** The fisher can start at cell (1,3) and collect 3 fish, then move to cell (2,3) and collect 4 fish.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2023/03/29/example2.png)
```

**Input:** grid = [[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]
**Output:** 1
**Explanation:** The fisher can start at cells (0,0) or (3,3) and collect a single fish. 

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	1 <= m, n <= 10
	0 <= grid[i][j] <= 10

                            {% raw %}
                            ```go
                            
func dfs(i int, j int, grid [][]int) int {
    if (grid)[i][j] == 0 {
        return 0
    }
    res := (grid)[i][j]
    (grid)[i][j] = 0
    dir := [][]int{{1,0}, {0,1}, {-1,0}, {0,-1}}
    for _, k := range dir {
        if k[0] + i >= 0 && k[0] + i < len(grid) && k[1] + j >= 0 && k[1] + j < len((grid)[0]) {
            res += dfs(k[0] + i, k[1] + j, grid)
        }
    }
    return res
}

func findMaxFish(grid [][]int) int {
    res := 0
    for i, _ := range grid {
        for j, k := range grid[i] {
            if k > 0 {
               // fmt.Println(grid, i, j)
                res = max(res,dfs(i, j , grid))
            }
        }
    }
    return res
}
                            {% endraw %}
                            