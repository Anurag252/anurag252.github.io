---
            title: "2598 Shortest Distance To Target String In A Circular Array"
            date: "2026-04-15T22:31:02+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Shortest Distance to Target String in a Circular Array](https://leetcode.com/problems/shortest-distance-to-target-string-in-a-circular-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a **0-indexed** **circular** string array words and a string target. A **circular array** means that the array's end connects to the array's beginning.

	Formally, the next element of words[i] is words[(i + 1) % n] and the previous element of words[i] is words[(i - 1 + n) % n], where n is the length of words.

Starting from startIndex, you can move to either the next word or the previous word with 1 step at a time.

Return *the **shortest** distance needed to reach the string* target. If the string target does not exist in words, return -1.

 

Example 1:

```

**Input:** words = ["hello","i","am","leetcode","hello"], target = "hello", startIndex = 1
**Output:** 1
**Explanation:** We start from index 1 and can reach "hello" by
- moving 3 units to the right to reach index 4.
- moving 2 units to the left to reach index 4.
- moving 4 units to the right to reach index 0.
- moving 1 unit to the left to reach index 0.
The shortest distance to reach "hello" is 1.

```

Example 2:

```

**Input:** words = ["a","b","leetcode"], target = "leetcode", startIndex = 0
**Output:** 1
**Explanation:** We start from index 0 and can reach "leetcode" by
- moving 2 units to the right to reach index 2.
- moving 1 unit to the left to reach index 2.
The shortest distance to reach "leetcode" is 1.
```

Example 3:

```

**Input:** words = ["i","eat","leetcode"], target = "ate", startIndex = 0
**Output:** -1
**Explanation:** Since "ate" does not exist in words, we return -1.

```

 

**Constraints:**

	1 <= words.length <= 100
	1 <= words[i].length <= 100
	words[i] and target consist of only lowercase English letters.
	0 <= startIndex < words.length

{% raw %}


```rust


impl Solution {
    pub fn closest_target(words: Vec<String>, target: String, start_index: i32) -> i32 {
        let n = words.len() as i32;
        let mut ans = n;
        let mut found = false;
        
        for (i, word) in words.iter().enumerate() {
            if word == &target {
                let dist = (i as i32 - start_index).abs();
                let distance = dist.min(n - dist);
                ans = ans.min(distance)
            }
        }
        
        if ans < n {
            ans
        } else {
            -1
        }
    }
}


{% endraw %}
```
