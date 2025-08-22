---
title: "3396 Valid Word"
date: "2025-07-15T06:01:02+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
problem_statement: |
  ## [Valid Word](https://leetcode.com/problems/valid-word) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  A word is considered **valid** if:
  
  	It contains a **minimum** of 3 characters.
  	It contains only digits (0-9), and English letters (uppercase and lowercase).
  	It includes **at least** one **vowel**.
  	It includes **at least** one **consonant**.
  
  You are given a string word.
  
  Return true if word is valid, otherwise, return false.
  
  **Notes:**
  
  	&#39;a&#39;, &#39;e&#39;, &#39;i&#39;, &#39;o&#39;, &#39;u&#39;, and their uppercases are **vowels**.
  	A **consonant** is an English letter that is not a vowel.
  
  &nbsp;
  
  Example 1:
  
  **Input:** word = &quot;234Adas&quot;
  
  **Output:** true
  
  **Explanation:**
  
  This word satisfies the conditions.
  
  Example 2:
  
  **Input:** word = &quot;b3&quot;
  
  **Output:** false
  
  **Explanation:**
  
  The length of this word is fewer than 3, and does not have a vowel.
  
  Example 3:
  
  **Input:** word = &quot;a3$e&quot;
  
  **Output:** false
  
  **Explanation:**
  
  This word contains a &#39;$&#39; character and does not have a consonant.
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= word.length &lt;= 20
  	word consists of English uppercase and lowercase letters, digits, &#39;@&#39;, &#39;#&#39;, and &#39;$&#39;.
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