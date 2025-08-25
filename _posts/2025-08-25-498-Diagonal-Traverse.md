---
            title: "498 Diagonal Traverse"
            date: "2025-08-25T08:40:48+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Diagonal Traverse](https://leetcode.com/problems/diagonal-traverse) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an m x n matrix mat, return *an array of all the elements of the array in a diagonal order*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/04/10/diag1-grid.jpg)
```

**Input:** mat = [[1,2,3],[4,5,6],[7,8,9]]
**Output:** [1,2,4,7,5,3,6,8,9]

```

Example 2:

```

**Input:** mat = [[1,2],[3,4]]
**Output:** [1,2,3,4]

```

 

**Constraints:**

	m == mat.length
	n == mat[i].length
	1 <= m, n <= 104
	1 <= m * n <= 104
	-105 <= mat[i][j] <= 105

{% raw %}


```python


class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        """
        0,0
        1,0 -> 0,1
        
        2,0 1,1 0,2

        1,2 2,1
        2,2
        x + y = 0 even 
        x + y =1  odd
        .
        .
        .
        """
        res = []
        mp = {}
        for i in range(len(mat)):
            for j in range(len(mat[0])):
                if i + j in mp:
                    mp[i+j].append((i,j))
                else:
                    mp[i+j] = []
                    mp[i+j].append((i,j))
        print(mp)
        for k in range(0, len(mat) + len(mat[0]) - 1):
            if k % 2 != 0:
                for v in mp[k]:
                    res.append(mat[v[0]][v[1]])
            else:
                for v in mp[k][::-1]:
                    res.append(mat[v[0]][v[1]])
        return res






{% endraw %}
```
