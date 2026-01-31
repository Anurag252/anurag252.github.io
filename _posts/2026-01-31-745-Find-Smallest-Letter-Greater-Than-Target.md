---
            title: "745 Find Smallest Letter Greater Than Target"
            date: "2026-01-31T22:08:44+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Find Smallest Letter Greater Than Target](https://leetcode.com/problems/find-smallest-letter-greater-than-target) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an array of characters letters that is sorted in **non-decreasing order**, and a character target. There are **at least two different** characters in letters.

Return *the smallest character in *letters* that is lexicographically greater than *target. If such a character does not exist, return the first character in letters.

 

Example 1:

```

**Input:** letters = ["c","f","j"], target = "a"
**Output:** "c"
**Explanation:** The smallest character that is lexicographically greater than 'a' in letters is 'c'.

```

Example 2:

```

**Input:** letters = ["c","f","j"], target = "c"
**Output:** "f"
**Explanation:** The smallest character that is lexicographically greater than 'c' in letters is 'f'.

```

Example 3:

```

**Input:** letters = ["x","x","y","y"], target = "z"
**Output:** "x"
**Explanation:** There are no characters in letters that is lexicographically greater than 'z' so we return letters[0].

```

 

**Constraints:**

	2 <= letters.length <= 104
	letters[i] is a lowercase English letter.
	letters is sorted in **non-decreasing** order.
	letters contains at least two different characters.
	target is a lowercase English letter.

{% raw %}


```rust


impl Solution {
    pub fn next_greatest_letter(letters: Vec<char>, target: char) -> char {
        let mut left : i32  = 0;
        let mut right : i32= (letters.len() - 1 ) as i32;

        while(left < right) {
            let mut mid = ((left + right) / 2) as i32;
            if letters[mid as usize] <= target {
                left = mid  as i32 + 1;
            }
            else{
                right = mid;
            }
        }
        if right == letters.len() as i32 - 1 && letters[right as usize] <= target{
            return letters[0];
        }
        letters[left as usize]
    }
}


{% endraw %}
```
