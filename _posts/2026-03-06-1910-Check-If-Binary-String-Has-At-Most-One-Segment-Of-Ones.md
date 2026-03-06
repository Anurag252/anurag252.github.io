---
            title: "1910 Check If Binary String Has At Most One Segment Of Ones"
            date: "2026-03-06T21:41:22+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Check if Binary String Has at Most One Segment of Ones](https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given a binary string s **​​​​​without leading zeros**, return true​​​ *if *s* contains **at most one contiguous segment of ones***. Otherwise, return false.

 

Example 1:

```

**Input:** s = "1001"
**Output:** false
**Explanation: **The ones do not form a contiguous segment.

```

Example 2:

```

**Input:** s = "110"
**Output:** true
```

 

**Constraints:**

	1 <= s.length <= 100
	s[i]​​​​ is either '0' or '1'.
	s[0] is '1'.

{% raw %}


```rust


impl Solution {
    pub fn check_ones_segment(s: String) -> bool {
        let mut found_zeros = false;

        for k in s.chars() {
            if k.to_digit(10).unwrap() == 0 {
                found_zeros = true;
            }

            if k.to_digit(10).unwrap() == 1 && found_zeros {
                return false;
            }
        }
        return true;

    }
}


{% endraw %}
```
