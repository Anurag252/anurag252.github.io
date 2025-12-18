---
            title: "3980 Best Time To Buy And Sell Stock Using Strategy"
            date: "2025-12-18T22:29:06+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Best Time to Buy and Sell Stock using Strategy](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-using-strategy) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two integer arrays prices and strategy, where:

	prices[i] is the price of a given stock on the ith day.
	strategy[i] represents a trading action on the ith day, where:

		-1 indicates buying one unit of the stock.
		0 indicates holding the stock.
		1 indicates selling one unit of the stock.

You are also given an **even** integer k, and may perform **at most one** modification to strategy. A modification consists of:

	Selecting exactly k **consecutive** elements in strategy.
	Set the **first** k / 2 elements to 0 (hold).
	Set the **last** k / 2 elements to 1 (sell).

The **profit** is defined as the **sum** of strategy[i] * prices[i] across all days.

Return the **maximum** possible profit you can achieve.

**Note:** There are no constraints on budget or stock ownership, so all buy and sell operations are feasible regardless of past actions.

 

Example 1:

**Input:** prices = [4,2,8], strategy = [-1,0,1], k = 2

**Output:** 10

**Explanation:**

			Modification
			Strategy
			Profit Calculation
			Profit

			Original
			[-1, 0, 1]
			(-1 × 4) + (0 × 2) + (1 × 8) = -4 + 0 + 8
			4

			Modify [0, 1]
			[0, 1, 1]
			(0 × 4) + (1 × 2) + (1 × 8) = 0 + 2 + 8
			10

			Modify [1, 2]
			[-1, 0, 1]
			(-1 × 4) + (0 × 2) + (1 × 8) = -4 + 0 + 8
			4

Thus, the maximum possible profit is 10, which is achieved by modifying the subarray [0, 1]​​​​​​​.

Example 2:

**Input:** prices = [5,4,3], strategy = [1,1,0], k = 2

**Output:** 9

**Explanation:**

			Modification
			Strategy
			Profit Calculation
			Profit

			Original
			[1, 1, 0]
			(1 × 5) + (1 × 4) + (0 × 3) = 5 + 4 + 0
			9

			Modify [0, 1]
			[0, 1, 0]
			(0 × 5) + (1 × 4) + (0 × 3) = 0 + 4 + 0
			4

			Modify [1, 2]
			[1, 0, 1]
			(1 × 5) + (0 × 4) + (1 × 3) = 5 + 0 + 3
			8

Thus, the maximum possible profit is 9, which is achieved without any modification.

 

**Constraints:**

	2 <= prices.length == strategy.length <= 105
	1 <= prices[i] <= 105
	-1 <= strategy[i] <= 1
	2 <= k <= prices.length
	k is even

{% raw %}


```rust


impl Solution {
    pub fn max_profit(prices: Vec<i32>, strategy: Vec<i32>, k: i32) -> i64 {
        // maintain two arrs, prefix and suffix on original prices
        // and prefix and suff on strategy * prices
        // slide window of k , between i and j indexes
        // deduct strategy * prices sum from total  between i and j 
        // add prices (consider 1 as strategy) from i + k/2 to j and find new  total
        // find max of thiese 
        let n = prices.len();
        let mut profit_sum = vec![0i64; n + 1];
        let mut price_sum = vec![0i64; n + 1];
        for i in 0..n {
            profit_sum[i + 1] = profit_sum[i] + prices[i] as i64 * strategy[i] as i64;
            price_sum[i + 1] = price_sum[i] + prices[i] as i64;
        }
        let mut res = profit_sum[n];
        for i in (k - 1) as usize..n {
            let left_profit = profit_sum[i - (k as usize) + 1];
            let right_profit = profit_sum[n] - profit_sum[i + 1];
            let change_profit = price_sum[i + 1] - price_sum[i - (k as usize) / 2 + 1];
            res = res.max(left_profit + change_profit + right_profit);
        }
        res
    }
}


{% endraw %}
```
