---
            title: "870 Magic Squares In Grid"
            date: "2025-12-30T21:00:50+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Magic Squares In Grid](https://leetcode.com/problems/magic-squares-in-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A 3 x 3 **magic square** is a 3 x 3 grid filled with distinct numbers **from **1** to **9 such that each row, column, and both diagonals all have the same sum.

Given a row x col grid of integers, how many 3 x 3 magic square subgrids are there?

Note: while a magic square can only contain numbers from 1 to 9, grid may contain numbers up to 15.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/09/11/magic_main.jpg)
```

**Input:** grid = [[4,3,8,4],[9,5,1,9],[2,7,6,2]]
**Output:** 1
**Explanation: **
The following subgrid is a 3 x 3 magic square:
![image](https://assets.leetcode.com/uploads/2020/09/11/magic_valid.jpg)
while this one is not:
![image](https://assets.leetcode.com/uploads/2020/09/11/magic_invalid.jpg)
In total, there is only one magic square inside the given grid.

```

Example 2:

```

**Input:** grid = [[8]]
**Output:** 0

```

 

**Constraints:**

	row == grid.length
	col == grid[i].length
	1 <= row, col <= 10
	0 <= grid[i][j] <= 15

{% raw %}


```rust


use std::collections::HashSet;
impl Solution {
    pub fn num_magic_squares_inside(grid: Vec<Vec<i32>>) -> i32 {
        


        fn is_magic_square(g: Vec<Vec<i32>>) -> bool {
            //print!("{:?}", g);
            let mut a = 0;
            for k in g.clone() {
                let mut s = 0;
                for m in k {
                    s += m
                }
                if a == 0 {
                    a = s
                } else {
                    if (a != s) {
                        return false
                    }
                }
            }

            if a != g[0][0] + g[1][1] + g[2][2] {
                return false;
            }

            if a != g[0][2] + g[1][1] + g[2][0] {
                return false;
            }

            if a != g[0][0] + g[1][0] + g[2][0] {
                return false;
            }

            if a != g[0][1] + g[1][1] + g[2][1] {
                return false;
            }

            if a != g[0][2] + g[1][2] + g[2][2] {
                return false;
            }

            let mut hs = HashSet::new();
            hs.insert(g[0][0]);
            hs.insert(g[0][1]);
            hs.insert(g[0][2]);
            hs.insert(g[1][0]);
            hs.insert(g[1][1]);
            hs.insert(g[1][2]);
            hs.insert(g[2][0]);
            hs.insert(g[2][1]);
            hs.insert(g[2][2]);
            if hs.len() != 9 {
                return false;
            }
            if hs.contains(&0) {
                return false;
            }
            if g[0][0] + g[0][1] + g[0][2] + g[1][0] + g[1][1] + g[1][2] + g[2][0] + g[2][1] + g[2][2]  != 45 {
                return false;
            }
            return true;
        }


        let mut i  = 0;
        let mut j = 0;
        let mut ans = 0;
        for i in 0..grid.len() {
            
            let mut d = i;
            for j in 0..grid[i].len() {
                let mut m = Vec::new();
                
                while(d < i + 3) {
                    let mut n = Vec::new();
                    if j + 2 < grid[i].len() && d < grid.len() {
                    n.push(grid[d][j]);
                    n.push(grid[d][j+1]);
                    n.push(grid[d][j+2]);
                    } else {
                        break
                    }
                    d += 1;
                    m.push(n.clone());
                    //print!("{:?} nnnnn", m);
                }
                
                if m.len() == 3 && is_magic_square(m.clone()) {
                    ans += 1;
                }


                d = i;
                
            }
        }

        return ans;
        
    }
}


{% endraw %}
```
