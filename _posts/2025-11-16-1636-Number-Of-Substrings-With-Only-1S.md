---
            title: "1636 Number Of Substrings With Only 1S"
            date: "2025-11-16T20:21:06+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Number of Substrings With Only 1s](https://leetcode.com/problems/number-of-substrings-with-only-1s) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a binary string s, return *the number of substrings with all characters* 1*'s*. Since the answer may be too large, return it modulo 109 + 7.

 

Example 1:

```

**Input:** s = "0110111"
**Output:** 9
**Explanation:** There are 9 substring in total with only 1's characters.
"1" -> 5 times.
"11" -> 3 times.
"111" -> 1 time.
```

Example 2:

```

**Input:** s = "101"
**Output:** 2
**Explanation:** Substring "1" is shown 2 times in s.

```

Example 3:

```

**Input:** s = "111111"
**Output:** 21
**Explanation:** Each substring contains only 1's characters.

```

 

**Constraints:**

	1 <= s.length <= 105
	s[i] is either '0' or '1'.

{% raw %}


```rust


impl Solution {
    pub fn num_sub(s: String) -> i32 {
        const MODULO: i64 = 1000000007;
        let mut total: i64 = 0;
        let mut consecutive: i64 = 0;
        for c in s.chars() {
            if c == '0' {
                total += consecutive * (consecutive + 1) / 2;
                total %= MODULO;
                consecutive = 0;
            } else {
                consecutive += 1;
            }
        }
        total += consecutive * (consecutive + 1) / 2;
        total %= MODULO;
        total as i32
    }
}


{% endraw %}
```
