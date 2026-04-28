---
            title: "2160 Minimum Operations To Make A Uni Value Grid"
            date: "2026-04-28T22:33:17+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Operations to Make a Uni-Value Grid](https://leetcode.com/problems/minimum-operations-to-make-a-uni-value-grid) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a 2D integer grid of size m x n and an integer x. In one operation, you can **add** x to or **subtract** x from any element in the grid.

A **uni-value grid** is a grid where all the elements of it are equal.

Return *the **minimum** number of operations to make the grid **uni-value***. If it is not possible, return -1.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/09/21/gridtxt.png)
```

**Input:** grid = [[2,4],[6,8]], x = 2
**Output:** 4
**Explanation:** We can make every element equal to 4 by doing the following: 
- Add x to 2 once.
- Subtract x from 6 once.
- Subtract x from 8 twice.
A total of 4 operations were used.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/09/21/gridtxt-1.png)
```

**Input:** grid = [[1,5],[2,3]], x = 1
**Output:** 5
**Explanation:** We can make every element equal to 3.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/09/21/gridtxt-2.png)
```

**Input:** grid = [[1,2],[3,4]], x = 2
**Output:** -1
**Explanation:** It is impossible to make every element equal.

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	1 <= m, n <= 105
	1 <= m * n <= 105
	1 <= x, grid[i][j] <= 104

{% raw %}


```rust


use std::cmp::min;
use std::collections::HashSet;
impl Solution {
    pub fn min_operations(grid: Vec<Vec<i32>>, x: i32) -> i32 {

        /* its always apossible ? No ,shortest path is just  step behind
        many destinations ?
        maybe mmost frequent element is an unique number
        one of the number from array is unique number
        grid is not relevant ? it could be an array ?
        could binary search be possible ?
        we search for ans ?
        sum(arr) + knx // m is an integer ?

        m0st promising is choose each number from gid
        then find the diff between then
        [2,4,6,8] -> [4,4,4,4] 16-12 = 4 which means 2x
        [2,0,2,2*2] // not this does not work as plus 2 and -2 are eaten by each other and we never find ans
        given that 10000 is the limit of 
        choose 1 to 10K
        for each select and element as answer and perform the op on array ?
        */
        let mut hs = HashSet::new();
        let mut a = 0;
        let mut new_arr = Vec::new();

        
         for arr in grid.clone(){
                for j in arr {
                    new_arr.push(j);
                    a = j;
                    hs.insert(a);
                }
         }

         if new_arr.len() == 1 {
            return 0;
         }

         new_arr.sort();
         let dest = new_arr[new_arr.len() / 2];
         
        let mut res = 10000000;
        let mut temp = 0;
        let mut invalid = false;
        for j in new_arr.clone(){
                        //print!("{} {} {}\n", k as i32,j,x);
            if ((dest - j) % x != 0) {
                temp = 10000000;
                break;
            }
            temp += ((dest - j) / x).abs();
                       
        }
        res = temp;
                //print!("{}\n", temp as i32);
        if res == 10000000 {
            return -1;
        }
        return res;
        
    }
}


{% endraw %}
```
