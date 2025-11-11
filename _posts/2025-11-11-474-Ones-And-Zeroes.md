---
            title: "474 Ones And Zeroes"
            date: "2025-11-11T08:39:30+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Ones and Zeroes](https://leetcode.com/problems/ones-and-zeroes) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array of binary strings strs and two integers m and n.

Return *the size of the largest subset of strs such that there are **at most** *m* *0*'s and *n* *1*'s in the subset*.

A set x is a **subset** of a set y if all elements of x are also elements of y.

 

Example 1:

```

**Input:** strs = ["10","0001","111001","1","0"], m = 5, n = 3
**Output:** 4
**Explanation:** The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
{"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.

```

Example 2:

```

**Input:** strs = ["10","0","1"], m = 1, n = 1
**Output:** 2
**Explanation:** The largest subset is {"0", "1"}, so the answer is 2.

```

 

**Constraints:**

	1 <= strs.length <= 600
	1 <= strs[i].length <= 100
	strs[i] consists only of digits '0' and '1'.
	1 <= m, n <= 100

{% raw %}


```rust


use std::cmp::max;
use std::collections::HashMap;

impl Solution {
    pub fn find_max_form(strs: Vec<String>, m: i32, n: i32) -> i32 {
        // loop and count
        // ambiguos problem 
        // so we need to find subset that is global
        // larger subset would mean smaller strings
        // sort by size and take the strs
        // as there are two constraints
        // it may not be simple to just pick one of two
        // pick one and recurse for rest or do not pick one and recurse
        fn recurse(strs : &Vec<String>, i : i32, m : i32, n :i32, memo: &mut HashMap<(i32, i32, i32), i32>) -> i32 {
            if i == strs.len() as i32 {
                return 0; // after last elem return 0
            }
            if m < 0 || n < 0 {
                return -1000; // leads to smaller set 
            }
            if memo.contains_key(&(i,m,n)) {
                return memo[&(i,m,n)];
            }
            let mut zeros = 0;
            let mut ones = 0;
            for c in strs[i as usize].chars() {
                if c == '1' {
                    ones += 1;
                } else {
                    zeros += 1;
                }
            }
            if m - zeros < 0 || n - ones < 0 {
                return recurse(strs, i + 1, m , n, memo);
            }
            let mut a = 1 + recurse(strs, i + 1, m - zeros, n - ones, memo );
            let mut b = recurse(strs, i + 1, m , n, memo);
            memo.insert((i,m,n), max(a,b));
            return max(a,b);

        }
        let mut memo : HashMap<(i32, i32, i32), i32> = HashMap::new();
        recurse(&strs, 0, m, n, &mut memo)
    }
}


{% endraw %}
```
