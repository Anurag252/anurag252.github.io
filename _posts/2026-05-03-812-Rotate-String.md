---
            title: "812 Rotate String"
            date: "2026-05-03T08:55:24+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Rotate String](https://leetcode.com/problems/rotate-string) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given two strings s and goal, return true *if and only if* s *can become* goal *after some number of **shifts** on* s.

A **shift** on s consists of moving the leftmost character of s to the rightmost position.

	For example, if s = "abcde", then it will be "bcdea" after one shift.

 

Example 1:

```
**Input:** s = "abcde", goal = "cdeab"
**Output:** true

```

Example 2:

```
**Input:** s = "abcde", goal = "abced"
**Output:** false

```

 

**Constraints:**

	1 <= s.length, goal.length <= 100
	s and goal consist of lowercase English letters.

{% raw %}


```rust


impl Solution {
    pub fn rotate_string(s: String, goal: String) -> bool {
        // make the string twice and then perform string match using sliding window

        if s.len() != goal.len() {
            return false;
        }

        let mut new_s = s.clone() + &s;
        let mut left = 0;
        let mut right = goal.len();

        while(right < new_s.len()) {
            //print!("{} {}", goal, &new_s[left..right]  );
            if goal == new_s[left..right]{
                return true;
            }
            right += 1;
            left += 1;
        }
        return false;
    }
}


{% endraw %}
```
