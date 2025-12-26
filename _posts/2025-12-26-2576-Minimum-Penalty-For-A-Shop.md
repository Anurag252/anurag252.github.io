---
            title: "2576 Minimum Penalty For A Shop"
            date: "2025-12-26T22:03:43+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Penalty for a Shop](https://leetcode.com/problems/minimum-penalty-for-a-shop) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given the customer visit log of a shop represented by a **0-indexed** string customers consisting only of characters 'N' and 'Y':

	if the ith character is 'Y', it means that customers come at the ith hour
	whereas 'N' indicates that no customers come at the ith hour.

If the shop closes at the jth hour (0 <= j <= n), the **penalty** is calculated as follows:

	For every hour when the shop is open and no customers come, the penalty increases by 1.
	For every hour when the shop is closed and customers come, the penalty increases by 1.

Return* the **earliest** hour at which the shop must be closed to incur a **minimum** penalty.*

**Note** that if a shop closes at the jth hour, it means the shop is closed at the hour j.

 

Example 1:

```

**Input:** customers = "YYNY"
**Output:** 2
**Explanation:** 
- Closing the shop at the 0th hour incurs in 1+1+0+1 = 3 penalty.
- Closing the shop at the 1st hour incurs in 0+1+0+1 = 2 penalty.
- Closing the shop at the 2nd hour incurs in 0+0+0+1 = 1 penalty.
- Closing the shop at the 3rd hour incurs in 0+0+1+1 = 2 penalty.
- Closing the shop at the 4th hour incurs in 0+0+1+0 = 1 penalty.
Closing the shop at 2nd or 4th hour gives a minimum penalty. Since 2 is earlier, the optimal closing time is 2.

```

Example 2:

```

**Input:** customers = "NNNNN"
**Output:** 0
**Explanation:** It is best to close the shop at the 0th hour as no customers arrive.
```

Example 3:

```

**Input:** customers = "YYYY"
**Output:** 4
**Explanation:** It is best to close the shop at the 4th hour as customers arrive at each hour.

```

 

**Constraints:**

	1 <= customers.length <= 105
	customers consists only of characters 'Y' and 'N'.

{% raw %}


```rust


use std::iter::zip;
use itertools::enumerate;

impl Solution {
    pub fn best_closing_time(customers: String) -> i32 {
        let n = customers.len();
        let chars: Vec<char> = customers.chars().collect();

        // N[i] = number of 'N' before i
        let mut N = vec![0; n + 1];
        for i in 0..n {
            N[i + 1] = N[i] + if chars[i] == 'N' { 1 } else { 0 };
        }

        // Y[i] = number of 'Y' after i
        let mut Y = vec![0; n + 1];
        for i in (0..n).rev() {
            Y[i] = Y[i + 1] + if chars[i] == 'Y' { 1 } else { 0 };
        }

        let mut res = i32::MAX;
        let mut ans = 0;

        for (i, (y, n_)) in enumerate(zip(Y.iter(), N.iter())) {
            let penalty = y + n_;
            if penalty < res {
                res = penalty;
                ans = i;
            }
        }

        ans as i32
    }
}



{% endraw %}
```
