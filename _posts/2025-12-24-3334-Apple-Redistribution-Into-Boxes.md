---
            title: "3334 Apple Redistribution Into Boxes"
            date: "2025-12-24T22:47:04+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Apple Redistribution into Boxes](https://leetcode.com/problems/apple-redistribution-into-boxes) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an array apple of size n and an array capacity of size m.

There are n packs where the ith pack contains apple[i] apples. There are m boxes as well, and the ith box has a capacity of capacity[i] apples.

Return *the **minimum** number of boxes you need to select to redistribute these *n* packs of apples into boxes*.

**Note** that, apples from the same pack can be distributed into different boxes.

 

Example 1:

```

**Input:** apple = [1,3,2], capacity = [4,3,1,5,2]
**Output:** 2
**Explanation:** We will use boxes with capacities 4 and 5.
It is possible to distribute the apples as the total capacity is greater than or equal to the total number of apples.

```

Example 2:

```

**Input:** apple = [5,5,5], capacity = [2,4,2,7]
**Output:** 4
**Explanation:** We will need to use all the boxes.

```

 

**Constraints:**

	1 <= n == apple.length <= 50
	1 <= m == capacity.length <= 50
	1 <= apple[i], capacity[i] <= 50
	The input is generated such that it's possible to redistribute packs of apples into boxes.

{% raw %}


```rust


impl Solution {
    pub fn minimum_boxes(apple: Vec<i32>, capacity: Vec<i32>) -> i32 {
        let mut c = capacity.clone();
        c.sort_by(|a,b| b.cmp(a));
        let mut total : i32 = apple.into_iter().sum();
        let mut res = 0;
        for k in c.clone() {
            total -= k;
            res += 1;
            if total <= 0 {
                return res;
            }
        }
        return res;
    }
}


{% endraw %}
```
