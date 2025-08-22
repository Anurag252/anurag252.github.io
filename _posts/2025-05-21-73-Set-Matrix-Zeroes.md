---
            title: "73 Set Matrix Zeroes"
            date: "2025-05-21T09:01:35+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Set Matrix Zeroes](https://leetcode.com/problems/set-matrix-zeroes) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

You must do it [in place](https://en.wikipedia.org/wiki/In-place_algorithm).

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/08/17/mat1.jpg)
```

**Input:** matrix = [[1,1,1],[1,0,1],[1,1,1]]
**Output:** [[1,0,1],[0,0,0],[1,0,1]]

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/08/17/mat2.jpg)
```

**Input:** matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
**Output:** [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

```

 

**Constraints:**

	m == matrix.length
	n == matrix[0].length
	1 <= m, n <= 200
	-231 <= matrix[i][j] <= 231 - 1

 

**Follow up:**

	A straightforward solution using O(mn) space is probably a bad idea.
	A simple improvement uses O(m + n) space, but still not the best solution.
	Could you devise a constant space solution?

{% raw %}


```python


class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """


        def changer(i , j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return 
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changer(i - 1, j , matrix, t)



        def changef(i , j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return 
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changef(i + 1, j , matrix, t)

        def changecolr(i,  j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changecolr(i , j - 1 , matrix, t)
        
        def changecolf(i,  j , matrix, t):
            if i >= len(matrix) or j >= len(matrix[0]) or i < 0 or j < 0 :
                return
            if matrix[i][j] != 0:
                matrix[i][j] = t
            changecolf(i , j + 1 , matrix, t)

        
        for i, k in enumerate(matrix):
            for j, l in enumerate(matrix[i]):
                if l == 0:
                    changer(i , j , matrix, "s")
                    changef(i , j , matrix, "s")
                    changecolr(i , j , matrix, "s")
                    changecolf(i , j , matrix, "s")
                    

        for i, k in enumerate(matrix):
            for j, l in enumerate(matrix[i]):
                if l == "s":
                    matrix[i][j] = 0
                    


            

        

        


{% endraw %}
