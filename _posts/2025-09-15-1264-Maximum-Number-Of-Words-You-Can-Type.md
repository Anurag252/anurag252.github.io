---
            title: "1264 Maximum Number Of Words You Can Type"
            date: "2025-09-15T22:11:02+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximum Number of Words You Can Type](https://leetcode.com/problems/maximum-number-of-words-you-can-type) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

There is a malfunctioning keyboard where some letter keys do not work. All other keys on the keyboard work properly.

Given a string text of words separated by a single space (no leading or trailing spaces) and a string brokenLetters of all **distinct** letter keys that are broken, return *the **number of words** in* text *you can fully type using this keyboard*.

 

Example 1:

```

**Input:** text = "hello world", brokenLetters = "ad"
**Output:** 1
**Explanation:** We cannot type "world" because the 'd' key is broken.

```

Example 2:

```

**Input:** text = "leet code", brokenLetters = "lt"
**Output:** 1
**Explanation:** We cannot type "leet" because the 'l' and 't' keys are broken.

```

Example 3:

```

**Input:** text = "leet code", brokenLetters = "e"
**Output:** 0
**Explanation:** We cannot type either word because the 'e' key is broken.

```

 

**Constraints:**

	1 <= text.length <= 104
	0 <= brokenLetters.length <= 26
	text consists of words separated by a single space without any leading or trailing spaces.
	Each word only consists of lowercase English letters.
	brokenLetters consists of **distinct** lowercase English letters.

{% raw %}


```rust


use std::collections::HashSet;
impl Solution {
    pub fn can_be_typed_words(text: String, broken_letters: String) -> i32 {
        let mut res = 0;
        let mut hs = HashSet::new();

        for b in broken_letters.chars() {
            hs.insert(b);
        }

        for k in text.split(" "){
            let mut found = false;
            for m in k.chars() {
                if hs.contains(&m) {
                    found = true;
                    break;
                }
            }
            if !found{
                res += 1;
            }
        }
        return res;
    }
}


{% endraw %}
```
