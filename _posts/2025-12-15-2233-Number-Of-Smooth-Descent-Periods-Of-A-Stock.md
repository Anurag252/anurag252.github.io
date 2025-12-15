---
            title: "2233 Number Of Smooth Descent Periods Of A Stock"
            date: "2025-12-15T15:04:28+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Number of Smooth Descent Periods of a Stock](https://leetcode.com/problems/number-of-smooth-descent-periods-of-a-stock) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array prices representing the daily price history of a stock, where prices[i] is the stock price on the ith day.

A **smooth descent period** of a stock consists of **one or more contiguous** days such that the price on each day is **lower** than the price on the **preceding day** by **exactly** 1. The first day of the period is exempted from this rule.

Return *the number of **smooth descent periods***.

 

Example 1:

```

**Input:** prices = [3,2,1,4]
**Output:** 7
**Explanation:** There are 7 smooth descent periods:
[3], [2], [1], [4], [3,2], [2,1], and [3,2,1]
Note that a period with one day is a smooth descent period by the definition.

```

Example 2:

```

**Input:** prices = [8,6,7,7]
**Output:** 4
**Explanation:** There are 4 smooth descent periods: [8], [6], [7], and [7]
Note that [8,6] is not a smooth descent period as 8 - 6 ≠ 1.

```

Example 3:

```

**Input:** prices = [1]
**Output:** 1
**Explanation:** There is 1 smooth descent period: [1]

```

 

**Constraints:**

	1 <= prices.length <= 105
	1 <= prices[i] <= 105

{% raw %}


```rust


use itertools::enumerate;
impl Solution {
    pub fn get_descent_periods(prices: Vec<i32>) -> i64 {
        // we probably need continuos sequences wh9ch decreases
        // then if size is n  do 1 + 2 + .. (n-1)
        // also add all single ones
        let mut temp = 1;
        let mut res = Vec::new();
        let mut l = prices.len();
        for (i, k) in enumerate(prices.clone()) {
            if i == 0 {
                res.push(temp);
                temp = 1;
                continue;
            }
            if k + 1 == prices[i-1] {
                temp += 1;
            } else {
                res.push(temp);
                temp = 1;
            }
        }

        res.push(temp);
        let mut ans = 0;

        for k in res {
            ans += (k * (k-1)) / 2
        }
        ans + l as i64


    }
}


{% endraw %}
```
