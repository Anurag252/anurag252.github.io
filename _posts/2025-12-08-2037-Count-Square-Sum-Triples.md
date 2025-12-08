---
            title: "2037 Count Square Sum Triples"
            date: "2025-12-08T22:58:37+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count Square Sum Triples](https://leetcode.com/problems/count-square-sum-triples) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

A **square triple** (a,b,c) is a triple where a, b, and c are **integers** and a2 + b2 = c2.

Given an integer n, return *the number of **square triples** such that *1 <= a, b, c <= n.

 

Example 1:

```

**Input:** n = 5
**Output:** 2
**Explanation**: The square triples are (3,4,5) and (4,3,5).

```

Example 2:

```

**Input:** n = 10
**Output:** 4
**Explanation**: The square triples are (3,4,5), (4,3,5), (6,8,10), and (8,6,10).

```

 

**Constraints:**

	1 <= n <= 250

{% raw %}


```rust


impl Solution {
    pub fn count_triples(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..n + 1 {
            for j in 1..n + 1 {
                for k in 1..n + 1 {
                    if i * i + j * j == k * k {
                        res += 1;
                    }
                    //print!("{} {} {}\n", i*i , j*j , k*k);
                }
            }
        }
        res
    }
}


{% endraw %}
```
