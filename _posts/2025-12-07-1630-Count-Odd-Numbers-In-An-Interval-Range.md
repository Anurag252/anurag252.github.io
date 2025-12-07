---
            title: "1630 Count Odd Numbers In An Interval Range"
            date: "2025-12-07T23:41:19+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count Odd Numbers in an Interval Range](https://leetcode.com/problems/count-odd-numbers-in-an-interval-range) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given two non-negative integers low and high. Return the *count of odd numbers between *low* and *high* (inclusive)*.

 

Example 1:

```

**Input:** low = 3, high = 7
**Output:** 3
**Explanation: **The odd numbers between 3 and 7 are [3,5,7].
```

Example 2:

```

**Input:** low = 8, high = 10
**Output:** 1
**Explanation: **The odd numbers between 8 and 10 are [9].
```

 

**Constraints:**

	0 <= low <= high <= 10^9

{% raw %}


```rust


impl Solution {
    pub fn count_odds(low: i32, high: i32) -> i32 {
        if low % 2 == 0 && high % 2 == 0 {
            return (high - low ) / 2;
        }
        
        if low % 2 == 0 || high % 2 == 0 {
            return (high - low ) / 2 + 1;
        }

         if low % 2 != 0 && high % 2 != 0 {
            return (high - low ) / 2 + 1;
        }
        0
    }
}


{% endraw %}
```
