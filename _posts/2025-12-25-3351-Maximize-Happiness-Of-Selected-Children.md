---
            title: "3351 Maximize Happiness Of Selected Children"
            date: "2025-12-25T22:07:53+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximize Happiness of Selected Children](https://leetcode.com/problems/maximize-happiness-of-selected-children) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array happiness of length n, and a **positive** integer k.

There are n children standing in a queue, where the ith child has **happiness value** happiness[i]. You want to select k children from these n children in k turns.

In each turn, when you select a child, the **happiness value** of all the children that have **not** been selected till now decreases by 1. Note that the happiness value **cannot** become negative and gets decremented **only** if it is positive.

Return *the **maximum** sum of the happiness values of the selected children you can achieve by selecting *k *children*.

 

Example 1:

```

**Input:** happiness = [1,2,3], k = 2
**Output:** 4
**Explanation:** We can pick 2 children in the following way:
- Pick the child with the happiness value == 3. The happiness value of the remaining children becomes [0,1].
- Pick the child with the happiness value == 1. The happiness value of the remaining child becomes [0]. Note that the happiness value cannot become less than 0.
The sum of the happiness values of the selected children is 3 + 1 = 4.

```

Example 2:

```

**Input:** happiness = [1,1,1,1], k = 2
**Output:** 1
**Explanation:** We can pick 2 children in the following way:
- Pick any child with the happiness value == 1. The happiness value of the remaining children becomes [0,0,0].
- Pick the child with the happiness value == 0. The happiness value of the remaining child becomes [0,0].
The sum of the happiness values of the selected children is 1 + 0 = 1.

```

Example 3:

```

**Input:** happiness = [2,3,4,5], k = 1
**Output:** 5
**Explanation:** We can pick 1 child in the following way:
- Pick the child with the happiness value == 5. The happiness value of the remaining children becomes [1,2,3].
The sum of the happiness values of the selected children is 5.

```

 

**Constraints:**

	1 <= n == happiness.length <= 2 * 105
	1 <= happiness[i] <= 108
	1 <= k <= n

{% raw %}


```rust


impl Solution {
    pub fn maximum_happiness_sum(mut happiness: Vec<i32>, mut k: i32) -> i64 {
        // if i just sort the arr
        // just keep picking the largest and reduce temp
        // k times 
        happiness.sort_by(|a,b| b.cmp(a));
        let mut temp  = 0;
        let mut res : i64 = 0;
        for m in happiness {
            
            if m - temp <= 0 || k == 0 {
                //print!("{} {} ab", res, temp);
                return res;
            }
            res += (m - temp) as i64;
            temp += 1;
            k -= 1;
            //print!("{} {}", res, temp);
        }
        //print!("{} {} cd", res, temp);
        return res;
    }
}


{% endraw %}
```
