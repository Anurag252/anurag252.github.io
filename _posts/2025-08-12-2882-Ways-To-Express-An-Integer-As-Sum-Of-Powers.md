---
            title: "2882 Ways To Express An Integer As Sum Of Powers"
            date: "2025-08-12T10:07:44+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Ways to Express an Integer as Sum of Powers](https://leetcode.com/problems/ways-to-express-an-integer-as-sum-of-powers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two **positive** integers n and x.

Return *the number of ways *n* can be expressed as the sum of the *xth* power of **unique** positive integers, in other words, the number of sets of unique integers *[n1, n2, ..., nk]* where *n = n1x + n2x + ... + nkx*.*

Since the result can be very large, return it modulo 109 + 7.

For example, if n = 160 and x = 3, one way to express n is n = 23 + 33 + 53.

 

Example 1:

```

**Input:** n = 10, x = 2
**Output:** 1
**Explanation:** We can express n as the following: n = 32 + 12 = 10.
It can be shown that it is the only way to express 10 as the sum of the 2nd power of unique integers.

```

Example 2:

```

**Input:** n = 4, x = 1
**Output:** 2
**Explanation:** We can express n in the following ways:
- n = 41 = 4.
- n = 31 + 11 = 4.

```

 

**Constraints:**

	1 <= n <= 300
	1 <= x <= 5

{% raw %}
```rust
use std::collections::HashMap;



impl Solution {
    pub fn number_of_ways(n: i32, x: i32) -> i32 {
        let modulo = 1_000_000_007;

        // Precompute powers so we don't call pow repeatedly
        let mut powers = vec![];
        let mut base = 1;
        loop {
            let p = (base as i64).pow(x as u32);
            if p > n as i64 {
                break;
            }
            powers.push(p as i32);
            base += 1;
        }

        let mut hash = HashMap::new();

        fn recurse(
            n: i32,
            idx: usize,
            modulo: i32,
            powers: &Vec<i32>,
            hash: &mut HashMap<(i32, usize), i32>,
        ) -> i32 {
            if n == 0 {
                return 1;
            }
            if idx >= powers.len() || n < 0 {
                return 0;
            }

            if let Some(&t) = hash.get(&(n, idx)) {
                return t;
            }

            // Choice 1: skip this base
            let mut res = recurse(n, idx + 1, modulo, powers, hash) % modulo;

            // Choice 2: use this base if it fits
            if powers[idx] <= n {
                res = (res + recurse(n - powers[idx], idx + 1, modulo, powers, hash)) % modulo;
            }

            hash.insert((n, idx), res);
            res
        }

        recurse(n, 0, modulo, &powers, &mut hash)
    }
}

{% endraw %}
