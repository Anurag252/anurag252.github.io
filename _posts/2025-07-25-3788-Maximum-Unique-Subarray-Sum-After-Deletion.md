---
            title: "3788 Maximum Unique Subarray Sum After Deletion"
            date: "2025-07-25T20:03:40+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximum Unique Subarray Sum After Deletion](https://leetcode.com/problems/maximum-unique-subarray-sum-after-deletion) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an integer array nums.

You are allowed to delete any number of elements from nums without making it **empty**. After performing the deletions, select a subarray of nums such that:

	All elements in the subarray are **unique**.
	The sum of the elements in the subarray is **maximized**.

Return the **maximum sum** of such a subarray.

 

Example 1:

**Input:** nums = [1,2,3,4,5]

**Output:** 15

**Explanation:**

Select the entire array without deleting any element to obtain the maximum sum.

Example 2:

**Input:** nums = [1,1,0,1,1]

**Output:** 1

**Explanation:**

Delete the element nums[0] == 1, nums[1] == 1, nums[2] == 0, and nums[3] == 1. Select the entire array [1] to obtain the maximum sum.

Example 3:

**Input:** nums = [1,2,-1,-2,1,0,-1]

**Output:** 3

**Explanation:**

Delete the elements nums[2] == -1 and nums[3] == -2, and select the subarray [2, 1] from [1, 2, 1, 0, -1] to obtain the maximum sum.

 

**Constraints:**

	1 <= nums.length <= 100
	-100 <= nums[i] <= 100

{% raw %}
```rust
use std::collections::HashSet;
use libc::abs;

impl Solution {
    pub fn max_sum(nums: Vec<i32>) -> i32 {
       // it appears to be maximum subsequence of 
       // given array with unique numbers and max sum
       // idea is take all largest unique +ve numbers 
       // order does not matter
        let mut nums_hash = HashSet::new();
       let mut res = 0;
       let mut has_positive = false;
       let mut vec_cloned : Vec<i32> = nums.clone();
       vec_cloned.sort_by(|a, b| b.cmp(a));
       for k in vec_cloned {
        if nums_hash.contains(&k) {
            continue;
        }
        nums_hash.insert(k);
        if k > 0 {
            res += k;
            has_positive = true
        } else {
            if (! has_positive) {
                return k;
            }

        }
        
       }
       res
    }
}
{% endraw %}
