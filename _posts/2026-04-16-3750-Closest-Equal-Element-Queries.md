---
            title: "3750 Closest Equal Element Queries"
            date: "2026-04-16T22:46:02+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Closest Equal Element Queries](https://leetcode.com/problems/closest-equal-element-queries) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **circular** array nums and an array queries.

For each query i, you have to find the following:

	The **minimum** distance between the element at index queries[i] and **any** other index j in the **circular** array, where nums[j] == nums[queries[i]]. If no such index exists, the answer for that query should be -1.

Return an array answer of the **same** size as queries, where answer[i] represents the result for query i.

 

Example 1:

**Input:** nums = [1,3,1,4,1,3,2], queries = [0,3,5]

**Output:** [2,-1,3]

**Explanation:**

	Query 0: The element at queries[0] = 0 is nums[0] = 1. The nearest index with the same value is 2, and the distance between them is 2.
	Query 1: The element at queries[1] = 3 is nums[3] = 4. No other index contains 4, so the result is -1.
	Query 2: The element at queries[2] = 5 is nums[5] = 3. The nearest index with the same value is 1, and the distance between them is 3 (following the circular path: 5 -> 6 -> 0 -> 1).

Example 2:

**Input:** nums = [1,2,3,4], queries = [0,1,2,3]

**Output:** [-1,-1,-1,-1]

**Explanation:**

Each value in nums is unique, so no index shares the same value as the queried element. This results in -1 for all queries.

 

**Constraints:**

	1 <= queries.length <= nums.length <= 105
	1 <= nums[i] <= 106
	0 <= queries[i] < nums.length

{% raw %}


```rust


use std::collections::HashMap;

impl Solution {
    pub fn solve_queries(nums: Vec<i32>, queries: Vec<i32>) -> Vec<i32> {
        let n = nums.len() as i32;

        let mut nums_pos: HashMap<i32, Vec<i32>> = HashMap::new();
        for i in 0..n {
            nums_pos.entry(nums[i as usize]).or_insert(Vec::new()).push(i);
        }
        
        for (_, pos) in nums_pos.iter_mut() {
            let x = pos[0];
            let last = *pos.last().unwrap();
            pos.insert(0, last - n);
            pos.push(x + n);
        }
        
        queries
            .iter()
            .map(|&q| {
                let x = nums[q as usize];
                let pos_list = nums_pos.get(&x).unwrap();
                
                if pos_list.len() == 3 {
                    return -1;
                }
                let idx = pos_list.partition_point(|&v| v < q);
                (pos_list[idx + 1] - pos_list[idx]).min(pos_list[idx] - pos_list[idx - 1])
            })
            .collect()
    }
}


{% endraw %}
```
