---
            title: "2625 Increment Submatrices By One"
            date: "2025-11-14T09:41:41+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Increment Submatrices by One](https://leetcode.com/problems/increment-submatrices-by-one) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a positive integer n, indicating that we initially have an n x n **0-indexed** integer matrix mat filled with zeroes.

You are also given a 2D integer array query. For each query[i] = [row1i, col1i, row2i, col2i], you should do the following operation:

	Add 1 to **every element** in the submatrix with the **top left** corner (row1i, col1i) and the **bottom right** corner (row2i, col2i). That is, add 1 to mat[x][y] for all row1i <= x <= row2i and col1i <= y <= col2i.

Return* the matrix* mat* after performing every query.*

 

Example 1:

![image](https://assets.leetcode.com/uploads/2022/11/24/p2example11.png)
```

**Input:** n = 3, queries = [[1,1,2,2],[0,0,1,1]]
**Output:** [[1,1,0],[1,2,1],[0,1,1]]
**Explanation:** The diagram above shows the initial matrix, the matrix after the first query, and the matrix after the second query.
- In the first query, we add 1 to every element in the submatrix with the top left corner (1, 1) and bottom right corner (2, 2).
- In the second query, we add 1 to every element in the submatrix with the top left corner (0, 0) and bottom right corner (1, 1).

```

Example 2:

![image](https://assets.leetcode.com/uploads/2022/11/24/p2example22.png)
```

**Input:** n = 2, queries = [[0,0,1,1]]
**Output:** [[1,1],[1,1]]
**Explanation:** The diagram above shows the initial matrix and the matrix after the first query.
- In the first query we add 1 to every element in the matrix.

```

 

**Constraints:**

	1 <= n <= 500
	1 <= queries.length <= 104
	0 <= row1i <= row2i < n
	0 <= col1i <= col2i < n

{% raw %}


```rust


impl Solution {
    pub fn range_add_queries(n: i32, queries: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        // brute forcing will TLE
        // if we make the array as single dim array as its only 500
        // then convert the rows to single dim
        // then add 1 at start and -1 after end 
        //n = 3 
        // 0,1,2,3,4,5,6,7,8
        // 0,0 -> 0
        // 0,1 -> 1
        // 0,2 -> 2
        // 1,0 -> 3 = row * col_max + col
        // 1,1 -> 3
        // given this is square , this addressing may not work
        // the thing is I need to somehow mark the submatrix 
        // GAVE UP, BUT THINK MORE ON ABOVE APPORACH, this was correct

        let n = n as usize;
        let mut diff = vec![vec![0; n+1]; n+1];
        for q in queries.iter() {
            let (row1, col1, row2, col2) = (q[0] as usize, q[1] as usize, q[2] as usize, q[3] as usize);
            diff[row1][col1] += 1;
            diff[row2+1][col1] -= 1;
            diff[row1][col2+1] -= 1;
            diff[row2+1][col2+1] += 1;
        }

        let mut mat = vec![vec![0; n]; n];
        for i in 0..n {
            for j in 0..n {
                let x1 = if i == 0 { 0 } else { mat[i-1][j] };
                let x2 = if j == 0 { 0 } else { mat[i][j-1] };
                let x3 = if i == 0 || j == 0 { 0 } else { mat[i-1][j-1] };
                mat[i][j] = diff[i][j] + x1 + x2 - x3;
            }
        }
        mat
    }
}


{% endraw %}
```
