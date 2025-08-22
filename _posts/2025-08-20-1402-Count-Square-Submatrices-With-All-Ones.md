---
            title: "1402 Count Square Submatrices With All Ones"
            date: "2025-08-20T11:04:43+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Square Submatrices with All Ones](https://leetcode.com/problems/count-square-submatrices-with-all-ones) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a m * n matrix of ones and zeros, return how many **square** submatrices have all ones.

 

Example 1:

```

**Input:** matrix =
[
  [0,1,1,1],
  [1,1,1,1],
  [0,1,1,1]
]
**Output:** 15
**Explanation:** 
There are **10** squares of side 1.
There are **4** squares of side 2.
There is  **1** square of side 3.
Total number of squares = 10 + 4 + 1 = **15**.

```

Example 2:

```

**Input:** matrix = 
[
  [1,0,1],
  [1,1,0],
  [1,1,0]
]
**Output:** 7
**Explanation:** 
There are **6** squares of side 1.  
There is **1** square of side 2. 
Total number of squares = 6 + 1 = **7**.

```

 

**Constraints:**

	1 <= arr.length <= 300
	1 <= arr[0].length <= 300
	0 <= arr[i][j] <= 1

{% raw %}


```python


from typing import List

class Solution:
    def countSquares(self, matrix: List[List[int]]) -> int:
        if not matrix or not matrix[0]:
            return 0
        m, n = len(matrix), len(matrix[0])
        total = 0

        # matrix[i][j] becomes the size of the largest all-ones square
        # with TOP-LEFT corner at (i, j)
        for i in range(m - 1, -1, -1):
            for j in range(n - 1, -1, -1):
                if matrix[i][j] == 1:
                    if i < m - 1 and j < n - 1:
                        matrix[i][j] = 1 + min(
                            matrix[i + 1][j],      # down
                            matrix[i][j + 1],      # right
                            matrix[i + 1][j + 1],  # down-right
                        )
                    else:
                        matrix[i][j] = 1  # edge cells
                    total += matrix[i][j]
                # if it's 0, leave as 0 and add nothing
        return total



{% endraw %}
