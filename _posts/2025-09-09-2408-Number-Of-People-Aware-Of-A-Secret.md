---
            title: "2408 Number Of People Aware Of A Secret"
            date: "2025-09-09T08:51:34+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Number of People Aware of a Secret](https://leetcode.com/problems/number-of-people-aware-of-a-secret) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

On day 1, one person discovers a secret.

You are given an integer delay, which means that each person will **share** the secret with a new person **every day**, starting from delay days after discovering the secret. You are also given an integer forget, which means that each person will **forget** the secret forget days after discovering it. A person **cannot** share the secret on the same day they forgot it, or on any day afterwards.

Given an integer n, return* the number of people who know the secret at the end of day *n. Since the answer may be very large, return it **modulo** 109 + 7.

 

Example 1:

```

**Input:** n = 6, delay = 2, forget = 4
**Output:** 5
**Explanation:**
Day 1: Suppose the first person is named A. (1 person)
Day 2: A is the only person who knows the secret. (1 person)
Day 3: A shares the secret with a new person, B. (2 people)
Day 4: A shares the secret with a new person, C. (3 people)
Day 5: A forgets the secret, and B shares the secret with a new person, D. (3 people)
Day 6: B shares the secret with E, and C shares the secret with F. (5 people)

```

Example 2:

```

**Input:** n = 4, delay = 1, forget = 3
**Output:** 6
**Explanation:**
Day 1: The first person is named A. (1 person)
Day 2: A shares the secret with B. (2 people)
Day 3: A and B share the secret with 2 new people, C and D. (4 people)
Day 4: A forgets the secret. B, C, and D share the secret with 3 new people. (6 people)

```

 

**Constraints:**

	2 <= n <= 1000
	1 <= delay < forget <= n

{% raw %}


```rust


impl Solution {
    pub fn people_aware_of_secret(n: i32, delay: i32, forget: i32) -> i32 {
        const MOD: usize = 1_000_000_007;

        let n = n as usize;
        let delay = delay as usize;
        let forget = forget as usize;

        // Edge: if delay >= forget, no one ever shares
        if delay >= forget {
            // Everyone forgets before they can share
            // Only original person might remain if n < forget
            return if n < forget { 1 } else { 0 } as i32;
        }

        // d[i] = number of people who are on their i-th day of delay (0-indexed)
        let mut d = vec![0usize; delay];
        // f[i] = number of people who are on their i-th day of "active sharing" (after delay, before forget)
        let mut f = vec![0usize; forget - delay];

        // Day 1
        d[0] = 1;

        for day in 2..=n {
            // 1. People finishing delay today: they are at the last slot of d
            let mut finished_delay = 0;
            if delay > 0 {
                finished_delay = d[delay - 1];
            }

            // 2. Shift delay queue LEFT
            if delay > 0 {
                for i in (1..delay).rev() {
                    d[i] = d[i - 1];
                }
                d[0] = 0; // will be filled with new people
            }

            // 3. Shift forget queue LEFT
            let mut finished_forget = 0;
            if !f.is_empty() {
                finished_forget = f[f.len() - 1];
                for i in (1..f.len()).rev() {
                    f[i] = f[i - 1];
                }
                f[0] = 0;
            }

            // 4. People who finished delay today now enter sharing phase
            if !f.is_empty() {
                f[0] = finished_delay;
            } else {
                // if forget - delay == 0, then they forget immediately after delay — so don't add
            }

            // 5. Current active sharers = sum of f
            let sharing_count = f.iter().sum::<usize>() % MOD;

            // 6. New people generated today start delay — go into d[0]
            if delay > 0 {
                d[0] = sharing_count;
            } else {
                // if delay == 0, they start sharing immediately → should go into f[0]
                // But if delay == 0 and forget > 0, then f exists
                if !f.is_empty() {
                    f[0] = (f[0] + sharing_count) % MOD;
                }
            }
        }

        // Answer = everyone still in d or f
        let mut total = d.iter().sum::<usize>() + f.iter().sum::<usize>();
        total %= MOD;
        total as i32
    }
}


{% endraw %}
```
