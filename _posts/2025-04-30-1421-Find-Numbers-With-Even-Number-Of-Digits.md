---
title: "1421 Find Numbers With Even Number Of Digits"
date: "2025-04-30T10:56:35+02:00"
categories: ["leetcode"]
tags: [rust]
layout: post
---


                            ## [Find Numbers with Even Number of Digits](https://leetcode.com/problems/find-numbers-with-even-number-of-digits) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array nums of integers, return how many of them contain an **even number** of digits.

 

Example 1:

```

**Input:** nums = [12,345,2,6,7896]
**Output:** 2
Explanation: 
12 contains 2 digits (even number of digits). 
345 contains 3 digits (odd number of digits). 
2 contains 1 digit (odd number of digits). 
6 contains 1 digit (odd number of digits). 
7896 contains 4 digits (even number of digits). 
Therefore only 12 and 7896 contain an even number of digits.

```

Example 2:

```

**Input:** nums = [555,901,482,1771]
**Output:** 1 
**Explanation: **
Only 1771 contains an even number of digits.

```

 

**Constraints:**

	1 <= nums.length <= 500
	1 <= nums[i] <= 105

                            {% raw %}
                            ```rust
                            impl Solution {
    pub fn find_numbers(nums: Vec<i32>) -> i32 {
        let mut res = 0;
        for num in nums {
            let num_as_string = num.to_string();
            if num_as_string.len() % 2 == 0 {
                res += 1
            }

        }
        return res

    }
}
                            {% endraw %}
                            