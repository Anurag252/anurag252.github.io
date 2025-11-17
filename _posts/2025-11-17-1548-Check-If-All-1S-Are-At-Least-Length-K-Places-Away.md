---
            title: "1548 Check If All 1S Are At Least Length K Places Away"
            date: "2025-11-17T17:38:58+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Check If All 1's Are at Least Length K Places Away](https://leetcode.com/problems/check-if-all-1s-are-at-least-length-k-places-away) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an binary array nums and an integer k, return true* if all *1*'s are at least *k* places away from each other, otherwise return *false.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/04/15/sample_1_1791.png)
```

**Input:** nums = [1,0,0,0,1,0,0,1], k = 2
**Output:** true
**Explanation:** Each of the 1s are at least 2 places away from each other.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2020/04/15/sample_2_1791.png)
```

**Input:** nums = [1,0,0,1,0,1], k = 2
**Output:** false
**Explanation:** The second 1 and third 1 are only one apart from each other.

```

 

**Constraints:**

	1 <= nums.length <= 105
	0 <= k <= nums.length
	nums[i] is 0 or 1

{% raw %}


```rust


impl Solution {
    pub fn k_length_apart(nums: Vec<i32>, k: i32) -> bool {
        let mut diff = -1;

        for m in nums {
            if diff == -1 && m == 0 {
                continue;
            }

            if diff == -1 && m == 1 {
                diff = 0;
                continue;
            }

            if m == 0 {
                
                diff += 1;
            } else {
                if diff < k {
                    
                    return false;
                } else {
                    diff = 0;
                }
            }
        }
        return true;
    }
}


{% endraw %}
```
