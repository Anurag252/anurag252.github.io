---
            title: "1306 Minimum Absolute Difference"
            date: "2026-01-26T22:32:36+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Absolute Difference](https://leetcode.com/problems/minimum-absolute-difference) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array of **distinct** integers arr, find all pairs of elements with the minimum absolute difference of any two elements.

Return a list of pairs in ascending order(with respect to pairs), each pair [a, b] follows

	a, b are from arr
	a < b
	b - a equals to the minimum absolute difference of any two elements in arr

 

Example 1:

```

**Input:** arr = [4,2,1,3]
**Output:** [[1,2],[2,3],[3,4]]
**Explanation: **The minimum absolute difference is 1. List all pairs with difference equal to 1 in ascending order.
```

Example 2:

```

**Input:** arr = [1,3,6,10,15]
**Output:** [[1,3]]

```

Example 3:

```

**Input:** arr = [3,8,-10,23,19,-4,-14,27]
**Output:** [[-14,-10],[19,23],[23,27]]

```

 

**Constraints:**

	2 <= arr.length <= 105
	-106 <= arr[i] <= 106

{% raw %}


```rust


 use std::collections::HashMap;
 use itertools::enumerate;

impl Solution {
    pub fn minimum_abs_difference(arr: Vec<i32>) -> Vec<Vec<i32>> {
        let mut hs: HashMap<i32, Vec<Vec<i32>>> = HashMap::new();
        let mut s = arr.clone();

        s.sort();

        for i in 1..s.len() {
            let diff = s[i] - s[i - 1];

            if !hs.contains_key(&diff) {
                hs.insert(diff, Vec::new());
            }

            let z = vec![s[i - 1], s[i]];
            hs.get_mut(&diff).unwrap().push(z);
        }

        let mut g = i32::MAX;
        let mut res = Vec::new();

        for (a, b) in hs {
            if a < g {
                g = a;
                res = b;
            }
        }

        res
    }
}


{% endraw %}
```
