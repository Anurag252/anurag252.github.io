---
            title: "3278 Find The Number Of Ways To Place People I"
            date: "2025-09-02T09:21:36+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Find the Number of Ways to Place People I](https://leetcode.com/problems/find-the-number-of-ways-to-place-people-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a 2D array points of size n x 2 representing integer coordinates of some points on a 2D plane, where points[i] = [xi, yi].

Count the number of pairs of points (A, B), where

	A is on the **upper left** side of B, and
	there are no other points in the rectangle (or line) they make (**including the border**).

Return the count.

 

Example 1:

**Input:** points = [[1,1],[2,2],[3,3]]

**Output:** 0

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/01/04/example1alicebob.png)

There is no way to choose A and B so A is on the upper left side of B.

Example 2:

**Input:** points = [[6,2],[4,4],[2,6]]

**Output:** 2

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/06/25/t2.jpg)

	The left one is the pair (points[1], points[0]), where points[1] is on the upper left side of points[0] and the rectangle is empty.
	The middle one is the pair (points[2], points[1]), same as the left one it is a valid pair.
	The right one is the pair (points[2], points[0]), where points[2] is on the upper left side of points[0], but points[1] is inside the rectangle so it's not a valid pair.

Example 3:

**Input:** points = [[3,1],[1,3],[1,1]]

**Output:** 2

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/06/25/t3.jpg)

	The left one is the pair (points[2], points[0]), where points[2] is on the upper left side of points[0] and there are no other points on the line they form. Note that it is a valid state when the two points form a line.
	The middle one is the pair (points[1], points[2]), it is a valid pair same as the left one.
	The right one is the pair (points[1], points[0]), it is not a valid pair as points[2] is on the border of the rectangle.

 

**Constraints:**

	2 <= n <= 50
	points[i].length == 2
	0 <= points[i][0], points[i][1] <= 50
	All points[i] are distinct.

{% raw %}


```rust


use std::collections::HashSet;

impl Solution {
    pub fn number_of_pairs(points: Vec<Vec<i32>>) -> i32 {
        // upper left is x <= mx and y >= my
        // to form a rect - mx and nx and my and ny , no points should lie here
        // n is 50, so we could just nest two loops
        // to find if a point lies in rect, we need to keep sorted arr of both x and y and find common between both arrays
        // that's third loop -> we could also perform bin search here 
        // 
        let mut x_sorted = points.clone();
        x_sorted.sort_by(|a, b| a[0].cmp(&b[0]));
        let mut y_sorted = points.clone();
        y_sorted.sort_by(|a, b| a[1].cmp(&b[1]));
        let mut res = 0;
        for k in &points {
            for l in &points {
                if k == l {
                    continue
                }
                let ax = k[0];
                let ay = k[1];
                let bx = l[0];
                let by = l[1];
                
                if ax > bx || ay < by {
                    continue;
                }

                let mut valid = true;
                for m in &points {
                    if m == k || m == l {
                        continue;
                    }
                    if ax <= m[0] && m[0] <= bx && by <= m[1] && m[1] <= ay {
                        valid = false; // point lies inside or on boundary
                        break;
                    }
                }

                if valid {
                    res += 1;
                }

            }
        }
        res
    }
}


{% endraw %}
```
