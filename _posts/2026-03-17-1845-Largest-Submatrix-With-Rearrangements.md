---
            title: "1845 Largest Submatrix With Rearrangements"
            date: "2026-03-17T21:21:22+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Largest Submatrix With Rearrangements](https://leetcode.com/problems/largest-submatrix-with-rearrangements) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a binary matrix matrix of size m x n, and you are allowed to rearrange the **columns** of the matrix in any order.

Return *the area of the largest submatrix within *matrix* where **every** element of the submatrix is *1* after reordering the columns optimally.*

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/12/29/screenshot-2020-12-30-at-40536-pm.png)
```

**Input:** matrix = [[0,0,1],[1,1,1],[1,0,1]]
**Output:** 4
**Explanation:** You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 4.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/12/29/screenshot-2020-12-30-at-40852-pm.png)
```

**Input:** matrix = [[1,0,1,0,1]]
**Output:** 3
**Explanation:** You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 3.

```

Example 3:

```

**Input:** matrix = [[1,1,0],[1,0,1]]
**Output:** 2
**Explanation:** Notice that you must rearrange entire columns, and there is no way to make a submatrix of 1s larger than an area of 2.

```

 

**Constraints:**

	m == matrix.length
	n == matrix[i].length
	1 <= m * n <= 105
	matrix[i][j] is either 0 or 1.

{% raw %}


```python


class Solution:
    def largestSubmatrix(self, matrix: List[List[int]]) -> int:
        m = len(matrix)
        n = len(matrix[0])
        prev_row = [0] * n
        ans = 0
        
        for row in range(m):
            curr_row = matrix[row][:]
            for col in range(n):
                if curr_row[col] != 0:
                    curr_row[col] += prev_row[col]

            sorted_row = sorted(curr_row, reverse=True)
            for i in range(n):
                ans = max(ans, sorted_row[i] * (i + 1))

            prev_row = curr_row

        return ans


{% endraw %}
```
