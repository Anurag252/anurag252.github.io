---
            title: "1800 Concatenation Of Consecutive Binary Numbers"
            date: "2026-02-28T21:15:23+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Concatenation of Consecutive Binary Numbers](https://leetcode.com/problems/concatenation-of-consecutive-binary-numbers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer n, return *the **decimal value** of the binary string formed by concatenating the binary representations of *1* to *n* in order, **modulo ***109 + 7.

 

Example 1:

```

**Input:** n = 1
**Output:** 1
**Explanation: **"1" in binary corresponds to the decimal value 1. 

```

Example 2:

```

**Input:** n = 3
**Output:** 27
**Explanation: **In binary, 1, 2, and 3 corresponds to "1", "10", and "11".
After concatenating them, we have "11011", which corresponds to the decimal value 27.

```

Example 3:

```

**Input:** n = 12
**Output:** 505379714
**Explanation**: The concatenation results in "1101110010111011110001001101010111100".
The decimal value of that is 118505380540.
After modulo 109 + 7, the result is 505379714.

```

 

**Constraints:**

	1 <= n <= 105

{% raw %}


```rust


impl Solution {
    pub fn concatenated_binary(n: i32) -> i32 {
        let mut result: i64 = 0;
        let modulo: i64 = 1_000_000_007;
        let mut bit_length = 0;

        for i in 1..=n {
            // If i is power of 2, increase bit length
            if (i & (i - 1)) == 0 {
                bit_length += 1;
            }

            result = ((result << bit_length) + i as i64) % modulo;
        }

        result as i32
    }
}


{% endraw %}
```
