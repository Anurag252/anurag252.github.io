---
            title: "3886 Count Number Of Trapezoids I"
            date: "2025-12-02T14:46:09+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count Number of Trapezoids I](https://leetcode.com/problems/count-number-of-trapezoids-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a 2D integer array points, where points[i] = [xi, yi] represents the coordinates of the ith point on the Cartesian plane.

A **horizontal** **trapezoid** is a convex quadrilateral with at least one pair of horizontal sides (i.e. parallel to the x-axis). Two lines are parallel if and only if they have the same slope.

Return the  number of unique ***horizontal* *trapezoids*** that can be formed by choosing any four distinct points from points.

Since the answer may be very large, return it **modulo** 109 + 7.

 

Example 1:

**Input:** points = [[1,0],[2,0],[3,0],[2,2],[3,2]]

**Output:** 3

**Explanation:**

![image](https://assets.leetcode.com/uploads/2025/05/01/desmos-graph-6.png) ![image](https://assets.leetcode.com/uploads/2025/05/01/desmos-graph-7.png) ![image](https://assets.leetcode.com/uploads/2025/05/01/desmos-graph-8.png)

There are three distinct ways to pick four points that form a horizontal trapezoid:

	Using points [1,0], [2,0], [3,2], and [2,2].
	Using points [2,0], [3,0], [3,2], and [2,2].
	Using points [1,0], [3,0], [3,2], and [2,2].

Example 2:

**Input:** points = [[0,0],[1,0],[0,1],[2,1]]

**Output:** 1

**Explanation:**

![image](https://assets.leetcode.com/uploads/2025/04/29/desmos-graph-5.png)

There is only one horizontal trapezoid that can be formed.

 

**Constraints:**

	4 <= points.length <= 105
	–108 <= xi, yi <= 108
	All points are pairwise distinct.

{% raw %}


```rust


use std::collections::HashMap;

impl Solution {
    pub fn count_trapezoids(points: Vec<Vec<i32>>) -> i32 {
        // helper for mC2
        fn fact(a: i64) -> i64 {
            (a * (a - 1)) / 2
        }

        let mut hs: HashMap<i32, Vec<(i32, i32)>> = HashMap::new();

        // group points by y
        for k in points {
            hs.entry(k[1]).or_insert(Vec::new()).push((k[0], k[1]));
        }

        let modulo: i64 = 1_000_000_007;

        // compute fact(m) for each group
        let mut f: Vec<i64> = hs.values().map(|v| fact(v.len() as i64)).collect();

        // linear-time sum over all pairs
        let mut total: i64 = 0;
        let mut sum_f: i64 = f.iter().sum();
        for fi in f {
            sum_f -= fi;
            total = (total + fi * sum_f) % modulo;
        }

        total as i32
    }
}



{% endraw %}
```
