---
            title: "3872 Find Most Frequent Vowel And Consonant"
            date: "2025-09-13T22:23:16+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Find Most Frequent Vowel and Consonant](https://leetcode.com/problems/find-most-frequent-vowel-and-consonant) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a string s consisting of lowercase English letters ('a' to 'z'). 

Your task is to:

	Find the vowel (one of 'a', 'e', 'i', 'o', or 'u') with the **maximum** frequency.
	Find the consonant (all other letters excluding vowels) with the **maximum** frequency.

Return the sum of the two frequencies.

**Note**: If multiple vowels or consonants have the same maximum frequency, you may choose any one of them. If there are no vowels or no consonants in the string, consider their frequency as 0.

The **frequency** of a letter x is the number of times it occurs in the string.

 

Example 1:

**Input:** s = "successes"

**Output:** 6

**Explanation:**

	The vowels are: 'u' (frequency 1), 'e' (frequency 2). The maximum frequency is 2.
	The consonants are: 's' (frequency 4), 'c' (frequency 2). The maximum frequency is 4.
	The output is 2 + 4 = 6.

Example 2:

**Input:** s = "aeiaeia"

**Output:** 3

**Explanation:**

	The vowels are: 'a' (frequency 3), 'e' ( frequency 2), 'i' (frequency 2). The maximum frequency is 3.
	There are no consonants in s. Hence, maximum consonant frequency = 0.
	The output is 3 + 0 = 3.

 

**Constraints:**

	1 <= s.length <= 100
	s consists of lowercase English letters only.

{% raw %}


```rust


use std::collections::HashMap;
use std::cmp::max;
impl Solution {
    pub fn max_freq_sum(s: String) -> i32 {
        
        let mut vowel = HashMap::new();
        let mut consonant = HashMap::new();

        for  k in s.chars() {
            if k == 'a' || k == 'e' || k == 'i' || k == 'o' || k == 'u' {
                match vowel.get(&k) {
                    Some(count) => vowel.insert((k.clone()), count + 1),
                    None => vowel.insert((k.clone()), 1)
                };
            } else {
                match consonant.get(&k) {
                    Some(count) => consonant.insert(k.clone(), count + 1),
                    None => consonant.insert(k.clone(), 1)
                };
            }
        }
        let mut a = 0;
        let mut b = 0;
        for (k, v) in vowel {
            a = max(v, a);
        }

        for (k, v) in consonant {
            b = max(v, b);
        }

        return a + b
    }
}


{% endraw %}
```
