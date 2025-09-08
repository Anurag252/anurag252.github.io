---
            title: "1440 Convert Integer To The Sum Of Two No Zero Integers"
            date: "2025-09-08T08:31:49+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Convert Integer to the Sum of Two No-Zero Integers](https://leetcode.com/problems/convert-integer-to-the-sum-of-two-no-zero-integers) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

**No-Zero integer** is a positive integer that **does not contain any 0** in its decimal representation.

Given an integer n, return *a list of two integers* [a, b] *where*:

	a and b are **No-Zero integers**.
	a + b = n

The test cases are generated so that there is at least one valid solution. If there are many valid solutions, you can return any of them.

 

Example 1:

```

**Input:** n = 2
**Output:** [1,1]
**Explanation:** Let a = 1 and b = 1.
Both a and b are no-zero integers, and a + b = 2 = n.

```

Example 2:

```

**Input:** n = 11
**Output:** [2,9]
**Explanation:** Let a = 2 and b = 9.
Both a and b are no-zero integers, and a + b = 11 = n.
Note that there are other valid answers as [8, 3] that can be accepted.

```

 

**Constraints:**

	2 <= n <= 104

{% raw %}


```rust


impl Solution {
    pub fn get_no_zero_integers(n: i32) -> Vec<i32> {
        for i in 1..=n {
            let mut a = i;
            let mut matched = true;
            while( a >= 10) {
                
                if a % 10 == 0 {
                    matched = false;
                    break;
                }
                a = a / 10;
            }
            if !matched {
                continue;
            }
            a = n - i;
            while( a >= 10) {
                
                if a % 10 == 0 {
                    matched = false;
                    break;
                }
                a = a / 10;
            }
            if matched {
                return [i, n-i].to_vec();
            }
        }
        return [0,0].to_vec();
    }
}


{% endraw %}
```
