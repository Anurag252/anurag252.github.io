---
            title: "1388 Greatest Sum Divisible By Three"
            date: "2025-11-23T12:31:45+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Greatest Sum Divisible by Three](https://leetcode.com/problems/greatest-sum-divisible-by-three) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer array nums, return *the **maximum possible sum **of elements of the array such that it is divisible by three*.

 

Example 1:

```

**Input:** nums = [3,6,5,1,8]
**Output:** 18
**Explanation:** Pick numbers 3, 6, 1 and 8 their sum is 18 (maximum sum divisible by 3).
```

Example 2:

```

**Input:** nums = [4]
**Output:** 0
**Explanation:** Since 4 is not divisible by 3, do not pick any number.

```

Example 3:

```

**Input:** nums = [1,2,3,4,4]
**Output:** 12
**Explanation:** Pick numbers 1, 3, 4 and 4 their sum is 12 (maximum sum divisible by 3).

```

 

**Constraints:**

	1 <= nums.length <= 4 * 104
	1 <= nums[i] <= 104

{% raw %}


```rust


use std::cmp::max;

impl Solution {
    pub fn max_sum_div_three(mut nums: Vec<i32>) -> i32 {
        // add all
        // remove the 2 1s
        // remove 1 2s
        // remove 1s
        let mut s = 0;
        let mut one : Vec<i32> = Vec::new();
        let mut two : Vec<i32> = Vec::new();
        nums.sort();
        for k in nums {
            s += k;
            if k % 3 == 1 {
                one.push(k)
            }


            if k % 3 == 2 {
                two.push(k)
            }
        }
        //print!("{} {} {}", one1, two1, two2);
        if s % 3 == 0 {
            return s;
        }
        //print!("{} {} {}", one1, two1, two2);
        if s % 3 == 1 {

            if one.len() > 0 && two.len() > 1 {
                return max(s - one[0] , s - two[0] - two[1]);
            } else if one.len() > 0 {
                return s - one[0];
            } else if two.len() > 1 {
                return s - two[0] - two[1]
            } else {
                return 0;
            }
           
        }

        //print!("{} {} {} {}", one1, two1, two2, s);
        if s % 3 == 2 {

            if two.len() > 0 && one.len() > 1 {
                return max(s - two[0] , s - one[0] - one[1]);
            } else if two.len() > 0 {
                return s - two[0];
            } else if one.len() > 1 {
                return s - one[0] - one[1]
            } else {
                return 0;
            }
        }

        return 0;
    }
}


{% endraw %}
```
