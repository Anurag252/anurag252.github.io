---
            title: "48 Rotate Image"
            date: "2026-05-04T22:34:30+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Rotate Image](https://leetcode.com/problems/rotate-image) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an n x n 2D matrix representing an image, rotate the image by **90** degrees (clockwise).

You have to rotate the image [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm), which means you have to modify the input 2D matrix directly. **DO NOT** allocate another 2D matrix and do the rotation.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/08/28/mat1.jpg)
```

**Input:** matrix = [[1,2,3],[4,5,6],[7,8,9]]
**Output:** [[7,4,1],[8,5,2],[9,6,3]]

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/08/28/mat2.jpg)
```

**Input:** matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
**Output:** [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

```

 

**Constraints:**

	n == matrix.length == matrix[i].length
	1 <= n <= 20
	-1000 <= matrix[i][j] <= 1000

{% raw %}


```rust


impl Solution {
    pub fn rotate(matrix: &mut Vec<Vec<i32>>) {
        let l = matrix.len() - 1;
        if l == 0 {
            return;
        }

        fn recurse(i: usize, j: usize, matrix: &mut Vec<Vec<i32>>, val: i32) {
            if matrix[i][j] > 1000 || matrix[i][j] < -1000 {
                return;
            }
            let old = matrix[i][j];
            matrix[i][j] = val * 2001;
            let l = matrix.len() - 1;
            recurse(j, l - i, matrix, old);
        }

        for i in 0..matrix.len() {
            for j in 0..matrix.len() {
                if matrix[i][j] <= 1000 && matrix[i][j] >= -1000 {
                    recurse(j, l - i, matrix, matrix[i][j]);
                }
            }
        }

        for i in 0..matrix.len() {
            for j in 0..matrix.len() {
                matrix[i][j] = matrix[i][j] / 2001;
            }
        }
    }
}


{% endraw %}
```
