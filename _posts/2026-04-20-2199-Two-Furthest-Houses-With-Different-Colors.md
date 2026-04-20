---
            title: "2199 Two Furthest Houses With Different Colors"
            date: "2026-04-20T22:54:42+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Two Furthest Houses With Different Colors](https://leetcode.com/problems/two-furthest-houses-with-different-colors) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

There are n houses evenly lined up on the street, and each house is beautifully painted. You are given a **0-indexed** integer array colors of length n, where colors[i] represents the color of the ith house.

Return *the **maximum** distance between **two** houses with **different** colors*.

The distance between the ith and jth houses is abs(i - j), where abs(x) is the **absolute value** of x.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/10/31/eg1.png)
```

**Input:** colors = [**1**,1,1,**6**,1,1,1]
**Output:** 3
**Explanation:** In the above image, color 1 is blue, and color 6 is red.
The furthest two houses with different colors are house 0 and house 3.
House 0 has color 1, and house 3 has color 6. The distance between them is abs(0 - 3) = 3.
Note that houses 3 and 6 can also produce the optimal answer.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/10/31/eg2.png)
```

**Input:** colors = [**1**,8,3,8,**3**]
**Output:** 4
**Explanation:** In the above image, color 1 is blue, color 8 is yellow, and color 3 is green.
The furthest two houses with different colors are house 0 and house 4.
House 0 has color 1, and house 4 has color 3. The distance between them is abs(0 - 4) = 4.

```

Example 3:

```

**Input:** colors = [**0**,**1**]
**Output:** 1
**Explanation:** The furthest two houses with different colors are house 0 and house 1.
House 0 has color 0, and house 1 has color 1. The distance between them is abs(0 - 1) = 1.

```

 

**Constraints:**

	n == colors.length
	2 <= n <= 100
	0 <= colors[i] <= 100
	Test data are generated such that **at least** two houses have different colors.

{% raw %}


```rust


use std::collections::HashMap;

impl Solution {
    pub fn max_distance(colors: Vec<i32>) -> i32 {
        let mut memo = HashMap::new();
        Self::solve(&colors, 0, colors.len() - 1, &mut memo)
    }

    fn solve(colors: &[i32], start: usize, end: usize, memo: &mut HashMap<(usize, usize), i32>) -> i32 {
        if start >= end {
            return 0;
        }
        if let Some(&res) = memo.get(&(start, end)) {
            return res;
        }

        let res = if colors[start] != colors[end] {
            (end - start) as i32
        } else {
            let left = Self::solve(colors, start + 1, end, memo);
            let right = Self::solve(colors, start, end - 1, memo);
            std::cmp::max(left, right)
        };
        memo.insert((start, end), res);
        res
    }
}


{% endraw %}
```
