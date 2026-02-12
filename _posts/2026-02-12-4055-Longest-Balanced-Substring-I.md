---
            title: "4055 Longest Balanced Substring I"
            date: "2026-02-12T21:17:45+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Longest Balanced Substring I](https://leetcode.com/problems/longest-balanced-substring-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s consisting of lowercase English letters.

A **substring** of s is called **balanced** if all **distinct** characters in the **substring** appear the **same** number of times.

Return the **length** of the **longest balanced substring** of s.

 

Example 1:

**Input:** s = "abbac"

**Output:** 4

**Explanation:**

The longest balanced substring is "abba" because both distinct characters 'a' and 'b' each appear exactly 2 times.

Example 2:

**Input:** s = "zzabccy"

**Output:** 4

**Explanation:**

The longest balanced substring is "zabc" because the distinct characters 'z', 'a', 'b', and 'c' each appear exactly 1 time.​​​​​​​

Example 3:

**Input:** s = "aba"

**Output:** 2

**Explanation:**

**​​​​​​​**One of the longest balanced substrings is "ab" because both distinct characters 'a' and 'b' each appear exactly 1 time. Another longest balanced substring is "ba".

 

**Constraints:**

	1 <= s.length <= 1000
	s consists of lowercase English letters.

{% raw %}


```rust


use std::collections::HashMap;
impl Solution {
    pub fn longest_balanced(s: String) -> i32 {
        // only 1000 as length
        //all substrings in 10^ 6
        let mut res = 0;
        for (i,k1) in s.chars().enumerate() {
            let mut hs: HashMap<char, i32> = HashMap::new();
            for (j,k2) in s[i..].chars().enumerate() {
               *hs.entry(k2).or_insert(0) += 1;
            
            let mut a = 0;
            let mut found = true;
            for &count in hs.values() {
                if a == 0 {
                    a = count;
                } else if a != count {
                    found = false;
                    break;
                }
            }
            if found {
                res = res.max(j+ 1 );
            }
        }
        }

        return res as i32;
    }
}


{% endraw %}
```
