---
            title: "85 Maximal Rectangle"
            date: "2026-01-11T20:38:56+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximal Rectangle](https://leetcode.com/problems/maximal-rectangle) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given a rows x cols binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return *its area*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/09/14/maximal.jpg)
```

**Input:** matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
**Output:** 6
**Explanation:** The maximal rectangle is shown in the above picture.

```

Example 2:

```

**Input:** matrix = [["0"]]
**Output:** 0

```

Example 3:

```

**Input:** matrix = [["1"]]
**Output:** 1

```

 

**Constraints:**

	rows == matrix.length
	cols == matrix[i].length
	1 <= rows, cols <= 200
	matrix[i][j] is '0' or '1'.

{% raw %}


```python


class Solution:
    def maximalRectangle(self, matrix: List[List[str]]) -> int:
        if not matrix or not matrix[0]:
            return 0

        rows, cols = len(matrix), len(matrix[0])
        heights = [[0] * cols for _ in range(rows)]
        
        # Build row histograms
        for i in range(rows):
            for j in range(cols):
                if matrix[i][j] == '1':
                    heights[i][j] = 1 if i == 0 else heights[i-1][j] + 1
        
        # Compute maximal rectangle for each row
        max_area = 0
        for i in range(rows):
            for start_col in range(cols):
                if heights[i][start_col] == 0:
                    continue
                min_height = heights[i][start_col]
                for end_col in range(start_col, cols):
                    if heights[i][end_col] == 0:
                        break
                    min_height = min(min_height, heights[i][end_col])
                    width = end_col - start_col + 1
                    max_area = max(max_area, width * min_height)

        return max_area



{% endraw %}
```
