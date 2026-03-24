---
            title: "2015 Determine Whether Matrix Can Be Obtained By Rotation"
            date: "2026-03-24T06:33:58+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Determine Whether Matrix Can Be Obtained By Rotation](https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given two n x n binary matrices mat and target, return true* if it is possible to make *mat* equal to *target* by **rotating** *mat* in **90-degree increments**, or *false* otherwise.*

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/05/20/grid3.png)
```

**Input:** mat = [[0,1],[1,0]], target = [[1,0],[0,1]]
**Output:** true
**Explanation: **We can rotate mat 90 degrees clockwise to make mat equal target.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/05/20/grid4.png)
```

**Input:** mat = [[0,1],[1,1]], target = [[1,0],[0,1]]
**Output:** false
**Explanation:** It is impossible to make mat equal to target by rotating mat.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/05/26/grid4.png)
```

**Input:** mat = [[0,0,0],[0,1,0],[1,1,1]], target = [[1,1,1],[0,1,0],[0,0,0]]
**Output:** true
**Explanation: **We can rotate mat 90 degrees clockwise two times to make mat equal target.

```

 

**Constraints:**

	n == mat.length == target.length
	n == mat[i].length == target[i].length
	1 <= n <= 10
	mat[i][j] and target[i][j] are either 0 or 1.

{% raw %}


```python


class Solution:
    def findRotation(
        self, mat: List[List[int]], target: List[List[int]]
    ) -> bool:
        n = len(mat)
        # at most 4 rotations
        for k in range(4):
            # rotation operation
            for i in range(n // 2):
                for j in range((n + 1) // 2):
                    (
                        mat[i][j],
                        mat[n - 1 - j][i],
                        mat[n - 1 - i][n - 1 - j],
                        mat[j][n - 1 - i],
                    ) = (
                        mat[n - 1 - j][i],
                        mat[n - 1 - i][n - 1 - j],
                        mat[j][n - 1 - i],
                        mat[i][j],
                    )

            if mat == target:
                return True
        return False


{% endraw %}
```
