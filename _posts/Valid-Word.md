---
title: "Valid Word"
date: "2025-07-15T06:01:02+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 2.1 MB (42.86%) - LeetSync"
---

```rust
impl Solution {
    pub fn is_valid(word: String) -> bool {
        if word.len() < 3 {
            return false;
        }
        let mut vowel = false;
        let mut consonant = false;
        for mut k in word.chars(){
            let m = k.to_ascii_lowercase() as u8;
            if !((m >= 48 && m <= 57 ) || (m >= 97 && m <= 122) ){
                return false;
            } 
            
            if k.to_ascii_lowercase() == 'a' || k.to_ascii_lowercase() == 'e' || k.to_ascii_lowercase() == 'i' || k.to_ascii_lowercase() == 'o' || k.to_ascii_lowercase() == 'u' {
                vowel = true;
            }else {
                if (m >= 97 && m <= 122) {
                    consonant = true;
                }
                
            }
        }
        return vowel && consonant;
    }
}
```