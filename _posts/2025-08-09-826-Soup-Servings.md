---
            title: "826 Soup Servings"
            date: "2025-08-09T06:24:23+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Soup Servings](https://leetcode.com/problems/soup-servings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You have two soups, **A** and **B**, each starting with n mL. On every turn, one of the following four serving operations is chosen *at random*, each with probability 0.25 **independent** of all previous turns:

	pour 100 mL from type A and 0 mL from type B
	pour 75 mL from type A and 25 mL from type B
	pour 50 mL from type A and 50 mL from type B
	pour 25 mL from type A and 75 mL from type B

**Note:**

	There is no operation that pours 0 mL from A and 100 mL from B.
	The amounts from A and B are poured *simultaneously* during the turn.
	If an operation asks you to pour **more than** you have left of a soup, pour all that remains of that soup.

The process stops immediately after any turn in which *one of the soups* is used up.

Return the probability that A is used up *before* B, plus half the probability that both soups are used up in the** same turn**. Answers within 10-5 of the actual answer will be accepted.

 

Example 1:

```

**Input:** n = 50
**Output:** 0.62500
**Explanation:** 
If we perform either of the first two serving operations, soup A will become empty first.
If we perform the third operation, A and B will become empty at the same time.
If we perform the fourth operation, B will become empty first.
So the total probability of A becoming empty first plus half the probability that A and B become empty at the same time, is 0.25 * (1 + 1 + 0.5 + 0) = 0.625.

```

Example 2:

```

**Input:** n = 100
**Output:** 0.71875
**Explanation:** 
If we perform the first serving operation, soup A will become empty first.
If we perform the second serving operations, A will become empty on performing operation [1, 2, 3], and both A and B become empty on performing operation 4.
If we perform the third operation, A will become empty on performing operation [1, 2], and both A and B become empty on performing operation 3.
If we perform the fourth operation, A will become empty on performing operation 1, and both A and B become empty on performing operation 2.
So the total probability of A becoming empty first plus half the probability that A and B become empty at the same time, is 0.71875.

```

 

**Constraints:**

	0 <= n <= 109

{% raw %}


```rust


impl Solution {
    pub fn soup_servings(n: i32) -> f64 {
        if n > 4800 {
            return 1.0;
        }
        use std::collections::HashMap;

        let mut memo: HashMap<(i32, i32), (f64, f64, f64)> = HashMap::new();

        pub fn recurse(
            a: i32,
            b: i32,
            k: f64,
            memo: &mut HashMap<(i32, i32), (f64, f64, f64)>
        ) -> (f64, f64, f64) {
            let p = f64::powf(0.25, k);

            // Return weighted result if in memo
            if let Some(&(ua, ub, uc)) = memo.get(&(a, b)) {
                return (ua * p, ub * p, uc * p);
            }

            if a <= 0 {
                if b <= 0 {
                    return (p * 0.0, p * 1.0, p * 1.0);
                } else {
                    return (p * 1.0, p * 0.0, p * 1.0);
                }
            }

            if b <= 0 {
                return (p * 0.0, p * 0.0, p * 1.0);
            }

            // Compute unweighted
            let a1 = recurse(a - 100, b, k + 1.0, memo);
            let a2 = recurse(a - 75, b - 25, k + 1.0, memo);
            let a3 = recurse(a - 50, b - 50, k + 1.0, memo);
            let a4 = recurse(a - 25, b - 75, k + 1.0, memo);

            let unweighted = (
                (a1.0 + a2.0 + a3.0 + a4.0) / p,
                (a1.1 + a2.1 + a3.1 + a4.1) / p,
                (a1.2 + a2.2 + a3.2 + a4.2) / p,
            );

            memo.insert((a, b), unweighted);
            (unweighted.0 * p, unweighted.1 * p, unweighted.2 * p)
        }

        let (a, b, c) = recurse(n, n, 0.0, &mut memo);
        a / c + 0.5 * (b / c)
    }
}



{% endraw %}
