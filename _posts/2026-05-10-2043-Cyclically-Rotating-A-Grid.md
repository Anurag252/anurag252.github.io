---
            title: "2043 Cyclically Rotating A Grid"
            date: "2026-05-10T18:37:09+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Cyclically Rotating a Grid](https://leetcode.com/problems/cyclically-rotating-a-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an m x n integer matrix grid​​​, where m and n are both **even** integers, and an integer k.

The matrix is composed of several layers, which is shown in the below image, where each color is its own layer:

![image](https://assets.leetcode.com/uploads/2021/06/10/ringofgrid.png)

A cyclic rotation of the matrix is done by cyclically rotating **each layer** in the matrix. To cyclically rotate a layer once, each element in the layer will take the place of the adjacent element in the **counter-clockwise** direction. An example rotation is shown below:

![image](https://assets.leetcode.com/uploads/2021/06/22/explanation_grid.jpg)

Return *the matrix after applying *k *cyclic rotations to it*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/06/19/rod2.png)
```

**Input:** grid = [[40,10],[30,20]], k = 1
**Output:** [[10,20],[40,30]]
**Explanation:** The figures above represent the grid at every state.

```

Example 2:

**![image](https://assets.leetcode.com/uploads/2021/06/10/ringofgrid5.png)** **![image](https://assets.leetcode.com/uploads/2021/06/10/ringofgrid6.png)** **![image](https://assets.leetcode.com/uploads/2021/06/10/ringofgrid7.png)**

```

**Input:** grid = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], k = 2
**Output:** [[3,4,8,12],[2,11,10,16],[1,7,6,15],[5,9,13,14]]
**Explanation:** The figures above represent the grid at every state.

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	2 <= m, n <= 50
	Both m and n are **even** integers.
	1 <= grid[i][j] <= 5000
	1 <= k <= 109

{% raw %}


```rust


impl Solution {
    pub fn rotate_grid(mut grid: Vec<Vec<i32>>, k: i32) -> Vec<Vec<i32>> {
        let m = grid.len();
        let n = grid[0].len();
        let nlayer = (m / 2).min(n / 2);   // level count
        let k = k as usize;
        // enumerate each layer counterclockwise starting from the top-left corner
        for layer in 0..nlayer {
            let mut r = Vec::new();
            let mut c = Vec::new();
            let mut val = Vec::new();   // each element's row index, column index, and value
            for i in layer..m - layer - 1 {   // left
                r.push(i);
                c.push(layer);
                val.push(grid[i][layer]);
            }
            for j in layer..n - layer - 1 {   // down
                r.push(m - layer - 1);
                c.push(j);
                val.push(grid[m - layer - 1][j]);
            }
            for i in (layer + 1..=m - layer - 1).rev() {   // right
                r.push(i);
                c.push(n - layer - 1);
                val.push(grid[i][n - layer - 1]);
            }
            for j in (layer + 1..=n - layer - 1).rev() {   // up
                r.push(layer);
                c.push(j);
                val.push(grid[layer][j]);
            }
            let total = val.len();   // total number of elements in each layer
            let kk = k % total;   // equivalent number of rotations
            // find the value at each index after rotation
            for i in 0..total {
                let idx = (i + total - kk) % total;   // the index corresponding to the value after rotation
                grid[r[i]][c[i]] = val[idx];
            }
        }
        grid
    }
}


{% endraw %}
```
