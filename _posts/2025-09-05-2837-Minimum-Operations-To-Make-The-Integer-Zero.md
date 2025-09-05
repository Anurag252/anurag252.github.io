---
            title: "2837 Minimum Operations To Make The Integer Zero"
            date: "2025-09-05T09:00:51+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Operations to Make the Integer Zero](https://leetcode.com/problems/minimum-operations-to-make-the-integer-zero) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two integers num1 and num2.

In one operation, you can choose integer i in the range [0, 60] and subtract 2i + num2 from num1.

Return *the integer denoting the **minimum** number of operations needed to make* num1 *equal to* 0.

If it is impossible to make num1 equal to 0, return -1.

 

Example 1:

```

**Input:** num1 = 3, num2 = -2
**Output:** 3
**Explanation:** We can make 3 equal to 0 with the following operations:
- We choose i = 2 and subtract 22 + (-2) from 3, 3 - (4 + (-2)) = 1.
- We choose i = 2 and subtract 22 + (-2) from 1, 1 - (4 + (-2)) = -1.
- We choose i = 0 and subtract 20 + (-2) from -1, (-1) - (1 + (-2)) = 0.
It can be proven, that 3 is the minimum number of operations that we need to perform.

```

Example 2:

```

**Input:** num1 = 5, num2 = 7
**Output:** -1
**Explanation:** It can be proven, that it is impossible to make 5 equal to 0 with the given operation.

```

 

**Constraints:**

	1 <= num1 <= 109
	-109 <= num2 <= 109

{% raw %}


```rust


use std::cmp;
use std::collections::HashMap;

impl Solution {
    pub fn make_the_integer_zero(num1: i32, num2: i32) -> i32 {
        // at every step we have 61 options 
        // we have overlapping subproblems and can cache
        // T[num1] = min(T[num1 - 2i - num2]) for every i in 0 to 60
        // T[0] = 1
        // if num1 < num2 -> prune, find once n then anything > n prune
        // is it greedy 
        // bottom up is larger than top down or DFS 
        // if num1 = 2i + 2j + 2k + num2*l // 
        // so the diff is 2i + 2j + 2k + num2(l-1) -> a multiple of num2 and a binary number
        // so the answer can always be reached , for minimum steps
        // find how many 1s are there in remaining and is it equal to l-1
        // use 2^0 + 2^2 + 2^7 -> 7 bits
        // num2(l-1) l-1 values
        // if we say these are not minimum,
        // have a feeling but no proof that this must always be converging
        // 
        let mut k  = 1;
        while true {
            let diff: i64 = num1 as i64 - num2 as i64 * k as i64;


            if diff < k {
                return -1;
            }
            let mut a :i64 = diff;
            let mut count = 0;
            while(a > 0) {
                if a & 1 == 1 {
                    count += 1;
                }
                a = a >> 1;
                
            }

            if count <= k {
                return k as i32;
            }
            k += 1;



        }

        return -1
        
    }
}


{% endraw %}
```
