---
            title: "3773 Minimum Pair Removal To Sort Array I"
            date: "2026-01-22T21:09:43+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Pair Removal to Sort Array I](https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array nums, you can perform the following operation any number of times:

	Select the **adjacent** pair with the **minimum** sum in nums. If multiple such pairs exist, choose the leftmost one.
	Replace the pair with their sum.

Return the **minimum number of operations** needed to make the array **non-decreasing**.

An array is said to be **non-decreasing** if each element is greater than or equal to its previous element (if it exists).

 

Example 1:

**Input:** nums = [5,2,3,1]

**Output:** 2

**Explanation:**

	The pair (3,1) has the minimum sum of 4. After replacement, nums = [5,2,4].
	The pair (2,4) has the minimum sum of 6. After replacement, nums = [5,6].

The array nums became non-decreasing in two operations.

Example 2:

**Input:** nums = [1,2,2]

**Output:** 0

**Explanation:**

The array nums is already sorted.

 

**Constraints:**

	1 <= nums.length <= 50
	-1000 <= nums[i] <= 1000

{% raw %}


```rust


impl Solution {
    pub fn minimum_pair_removal(nums: Vec<i32>) -> i32 {
        let mut temp = nums.clone();
        let mut res = 0;

        fn is_not_non_decreasing(t: &[i32]) -> bool {
            for i in 1..t.len() {
                if t[i - 1] > t[i] {
                    return true;
                }
            }
            false
        }

        while is_not_non_decreasing(&temp) {
            let mut best_sum = i32::MAX;
            let mut indx = 0;

            for i in 0..temp.len() - 1 {
                let s = temp[i] + temp[i + 1];
                if s < best_sum {
                    best_sum = s;
                    indx = i;
                }
            }

            temp.splice(indx..=indx + 1, [best_sum]);
            res += 1;
        }

        res
    }
}



{% endraw %}
```
