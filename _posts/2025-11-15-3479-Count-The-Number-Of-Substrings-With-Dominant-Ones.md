---
            title: "3479 Count The Number Of Substrings With Dominant Ones"
            date: "2025-11-15T21:33:54+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count the Number of Substrings With Dominant Ones](https://leetcode.com/problems/count-the-number-of-substrings-with-dominant-ones) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a binary string s.

Return the number of substrings with **dominant** ones.

A string has **dominant** ones if the number of ones in the string is **greater than or equal to** the **square** of the number of zeros in the string.

 

Example 1:

**Input:** s = "00011"

**Output:** 5

**Explanation:**

The substrings with dominant ones are shown in the table below.

			i
			j
			s[i..j]
			Number of Zeros
			Number of Ones

			3
			3
			1
			0
			1

			4
			4
			1
			0
			1

			2
			3
			01
			1
			1

			3
			4
			11
			0
			2

			2
			4
			011
			1
			2

Example 2:

**Input:** s = "101101"

**Output:** 16

**Explanation:**

The substrings with **non-dominant** ones are shown in the table below.

Since there are 21 substrings total and 5 of them have non-dominant ones, it follows that there are 16 substrings with dominant ones.

			i
			j
			s[i..j]
			Number of Zeros
			Number of Ones

			1
			1
			0
			1
			0

			4
			4
			0
			1
			0

			1
			4
			0110
			2
			2

			0
			4
			10110
			2
			3

			1
			5
			01101
			2
			3

 

**Constraints:**

	1 <= s.length <= 4 * 104
	s consists only of characters '0' and '1'.

{% raw %}


```rust


impl Solution {
    pub fn number_of_substrings(s: String) -> i32 {
        // some kind of sliding window
        // when you find 1, then count all 1s
        // all 1s (with 0 0s) + (all 1s starting from first 1 with 0 0s - 1)+ 
        //all 1s starting from first 1 with 0 0s, with 1 0s, 

        //101101
        //10,11,21,31,32,42 -> 
        //
        //4 + 1 + 
        // no this does not work
        // n2 is easy
        // for sliding windw we need to find when should we keep inc
        // its not possible right ? 
        // maybe try to find the non-dominant
        // if you see a 0 then 
        // maybe prefix sum works
        // 101101
        // 10,11,21,31,32,42 -> 1 and 0s
        // let's analyze first what would it take to count equal numbers of 1s and 0s
        // we add 1 for each 1 and reduce 1 for each 1
        // then two indexes having same number have equale number of 1s and 0s
        // GAVE UP
        let chars: Vec<char> = s.chars().collect();
        let n = chars.len();
        let mut pre = vec![-1; n + 1];
        for i in 0..n {
            if i == 0 || chars[i - 1] == '0' {
                pre[i + 1] = i as i32;
            } else {
                pre[i + 1] = pre[i];
            }
        }

        let mut res = 0i32;
        for i in 1..=n {
            let mut cnt0 = if chars[i - 1] == '0' { 1 } else { 0 };
            let mut j = i as i32;
            while j > 0 && (cnt0 * cnt0) as usize <= n {
                let cnt1 = (i as i32 - pre[j as usize]) - cnt0;
                if cnt0 * cnt0 <= cnt1 {
                    res += std::cmp::min(j - pre[j as usize], cnt1 - cnt0 * cnt0 + 1);
                }
                j = pre[j as usize];
                cnt0 += 1;
            }
        }
        res
    }
}



{% endraw %}
```
