---
            title: "1001 N Repeated Element In Size 2N Array"
            date: "2026-01-02T22:32:15+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [N-Repeated Element in Size 2N Array](https://leetcode.com/problems/n-repeated-element-in-size-2n-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an integer array nums with the following properties:

	nums.length == 2 * n.
	nums contains n + 1 **unique** elements.
	Exactly one element of nums is repeated n times.

Return *the element that is repeated *n* times*.

 

Example 1:

```
**Input:** nums = [1,2,3,3]
**Output:** 3

```

Example 2:

```
**Input:** nums = [2,1,2,5,3,2]
**Output:** 2

```

Example 3:

```
**Input:** nums = [5,1,5,2,5,3,5,4]
**Output:** 5

```

 

**Constraints:**

	2 <= n <= 5000
	nums.length == 2 * n
	0 <= nums[i] <= 104
	nums contains n + 1 **unique** elements and one of them is repeated exactly n times.

{% raw %}


```rust


impl Solution {
    pub fn repeated_n_times(nums: Vec<i32>) -> i32 {
        // 2n elements , but n + 1 unique elements
        // one element occurs half the time
        // majority voting algo
        // if the elements occurs half the time 
        // then only in one condition two elements will not occur togather
        // a x a y z a
        // in rest all cases we can find two consecutive elements
        // if we do not find consecutive element then first or last element must be an ans
        // so loop again
        let mut prev = -1;
        for k in nums.clone() {
            if prev == k {
                return k;
            } else {
                prev = k;
            }
        }

        let mut first = nums[0];
        let mut res = 0;
        for k in nums.clone() {
            if first == k {
                res += 1;
            }
        }

        if res > 1 {
            return first;
        }


        let mut last = nums[nums.len() - 1];
        let mut res = 0;
        for k in nums.clone() {
            if last == k {
                res += 1;
            }
        }

        if res > 1 {
            return last;
        }
        last
    }
}


{% endraw %}
```
