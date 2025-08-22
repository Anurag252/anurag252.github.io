---
            title: "2170 Count Number Of Maximum Bitwise Or Subsets"
            date: "2025-07-28T16:21:41+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count Number of Maximum Bitwise-OR Subsets](https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer array nums, find the **maximum** possible **bitwise OR** of a subset of nums and return *the **number of different non-empty subsets** with the maximum bitwise OR*.

An array a is a **subset** of an array b if a can be obtained from b by deleting some (possibly zero) elements of b. Two subsets are considered **different** if the indices of the elements chosen are different.

The bitwise OR of an array a is equal to a[0] **OR** a[1] **OR** ... **OR** a[a.length - 1] (**0-indexed**).

 

Example 1:

```

**Input:** nums = [3,1]
**Output:** 2
**Explanation:** The maximum possible bitwise OR of a subset is 3. There are 2 subsets with a bitwise OR of 3:
- [3]
- [3,1]

```

Example 2:

```

**Input:** nums = [2,2,2]
**Output:** 7
**Explanation:** All non-empty subsets of [2,2,2] have a bitwise OR of 2. There are 23 - 1 = 7 total subsets.

```

Example 3:

```

**Input:** nums = [3,2,1,5]
**Output:** 6
**Explanation:** The maximum possible bitwise OR of a subset is 7. There are 6 subsets with a bitwise OR of 7:
- [3,5]
- [3,1,5]
- [3,2,5]
- [3,2,1,5]
- [2,5]
- [2,1,5]
```

 

**Constraints:**

	1 <= nums.length <= 16
	1 <= nums[i] <= 105

{% raw %}


````rust


impl Solution {
    pub fn count_max_or_subsets(nums: Vec<i32>) -> i32 {
        // bitwise or is max if done for all elements ?
        //length is 16 
        // so there can be 2^16 subsets , which is quite lrge 
        // but maybe still under pow(10,5) ? IDK 
        // idea is if there is a 1 at a ceratin place 
        // we could exclude the other 1 from other integeres
        // say we have an array of 16
        // we could all 1s at each place,
        // indexes with just 1 1s are mandatory
        // rest are optional
        // final answer would be (optional + 1)*(mandatory count)

        // 010 101

        let mut final_result = 0;
        let mut result = 0;
        for k in &nums {
            final_result |= k;
        }
        println!("{}", final_result);

        fn subset( arr : &Vec<i32>, total : i32, final_result : i32, mut result : &mut i32, index : i32) {
            //println!("{} {} {} {}", total, final_result, result, index);
            if total == final_result && index == arr.len() as i32  {
                *result = *result + 1;
            }
            if index >= arr.len() as i32 {
                return 
            }
            subset(arr, total | arr[index as usize] , final_result, result, index + 1 );
            subset(arr, total , final_result, result, index + 1 );
            

        }
        subset(&nums, 0, final_result, &mut result, 0);
        return result;
    }
}


{% endraw %}
