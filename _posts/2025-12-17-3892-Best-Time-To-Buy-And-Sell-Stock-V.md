---
            title: "3892 Best Time To Buy And Sell Stock V"
            date: "2025-12-17T22:10:42+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Best Time to Buy and Sell Stock V](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-v) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array prices where prices[i] is the price of a stock in dollars on the ith day, and an integer k.

You are allowed to make at most k transactions, where each transaction can be either of the following:

**Normal transaction**: Buy on day i, then sell on a later day j where i < j. You profit prices[j] - prices[i].

**Short selling transaction**: Sell on day i, then buy back on a later day j where i < j. You profit prices[i] - prices[j].

**Note** that you must complete each transaction before starting another. Additionally, you can't buy or sell on the same day you are selling or buying back as part of a previous transaction.

Return the **maximum** total profit you can earn by making **at most** k transactions.

 

Example 1:

**Input:** prices = [1,7,9,8,2], k = 2

**Output:** 14

**Explanation:**

We can make $14 of profit through 2 transactions:

	A normal transaction: buy the stock on day 0 for $1 then sell it on day 2 for $9.
	A short selling transaction: sell the stock on day 3 for $8 then buy back on day 4 for $2.

Example 2:

**Input:** prices = [12,16,19,19,8,1,19,13,9], k = 3

**Output:** 36

**Explanation:**

We can make $36 of profit through 3 transactions:

	A normal transaction: buy the stock on day 0 for $12 then sell it on day 2 for $19.
	A short selling transaction: sell the stock on day 3 for $19 then buy back on day 4 for $8.
	A normal transaction: buy the stock on day 5 for $1 then sell it on day 6 for $19.

 

**Constraints:**

	2 <= prices.length <= 103
	1 <= prices[i] <= 109
	1 <= k <= prices.length / 2

{% raw %}


```rust


impl Solution {
    pub fn maximum_profit(prices: Vec<i32>, k: i32) -> i64 {
        // we basically want to buy at i and sell at j 
        // so that i < j , so find a peak and then find smallest number before that
        // can be make more money by doing this multiple times of just at one 
        // peak => we make more money by doing this every time
        // so find all the peaks and then find the number just after the peak before it ,
        // say buy and sell or sell and buy
        // so most likely a dp
        // T[0,n,k] = max(T[i,n,k-1] + put(0,i) or short(0,i))
        // where put(0,i) mean we buy at 0 and sell at i
        // where short(0,i) mean we sell at 0 and buy at i
        // this runs n2 times 
        let n = prices.len();
        let k = k as usize;
        let mut memo = vec![vec![vec![-1; 3]; k + 1]; n];
        
        fn dfs(i: i32, j: i32, state: i32, prices: &Vec<i32>, memo: &mut Vec<Vec<Vec<i64>>>) -> i64 {
            let i_usize = i as usize;
            let j_usize = j as usize;
            let state_usize = state as usize;
            
            if j_usize == 0 {
                return 0;
            }
            if i_usize == 0 {
                return if state_usize == 0 { 0 } else if state_usize == 1 { -prices[0] as i64 } else { prices[0] as i64 };
            }
            if memo[i_usize][j_usize][state_usize] != -1 {
                return memo[i_usize][j_usize][state_usize];
            }
            
            let p = prices[i_usize] as i64;
            let res = match state {
                0 => {
                    let a = dfs(i - 1, j, 0, prices, memo);
                    let b = dfs(i - 1, j, 1, prices, memo) + p;
                    let c = dfs(i - 1, j, 2, prices, memo) - p;
                    a.max(b).max(c)
                }
                1 => {
                    let a = dfs(i - 1, j, 1, prices, memo);
                    let b = dfs(i - 1, j - 1, 0, prices, memo) - p;
                    a.max(b)
                }
                _ => {
                    let a = dfs(i - 1, j, 2, prices, memo);
                    let b = dfs(i - 1, j - 1, 0, prices, memo) + p;
                    a.max(b)
                }
            };
            memo[i_usize][j_usize][state_usize] = res;
            res
        }
        
        dfs(n as i32 - 1, k as i32, 0, &prices, &mut memo)
    }
    }



{% endraw %}
```
