---
            title: "1426 Find N Unique Integers Sum Up To Zero"
            date: "2025-09-07T10:55:18+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Find N Unique Integers Sum up to Zero](https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an integer n, return **any** array containing n **unique** integers such that they add up to 0.

 

Example 1:

```

**Input:** n = 5
**Output:** [-7,-1,1,3,4]
**Explanation:** These arrays also are accepted [-5,-1,1,2,3] , [-3,-1,2,-2,4].

```

Example 2:

```

**Input:** n = 3
**Output:** [-1,0,1]

```

Example 3:

```

**Input:** n = 1
**Output:** [0]

```

 

**Constraints:**

	1 <= n <= 1000

{% raw %}


```rust


impl Solution {
    pub fn sum_zero(n: i32) -> Vec<i32> {
        let mut arr = Vec::new();

        for  i in -(n/2)..=(n/2) {
            if i == 0 {
                if 2*arr.len() == n as usize {
                    continue;
                }
            }
             arr.push(i);
        }
        arr
    }
}


{% endraw %}
```
