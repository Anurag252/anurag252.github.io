---
            title: "1884 Minimum Changes To Make Alternating Binary String"
            date: "2026-03-05T21:29:09+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Changes To Make Alternating Binary String](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a string s consisting only of the characters '0' and '1'. In one operation, you can change any '0' to '1' or vice versa.

The string is called alternating if no two adjacent characters are equal. For example, the string "010" is alternating, while the string "0100" is not.

Return *the **minimum** number of operations needed to make* s *alternating*.

 

Example 1:

```

**Input:** s = "0100"
**Output:** 1
**Explanation:** If you change the last character to '1', s will be "0101", which is alternating.

```

Example 2:

```

**Input:** s = "10"
**Output:** 0
**Explanation:** s is already alternating.

```

Example 3:

```

**Input:** s = "1111"
**Output:** 2
**Explanation:** You need two operations to reach "0101" or "1010".

```

 

**Constraints:**

	1 <= s.length <= 104
	s[i] is either '0' or '1'.

{% raw %}


```rust


impl Solution {
    pub fn min_operations(s: String) -> i32 {
        /*
        let mut prev = -1;
        let mut res = 0;
        for k in s.chars() {
            if prev == -1 {
                prev = k as i32;
            } else {
                if prev == k as i32{
                    res += 1;
                    if prev == 0 {
                        prev = 1;
                    } else {
                        prev = 0;
                    }
                } else {
                    prev = k as i32;
                }
            }
        }
        res*/

        // greedy failed, too fast


        // recursion of all will be too slow
        /* fn recurse(s : String) {
            let mut prev = -1;
            let mut res = 0;
            for (i,k) in enumerate(s.chars()) {
                if prev == -1 {
                    prev = k
                } else {
                    if prev == k {
                        res = 1 + recurse()
                    } else {
                        prev = k;
                    }
                }
            }
        */
        // how abt enumeration ?
        // only two possible ans, why not find the smaller diff between two srings 
        let mut res1 = 0;
        let mut res2 = 0;
        let mut init1 = 0;

        let mut init2 = 1;

        for k in s.chars() {
            //print!("{}", k.to_digit(10));
            if k.to_digit(10).unwrap() != init1 {
                res1 += 1;
            }
            
            if k.to_digit(10).unwrap() != init2 {
                res2 += 1;
            }

            if init1 == 1 {
                init1 = 0;
            } else {
                init1 = 1;
            }


            if init2 == 1 {
                init2 = 0;
            } else {
                init2 = 1;
            }

        }
        print!("{} {}", res1, res2);
        return res1.min(res2);

    }
}


{% endraw %}
```
