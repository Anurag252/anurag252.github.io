---
            title: "2503 Longest Subarray With Maximum Bitwise And"
            date: "2025-07-30T12:19:09+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Longest Subarray With Maximum Bitwise AND](https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums of size n.

Consider a **non-empty** subarray from nums that has the **maximum** possible **bitwise AND**.

	In other words, let k be the maximum value of the bitwise AND of **any** subarray of nums. Then, only subarrays with a bitwise AND equal to k should be considered.

Return *the length of the **longest** such subarray*.

The bitwise AND of an array is the bitwise AND of all the numbers in it.

A **subarray** is a contiguous sequence of elements within an array.

 

Example 1:

```

**Input:** nums = [1,2,3,3,2,2]
**Output:** 2
**Explanation:**
The maximum possible bitwise AND of a subarray is 3.
The longest subarray with that value is [3,3], so we return 2.

```

Example 2:

```

**Input:** nums = [1,2,3,4]
**Output:** 1
**Explanation:**
The maximum possible bitwise AND of a subarray is 4.
The longest subarray with that value is [4], so we return 1.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 106

{% raw %}
```rust

 use std::cmp::max;
 impl Solution {
    pub fn longest_subarray(nums: Vec<i32>) -> i32 {
        /*
            maximum bitwise AND would be just one number 
            or a group of number that are same
            is it largest number ??
            I guess so 
        */
        let mut result = 0;
        let mut temp = 1;
        let mut mx = nums.iter().max();
        match mx {
            Some(min) => {
                for (i, k) in nums.iter().enumerate() {
            if k == min {
                if (i > 0 && nums[i-1] == *k) {
                    temp += 1;
                }
            } else {
                temp = 1;
            }

            result = max(result, temp);
        }
        result
            },
            None      => return 0,
        }
        

    }
}
{% endraw %}
