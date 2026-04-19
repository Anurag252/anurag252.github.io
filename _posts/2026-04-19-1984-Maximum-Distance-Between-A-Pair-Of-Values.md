---
            title: "1984 Maximum Distance Between A Pair Of Values"
            date: "2026-04-19T22:38:45+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Maximum Distance Between a Pair of Values](https://leetcode.com/problems/maximum-distance-between-a-pair-of-values) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two **non-increasing 0-indexed **integer arrays nums1​​​​​​ and nums2​​​​​​.

A pair of indices (i, j), where 0 <= i < nums1.length and 0 <= j < nums2.length, is **valid** if both i <= j and nums1[i] <= nums2[j]. The **distance** of the pair is j - i​​​​.

Return *the **maximum distance** of any **valid** pair *(i, j)*. If there are no valid pairs, return *0.

An array arr is **non-increasing** if arr[i-1] >= arr[i] for every 1 <= i < arr.length.

 

Example 1:

```

**Input:** nums1 = [55,30,5,4,2], nums2 = [100,20,10,10,5]
**Output:** 2
**Explanation:** The valid pairs are (0,0), (2,2), (2,3), (2,4), (3,3), (3,4), and (4,4).
The maximum distance is 2 with pair (2,4).

```

Example 2:

```

**Input:** nums1 = [2,2,2], nums2 = [10,10,1]
**Output:** 1
**Explanation:** The valid pairs are (0,0), (0,1), and (1,1).
The maximum distance is 1 with pair (0,1).

```

Example 3:

```

**Input:** nums1 = [30,29,19,5], nums2 = [25,25,25,25,25]
**Output:** 2
**Explanation:** The valid pairs are (2,2), (2,3), (2,4), (3,3), and (3,4).
The maximum distance is 2 with pair (2,4).

```

 

**Constraints:**

	1 <= nums1.length, nums2.length <= 105
	1 <= nums1[i], nums2[j] <= 105
	Both nums1 and nums2 are **non-increasing**.

{% raw %}


```rust


use std::cmp::max;
impl Solution {
    pub fn max_distance(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        let mut left = 0;
        let mut right = 0;
        let mut found = false;
        let mut res = 0;

        while(left < nums1.len() && right < nums2.len() ) {
            if found {
                if nums1[left] <= nums2[right] {
                    res = max(res, right - left);
                    right += 1;
                } else {
                    found = false;
                    
                    print!("{} {}\n", right, left);
                    left += 1
                }
            } else {
                if nums1[left] <= nums2[right] {
                    res = max(res, right - left);
                    right += 1;
                    found = true;
                    continue;
                } else {
                    left += 1;
                    right += 1;
                }
            }
            
           
        }

        

        //res = max(res, right - left - 1 ); // in one case -2
        print!("{} {}\n", right, left);
        res as i32
        
    }
}


{% endraw %}
```
