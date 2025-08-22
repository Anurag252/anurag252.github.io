---
            title: "1818 Maximum Score From Removing Substrings"
            date: "2025-07-23T09:49:40+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
            ---
            

            ## [Maximum Score From Removing Substrings](https://leetcode.com/problems/maximum-score-from-removing-substrings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s and two integers x and y. You can perform two types of operations any number of times.

	Remove substring "ab" and gain x points.

		For example, when removing "ab" from "cabxbae" it becomes "cxbae".

	Remove substring "ba" and gain y points.

		For example, when removing "ba" from "cabxbae" it becomes "cabxe".

Return *the maximum points you can gain after applying the above operations on* s.

 

Example 1:

```

**Input:** s = "cdbcbbaaabab", x = 4, y = 5
**Output:** 19
**Explanation:**
- Remove the "ba" underlined in "cdbcbbaaabab". Now, s = "cdbcbbaaab" and 5 points are added to the score.
- Remove the "ab" underlined in "cdbcbbaaab". Now, s = "cdbcbbaa" and 4 points are added to the score.
- Remove the "ba" underlined in "cdbcbbaa". Now, s = "cdbcba" and 5 points are added to the score.
- Remove the "ba" underlined in "cdbcba". Now, s = "cdbc" and 5 points are added to the score.
Total score = 5 + 4 + 5 + 5 = 19.
```

Example 2:

```

**Input:** s = "aabbaaxybbaabb", x = 5, y = 4
**Output:** 20

```

 

**Constraints:**

	1 <= s.length <= 105
	1 <= x, y <= 104
	s consists of lowercase English letters.

            {% raw %}
            ```rust
            impl Solution {
    pub fn maximum_gain(s: String, x: i32, y: i32) -> i32 {
        let mut points = 0;
        let mut chars: Vec<char> = s.chars().collect();

        if x > y {
            points += Self::remove_all(&mut chars, 'a', 'b', x);
            points += Self::remove_all(&mut chars, 'b', 'a', y);
        } else {
            points += Self::remove_all(&mut chars, 'b', 'a', y);
            points += Self::remove_all(&mut chars, 'a', 'b', x);
        }

        points
    }

    fn remove_all(chars: &mut Vec<char>, first: char, second: char, score: i32) -> i32 {
        let mut stack = Vec::new();
        let mut points = 0;

        for &ch in chars.iter() {
            if let Some(&last) = stack.last() {
                if last == first && ch == second {
                    stack.pop();
                    points += score;
                    continue;
                }
            }
            stack.push(ch);
        }

        // Replace original vec with remaining characters for next removal round
        chars.clear();
        chars.extend(stack);
        points
    }
}

            {% endraw %}
            