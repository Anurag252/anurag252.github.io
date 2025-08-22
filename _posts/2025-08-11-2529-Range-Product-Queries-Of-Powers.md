---
            title: "2529 Range Product Queries Of Powers"
            date: "2025-08-11T17:46:14+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Range Product Queries of Powers](https://leetcode.com/problems/range-product-queries-of-powers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a positive integer n, there exists a **0-indexed** array called powers, composed of the **minimum** number of powers of 2 that sum to n. The array is sorted in **non-decreasing** order, and there is **only one** way to form the array.

You are also given a **0-indexed** 2D integer array queries, where queries[i] = [lefti, righti]. Each queries[i] represents a query where you have to find the product of all powers[j] with lefti <= j <= righti.

Return* an array *answers*, equal in length to *queries*, where *answers[i]* is the answer to the *ith* query*. Since the answer to the ith query may be too large, each answers[i] should be returned **modulo** 109 + 7.

 

Example 1:

```

**Input:** n = 15, queries = [[0,1],[2,2],[0,3]]
**Output:** [2,4,64]
**Explanation:**
For n = 15, powers = [1,2,4,8]. It can be shown that powers cannot be a smaller size.
Answer to 1st query: powers[0] * powers[1] = 1 * 2 = 2.
Answer to 2nd query: powers[2] = 4.
Answer to 3rd query: powers[0] * powers[1] * powers[2] * powers[3] = 1 * 2 * 4 * 8 = 64.
Each answer modulo 109 + 7 yields the same answer, so [2,4,64] is returned.

```

Example 2:

```

**Input:** n = 2, queries = [[0,0]]
**Output:** [2]
**Explanation:**
For n = 2, powers = [2].
The answer to the only query is powers[0] = 2. The answer modulo 109 + 7 is the same, so [2] is returned.

```

 

**Constraints:**

	1 <= n <= 109
	1 <= queries.length <= 105
	0 <= starti <= endi < powers.length

{% raw %}
```rust
impl Solution {
    pub fn product_queries(n: i32, queries: Vec<Vec<i32>>) -> Vec<i32> {
        const MOD: i64 = 1_000_000_007;

        // Build vector of powers present in n: 2^i for each set bit (in increasing i)
        let mut powers: Vec<i64> = Vec::new();
        let mut bit: i64 = 0;
        let mut tmp = n as i64;
        while tmp > 0 {
            if tmp & 1 == 1 {
                powers.push((1i64 << bit) % MOD);
            }
            tmp >>= 1;
            bit += 1;
        }

        // Prefix products modulo MOD
        let mut prefix: Vec<i64> = Vec::with_capacity(powers.len());
        let mut prod: i64 = 1;
        for &p in &powers {
            prod = (prod * p) % MOD;
            prefix.push(prod);
        }

        // fast modular exponentiation
        fn mod_pow(mut a: i64, mut e: i64, m: i64) -> i64 {
            let mut res = 1i64;
            a %= m;
            while e > 0 {
                if e & 1 == 1 {
                    res = (res * a) % m;
                }
                a = (a * a) % m;
                e >>= 1;
            }
            res
        }

        // answer queries using modular inverse
        let mut ans: Vec<i32> = Vec::with_capacity(queries.len());
        for q in queries {
            let l = q[0] as usize;
            let r = q[1] as usize;
            let value = if l == 0 {
                prefix[r]
            } else {
                let inv = mod_pow(prefix[l - 1], MOD - 2, MOD);
                (prefix[r] * inv) % MOD
            };
            ans.push(value as i32);
        }
        ans
    }
}

{% endraw %}
