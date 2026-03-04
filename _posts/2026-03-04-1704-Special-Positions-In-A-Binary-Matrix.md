---
            title: "1704 Special Positions In A Binary Matrix"
            date: "2026-03-04T16:10:12+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Special Positions in a Binary Matrix](https://leetcode.com/problems/special-positions-in-a-binary-matrix) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an m x n binary matrix mat, return *the number of special positions in *mat*.*

A position (i, j) is called **special** if mat[i][j] == 1 and all other elements in row i and column j are 0 (rows and columns are **0-indexed**).

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/12/23/special1.jpg)
```

**Input:** mat = [[1,0,0],[0,0,1],[1,0,0]]
**Output:** 1
**Explanation:** (1, 2) is a special position because mat[1][2] == 1 and all other elements in row 1 and column 2 are 0.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/12/24/special-grid.jpg)
```

**Input:** mat = [[1,0,0],[0,1,0],[0,0,1]]
**Output:** 3
**Explanation:** (0, 0), (1, 1) and (2, 2) are special positions.

```

 

**Constraints:**

	m == mat.length
	n == mat[i].length
	1 <= m, n <= 100
	mat[i][j] is either 0 or 1.

{% raw %}


```rust


use itertools::enumerate;

impl Solution {
    pub fn num_special(mat: Vec<Vec<i32>>) -> i32 {
        let mut res = 0;
        for (i, row) in enumerate(&mat) {
            for (j, &val) in enumerate(row) {
                // Only consider cells that are 1
                if val != 1 {
                    continue;
                }

                // Check no other 1 exists in row i
                let row_ok = mat[i].iter().filter(|&&x| x == 1).count() == 1;

                // Check no other 1 exists in column j
                let col_ok = mat.iter().filter(|r| r[j] == 1).count() == 1;

                if row_ok && col_ok {
                    res += 1;
                }
            }
        }
        res
    }
}


{% endraw %}
```
