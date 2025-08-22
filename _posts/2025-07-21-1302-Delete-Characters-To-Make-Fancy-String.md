---
            title: "1302 Delete Characters To Make Fancy String"
            date: "2025-07-21T07:52:37+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Delete Characters to Make Fancy String](https://leetcode.com/problems/delete-characters-to-make-fancy-string) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

A **fancy string** is a string where no **three** **consecutive** characters are equal.

Given a string s, delete the **minimum** possible number of characters from s to make it **fancy**.

Return *the final string after the deletion*. It can be shown that the answer will always be **unique**.

 

Example 1:

```

**Input:** s = "leeetcode"
**Output:** "leetcode"
**Explanation:**
Remove an 'e' from the first group of 'e's to create "leetcode".
No three consecutive characters are equal, so return "leetcode".

```

Example 2:

```

**Input:** s = "aaabaaaa"
**Output:** "aabaa"
**Explanation:**
Remove an 'a' from the first group of 'a's to create "aabaaaa".
Remove two 'a's from the second group of 'a's to create "aabaa".
No three consecutive characters are equal, so return "aabaa".

```

Example 3:

```

**Input:** s = "aab"
**Output:** "aab"
**Explanation:** No three consecutive characters are equal, so return "aab".

```

 

**Constraints:**

	1 <= s.length <= 105
	s consists only of lowercase English letters.

{% raw %}


```rust


use std::collections::HashMap;
impl Solution {
    pub fn make_fancy_string(s: String) -> String {
        let mut left : usize = 0;
        let mut right : usize = 0 ;
        let mut result : String = "".to_string();
        let mut chars = HashMap::new();
        let s_chars: Vec<char> = s.chars().collect();

        while right < 2 && right < s.len() {
            chars.entry(s_chars[right]).and_modify(|x| *x += 1).or_insert(1);
            result += &(s_chars[right]).to_string();
            right += 1;
        }
 
        while right < s.len() {
            chars.entry(s_chars[right]).and_modify(|x| *x += 1).or_insert(1);
            //println!("{:?}", chars);
            if chars.len() == 1 {
                
            } else {
                result += &(s_chars[right]).to_string()
            }
            chars.entry(s_chars[left]).and_modify(|x| *x -= 1);
            if chars.get(&s_chars[left]) == Some(&0) {
                chars.remove(&s_chars[left]);
            }
            left += 1 ;
            
            right += 1;
        }
        result

    }
}


{% endraw %}
```
