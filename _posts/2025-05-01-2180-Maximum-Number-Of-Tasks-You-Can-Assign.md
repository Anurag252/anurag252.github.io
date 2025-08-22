---
            title: "2180 Maximum Number Of Tasks You Can Assign"
            date: "2025-05-01T11:09:38+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximum Number of Tasks You Can Assign](https://leetcode.com/problems/maximum-number-of-tasks-you-can-assign) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You have n tasks and m workers. Each task has a strength requirement stored in a **0-indexed** integer array tasks, with the ith task requiring tasks[i] strength to complete. The strength of each worker is stored in a **0-indexed** integer array workers, with the jth worker having workers[j] strength. Each worker can only be assigned to a **single** task and must have a strength **greater than or equal** to the task's strength requirement (i.e., workers[j] >= tasks[i]).

Additionally, you have pills magical pills that will **increase a worker's strength** by strength. You can decide which workers receive the magical pills, however, you may only give each worker **at most one** magical pill.

Given the **0-indexed **integer arrays tasks and workers and the integers pills and strength, return *the **maximum** number of tasks that can be completed.*

 

Example 1:

```

**Input:** tasks = [**3**,**2**,**1**], workers = [**0**,**3**,**3**], pills = 1, strength = 1
**Output:** 3
**Explanation:**
We can assign the magical pill and tasks as follows:
- Give the magical pill to worker 0.
- Assign worker 0 to task 2 (0 + 1 >= 1)
- Assign worker 1 to task 1 (3 >= 2)
- Assign worker 2 to task 0 (3 >= 3)

```

Example 2:

```

**Input:** tasks = [**5**,4], workers = [**0**,0,0], pills = 1, strength = 5
**Output:** 1
**Explanation:**
We can assign the magical pill and tasks as follows:
- Give the magical pill to worker 0.
- Assign worker 0 to task 0 (0 + 5 >= 5)

```

Example 3:

```

**Input:** tasks = [**10**,**15**,30], workers = [**0**,**10**,10,10,10], pills = 3, strength = 10
**Output:** 2
**Explanation:**
We can assign the magical pills and tasks as follows:
- Give the magical pill to worker 0 and worker 1.
- Assign worker 0 to task 0 (0 + 10 >= 10)
- Assign worker 1 to task 1 (10 + 10 >= 15)
The last pill is not given because it will not make any worker strong enough for the last task.

```

 

**Constraints:**

	n == tasks.length
	m == workers.length
	1 <= n, m <= 5 * 104
	0 <= pills <= m
	0 <= tasks[i], workers[j], strength <= 109

{% raw %}


```rust


use std::collections::BTreeMap;

impl Solution {
    pub fn max_task_assign(tasks: Vec<i32>, workers: Vec<i32>, pills: i32, strength: i32) -> i32 {
        let mut tasks = tasks;
        let mut workers = workers;
        tasks.sort();
        workers.sort();
        let n = tasks.len();
        let m = workers.len();
        let (mut left, mut right, mut ans) = (1, m.min(n), 0);

        while left <= right {
            let mid = (left + right) / 2;
            if Self::check(&tasks, &workers, pills, strength, mid) {
                ans = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        ans as i32
    }

    fn check(tasks: &[i32], workers: &[i32], pills: i32, strength: i32, mid: usize) -> bool {
        let mut p = pills;
        let mut ws = BTreeMap::new();
        for &w in workers.iter().skip(workers.len() - mid) {
            *ws.entry(w).or_insert(0) += 1;
        }
        for &t in tasks.iter().take(mid).rev() {
            if let Some((&max_key, _)) = ws.iter().next_back() {
                if max_key >= t {
                    *ws.get_mut(&max_key).unwrap() -= 1;
                    if ws[&max_key] == 0 {
                        ws.remove(&max_key);
                    }
                } else {
                    if p == 0 {
                        return false;
                    }
                    if let Some((&key, _)) = ws.range(t - strength..).next() {
                        *ws.get_mut(&key).unwrap() -= 1;
                        if ws[&key] == 0 {
                            ws.remove(&key);
                        }
                        p -= 1;
                    } else {
                        return false;
                    }
                }
            }
        }
        true
    }
}


{% endraw %}
