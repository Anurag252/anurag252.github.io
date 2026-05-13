---
            title: "1793 Minimum Moves To Make Array Complementary"
            date: "2026-05-13T23:38:52+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Moves to Make Array Complementary](https://leetcode.com/problems/minimum-moves-to-make-array-complementary) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums of **even** length n and an integer limit. In one move, you can replace any integer from nums with another integer between 1 and limit, inclusive.

The array nums is **complementary** if for all indices i (**0-indexed**), nums[i] + nums[n - 1 - i] equals the same number. For example, the array [1,2,3,4] is complementary because for all indices i, nums[i] + nums[n - 1 - i] = 5.

Return the ***minimum** number of moves required to make *nums* **complementary***.

 

Example 1:

```

**Input:** nums = [1,2,4,3], limit = 4
**Output:** 1
**Explanation:** In 1 move, you can change nums to [1,2,2,3] (underlined elements are changed).
nums[0] + nums[3] = 1 + 3 = 4.
nums[1] + nums[2] = 2 + 2 = 4.
nums[2] + nums[1] = 2 + 2 = 4.
nums[3] + nums[0] = 3 + 1 = 4.
Therefore, nums[i] + nums[n-1-i] = 4 for every i, so nums is complementary.

```

Example 2:

```

**Input:** nums = [1,2,2,1], limit = 2
**Output:** 2
**Explanation:** In 2 moves, you can change nums to [2,2,2,2]. You cannot change any number to 3 since 3 > limit.

```

Example 3:

```

**Input:** nums = [1,2,1,2], limit = 2
**Output:** 0
**Explanation:** nums is already complementary.

```

 

**Constraints:**

	n == nums.length
	2 <= n <= 105
	1 <= nums[i] <= limit <= 105
	n is even.

{% raw %}


```rust


impl Solution {
    pub fn min_moves(nums: Vec<i32>, limit: i32) -> i32 {
        let n = nums.len();
        let mut diff = vec![0; (2 * limit + 2) as usize];

        for i in 0..n / 2 {
            let a = nums[i].min(nums[n - 1 - i]);
            let b = nums[i].max(nums[n - 1 - i]);

            diff[2] += 2;
            diff[(a + 1) as usize] -= 1;
            diff[(a + b) as usize] -= 1;
            diff[(a + b + 1) as usize] += 1;
            diff[(b + limit + 1) as usize] += 1;
        }

        let mut min_ops = n as i32;
        let mut current_ops = 0;

        for c in 2..=(2 * limit) as usize {
            current_ops += diff[c];
            min_ops = min_ops.min(current_ops);
        }

        min_ops
    }
}


{% endraw %}
```
