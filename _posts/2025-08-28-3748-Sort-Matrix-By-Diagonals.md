---
            title: "3748 Sort Matrix By Diagonals"
            date: "2025-08-28T08:36:31+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Sort Matrix by Diagonals](https://leetcode.com/problems/sort-matrix-by-diagonals) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an n x n square matrix of integers grid. Return the matrix such that:

	The diagonals in the **bottom-left triangle** (including the middle diagonal) are sorted in **non-increasing order**.
	The diagonals in the **top-right triangle** are sorted in **non-decreasing order**.

 

Example 1:

**Input:** grid = [[1,7,3],[9,8,2],[4,5,6]]

**Output:** [[8,2,3],[9,6,7],[4,5,1]]

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/12/29/4052example1drawio.png)

The diagonals with a black arrow (bottom-left triangle) should be sorted in non-increasing order:

	[1, 8, 6] becomes [8, 6, 1].
	[9, 5] and [4] remain unchanged.

The diagonals with a blue arrow (top-right triangle) should be sorted in non-decreasing order:

	[7, 2] becomes [2, 7].
	[3] remains unchanged.

Example 2:

**Input:** grid = [[0,1],[1,2]]

**Output:** [[2,1],[1,0]]

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/12/29/4052example2adrawio.png)

The diagonals with a black arrow must be non-increasing, so [0, 2] is changed to [2, 0]. The other diagonals are already in the correct order.

Example 3:

**Input:** grid = [[1]]

**Output:** [[1]]

**Explanation:**

Diagonals with exactly one element are already in order, so no changes are needed.

 

**Constraints:**

	grid.length == grid[i].length == n
	1 <= n <= 10
	-105 <= grid[i][j] <= 105

{% raw %}


```python


class Solution:
    def sortMatrix(self, grid: List[List[int]]) -> List[List[int]]:
        """
            diagonals have 
            0,2
            0,1 1,2
            0,0 1,1 2,2
            1,0 2,1
            2,0

            start with each cell in first row and keep adding 1,1 till we hit the boundary
        """
        n = len(grid)
        for k in range(n):
            arr = []
            i = 0
            j = k
            
            while(i < n and j < n):
                arr.append(grid[i][j])
                i += 1
                j += 1
            arr.sort(key=lambda x : x)
            print(arr)
            i = 0
            j = k
            l = 0
            while(i < n and j < n):
                grid[i][j] = arr[l]
                l += 1
                i += 1
                j += 1

        for k in range(n):
            arr = []
            i = k
            j = 0
            
            while(i < n and j < n):
                arr.append(grid[i][j])
                i += 1
                j += 1
            arr.sort(key=lambda x : -x)
            print(arr)
            i = k
            j = 0
            l = 0
            while(i < n and j < n):
                grid[i][j] = arr[l]
                l += 1
                i += 1
                j += 1
        return grid

        


{% endraw %}
```
