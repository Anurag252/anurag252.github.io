---
            title: "1658 Minimum Swaps To Arrange A Binary Grid"
            date: "2026-03-02T20:51:38+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Swaps to Arrange a Binary Grid](https://leetcode.com/problems/minimum-swaps-to-arrange-a-binary-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an n x n binary grid, in one step you can choose two **adjacent rows** of the grid and swap them.

A grid is said to be **valid** if all the cells above the main diagonal are **zeros**.

Return *the minimum number of steps* needed to make the grid valid, or **-1** if the grid cannot be valid.

The main diagonal of a grid is the diagonal that starts at cell (1, 1) and ends at cell (n, n).

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/07/28/fw.jpg)
```

**Input:** grid = [[0,0,1],[1,1,0],[1,0,0]]
**Output:** 3

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/07/16/e2.jpg)
```

**Input:** grid = [[0,1,1,0],[0,1,1,0],[0,1,1,0],[0,1,1,0]]
**Output:** -1
**Explanation:** All rows are similar, swaps have no effect on the grid.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2020/07/16/e3.jpg)
```

**Input:** grid = [[1,0,0],[1,1,0],[1,1,1]]
**Output:** 0

```

 

**Constraints:**

	n == grid.length == grid[i].length
	1 <= n <= 200
	grid[i][j] is either 0 or 1

{% raw %}


```rust


impl Solution {
    pub fn min_swaps(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        
        // Precompute trailing zeros for each row
        let mut trailing_zeros: Vec<usize> = vec![0; n];
        for i in 0..n {
            let mut count = 0;
            for j in (0..n).rev() {
                if grid[i][j] == 0 {
                    count += 1;
                } else {
                    break;
                }
            }
            trailing_zeros[i] = count;
        }
        
        // Row i needs at least (n - 1 - i) trailing zeros
        let mut swaps = 0;
        let mut rows = trailing_zeros.clone();
        
        for i in 0..n {
            let needed = n - 1 - i;
            
            // Find the closest row at or below i that satisfies the requirement
            let mut found = None;
            for j in i..n {
                if rows[j] >= needed {
                    found = Some(j);
                    break;
                }
            }
            
            match found {
                None => return -1,
                Some(j) => {
                    // Bubble row j up to position i
                    swaps += (j - i) as i32;
                    // Shift rows down
                    for k in (i+1..=j).rev() {
                        rows.swap(k, k-1);
                    }
                }
            }
        }
        
        swaps
    }
}



{% endraw %}
```
