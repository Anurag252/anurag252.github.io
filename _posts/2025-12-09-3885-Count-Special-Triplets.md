---
            title: "3885 Count Special Triplets"
            date: "2025-12-09T22:22:51+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count Special Triplets](https://leetcode.com/problems/count-special-triplets) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums.

A **special triplet** is defined as a triplet of indices (i, j, k) such that:

	0 <= i < j < k < n, where n = nums.length
	nums[i] == nums[j] * 2
	nums[k] == nums[j] * 2

Return the total number of **special triplets** in the array.

Since the answer may be large, return it **modulo** 109 + 7.

 

Example 1:

**Input:** nums = [6,3,6]

**Output:** 1

**Explanation:**

The only special triplet is (i, j, k) = (0, 1, 2), where:

	nums[0] = 6, nums[1] = 3, nums[2] = 6
	nums[0] = nums[1] * 2 = 3 * 2 = 6
	nums[2] = nums[1] * 2 = 3 * 2 = 6

Example 2:

**Input:** nums = [0,1,0,0]

**Output:** 1

**Explanation:**

The only special triplet is (i, j, k) = (0, 2, 3), where:

	nums[0] = 0, nums[2] = 0, nums[3] = 0
	nums[0] = nums[2] * 2 = 0 * 2 = 0
	nums[3] = nums[2] * 2 = 0 * 2 = 0

Example 3:

**Input:** nums = [8,4,2,8,4]

**Output:** 2

**Explanation:**

There are exactly two special triplets:

	(i, j, k) = (0, 1, 3)

		nums[0] = 8, nums[1] = 4, nums[3] = 8
		nums[0] = nums[1] * 2 = 4 * 2 = 8
		nums[3] = nums[1] * 2 = 4 * 2 = 8

	(i, j, k) = (1, 2, 4)

		nums[1] = 4, nums[2] = 2, nums[4] = 4
		nums[1] = nums[2] * 2 = 2 * 2 = 4
		nums[4] = nums[2] * 2 = 2 * 2 = 4

 

**Constraints:**

	3 <= n == nums.length <= 105
	0 <= nums[i] <= 105

{% raw %}


```rust


use std::collections::HashMap;

impl Solution {
    pub fn special_triplets(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        let mut pos: HashMap<i32, Vec<usize>> = HashMap::new();
        
        for (i, &v) in nums.iter().enumerate() {
            pos.entry(v).or_insert_with(Vec::new).push(i);
        }
        
        let upper_bound = |arr: &[usize], i: usize| -> (usize, usize) {
            let (mut l, mut r) = (0, arr.len() - 1);
            while l < r {
                let mid = l + ((r - l + 1) >> 1);
                if i >= arr[mid] {
                    l = mid;
                } else {
                    r = mid - 1;
                }
            }
            (l + 1, arr.len() - 1 - l)
        };
        
        let mut ans: i64 = 0;
        for i in 1..nums.len() - 1 {
            let target = nums[i] * 2;
            if let Some(target_pos) = pos.get(&target) {
                if target_pos.len() > 1 && target_pos[0] < i {
                    let (mut l, r) = upper_bound(target_pos, i);
                    if nums[i] == 0 {
                        l -= 1;
                    }
                    ans = (ans + l as i64 * r as i64) % MOD;
                }
            }
        }
        
        ans as i32
    }
}


{% endraw %}
```
