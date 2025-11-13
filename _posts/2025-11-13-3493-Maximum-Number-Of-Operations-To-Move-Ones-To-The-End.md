---
            title: "3493 Maximum Number Of Operations To Move Ones To The End"
            date: "2025-11-13T07:31:59+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximum Number of Operations to Move Ones to the End](https://leetcode.com/problems/maximum-number-of-operations-to-move-ones-to-the-end) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a binary string s.

You can perform the following operation on the string **any** number of times:

	Choose **any** index i from the string where i + 1 < s.length such that s[i] == '1' and s[i + 1] == '0'.
	Move the character s[i] to the **right** until it reaches the end of the string or another '1'. For example, for s = "010010", if we choose i = 1, the resulting string will be s = "0**001**10".

Return the **maximum** number of operations that you can perform.

 

Example 1:

**Input:** s = "1001101"

**Output:** 4

**Explanation:**

We can perform the following operations:

	Choose index i = 0. The resulting string is s = "**001**1101".
	Choose index i = 4. The resulting string is s = "0011**01**1".
	Choose index i = 3. The resulting string is s = "001**01**11".
	Choose index i = 2. The resulting string is s = "00**01**111".

Example 2:

**Input:** s = "00111"

**Output:** 0

 

**Constraints:**

	1 <= s.length <= 105
	s[i] is either '0' or '1'.

{% raw %}


```rust


use itertools::enumerate;
impl Solution {
    pub fn max_operations(s: String) -> i32 {
        // max operations would mean that 
        // move the 1s from the left first 
        // maybe count the 1s separated by 0 ?
        // 1100011100010110100
        // 2,3,1,2,1
        // here result would be 2 + (2 + 3) + (2 + 3+ 1) ...
        // k * (len - i)
        let mut arr = Vec::new();
        let mut temp :i32 = 0;
        for k in s.chars() {
            if k == '1' {
                temp += 1;
            } else {
                if temp > 0 {
                    arr.push(temp);
                    temp = 0;
                }
                
            }
            
        }

        //print!("{:?}", arr);
        let mut res = 0;
        for (i,k) in enumerate(arr.clone()) {
            res += (k * (arr.len() - i) as i32);
        }
        res
    }
}


{% endraw %}
```
