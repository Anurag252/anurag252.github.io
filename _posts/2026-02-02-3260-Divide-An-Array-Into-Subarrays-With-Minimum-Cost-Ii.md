---
            title: "3260 Divide An Array Into Subarrays With Minimum Cost Ii"
            date: "2026-02-02T21:11:49+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Divide an Array Into Subarrays With Minimum Cost II](https://leetcode.com/problems/divide-an-array-into-subarrays-with-minimum-cost-ii) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given a **0-indexed** array of integers nums of length n, and two **positive** integers k and dist.

The **cost** of an array is the value of its **first** element. For example, the cost of [1,2,3] is 1 while the cost of [3,4,1] is 3.

You need to divide nums into k **disjoint contiguous **subarrays, such that the difference between the starting index of the **second** subarray and the starting index of the kth subarray should be **less than or equal to** dist. In other words, if you divide nums into the subarrays nums[0..(i1 - 1)], nums[i1..(i2 - 1)], ..., nums[ik-1..(n - 1)], then ik-1 - i1 <= dist.

Return *the **minimum** possible sum of the cost of these* *subarrays*.

 

Example 1:

```

**Input:** nums = [1,3,2,6,4,2], k = 3, dist = 3
**Output:** 5
**Explanation:** The best possible way to divide nums into 3 subarrays is: [1,3], [2,6,4], and [2]. This choice is valid because ik-1 - i1 is 5 - 2 = 3 which is equal to dist. The total cost is nums[0] + nums[2] + nums[5] which is 1 + 2 + 2 = 5.
It can be shown that there is no possible way to divide nums into 3 subarrays at a cost lower than 5.

```

Example 2:

```

**Input:** nums = [10,1,2,2,2,1], k = 4, dist = 3
**Output:** 15
**Explanation:** The best possible way to divide nums into 4 subarrays is: [10], [1], [2], and [2,2,1]. This choice is valid because ik-1 - i1 is 3 - 1 = 2 which is less than dist. The total cost is nums[0] + nums[1] + nums[2] + nums[3] which is 10 + 1 + 2 + 2 = 15.
The division [10], [1], [2,2,2], and [1] is not valid, because the difference between ik-1 and i1 is 5 - 1 = 4, which is greater than dist.
It can be shown that there is no possible way to divide nums into 4 subarrays at a cost lower than 15.

```

Example 3:

```

**Input:** nums = [10,8,18,9], k = 3, dist = 1
**Output:** 36
**Explanation:** The best possible way to divide nums into 4 subarrays is: [10], [8], and [18,9]. This choice is valid because ik-1 - i1 is 2 - 1 = 1 which is equal to dist.The total cost is nums[0] + nums[1] + nums[2] which is 10 + 8 + 18 = 36.
The division [10], [8,18], and [9] is not valid, because the difference between ik-1 and i1 is 3 - 1 = 2, which is greater than dist.
It can be shown that there is no possible way to divide nums into 3 subarrays at a cost lower than 36.

```

 

**Constraints:**

	3 <= n <= 105
	1 <= nums[i] <= 109
	3 <= k <= n
	k - 2 <= dist <= n - 2

{% raw %}


```rust


use std::collections::BTreeMap;

struct Container {
    k: usize,
    st1: BTreeMap<i32, i32>,
    st2: BTreeMap<i32, i32>,
    sm: i64,
    st1_size: usize,
    st2_size: usize,
}

impl Container {
    fn new(k: usize) -> Self {
        Self {
            k,
            st1: BTreeMap::new(),
            st2: BTreeMap::new(),
            sm: 0,
            st1_size: 0,
            st2_size: 0,
        }
    }
    
    fn remove_one(map: &mut BTreeMap<i32, i32>, key: i32) -> bool {
        if let Some(count) = map.get_mut(&key) {
            *count -= 1;
            if *count == 0 {
                map.remove(&key);
            }
            true
        } else {
            false
        }
    }
    
    fn add_one(map: &mut BTreeMap<i32, i32>, key: i32) {
        *map.entry(key).or_insert(0) += 1;
    }
    
    fn first_key(map: &BTreeMap<i32, i32>) -> Option<i32> {
        map.keys().next().copied()
    }
    
    fn last_key(map: &BTreeMap<i32, i32>) -> Option<i32> {
        map.keys().next_back().copied()
    }
    
    fn adjust(&mut self) {
        while self.st1_size < self.k && !self.st2.is_empty() {
            if let Some(x) = Self::first_key(&self.st2) {
                Self::add_one(&mut self.st1, x);
                Self::remove_one(&mut self.st2, x);
                self.sm += x as i64;
                self.st1_size += 1;
                self.st2_size -= 1;
            }
        }
        
        while self.st1_size > self.k {
            if let Some(x) = Self::last_key(&self.st1) {
                Self::add_one(&mut self.st2, x);
                Self::remove_one(&mut self.st1, x);
                self.sm -= x as i64;
                self.st1_size -= 1;
                self.st2_size += 1;
            }
        }
    }
    
    // insert element x
    fn add(&mut self, x: i32) {
        if !self.st2.is_empty() && x >= *self.st2.keys().next().unwrap() {
            Self::add_one(&mut self.st2, x);
            self.st2_size += 1;
        } else {
            Self::add_one(&mut self.st1, x);
            self.sm += x as i64;
            self.st1_size += 1;
        }
        self.adjust();
    }
    
    // delete element x
    fn erase(&mut self, x: i32) {
        if Self::remove_one(&mut self.st1, x) {
            self.sm -= x as i64;
            self.st1_size -= 1;
        } else if Self::remove_one(&mut self.st2, x) {
            self.st2_size -= 1;
        }
        self.adjust();
    }
    
    // sum of the first k smallest elements
    fn sum(&self) -> i64 {
        self.sm
    }
}

impl Solution {
    pub fn minimum_cost(nums: Vec<i32>, k: i32, dist: i32) -> i64 {
        let n = nums.len();
        let k = k as usize;
        let dist = dist as usize;
        
        let mut cnt = Container::new(k - 2);
        for i in 1..k - 1 {
            cnt.add(nums[i]);
        }
        
        let mut ans = cnt.sum() + nums[k - 1] as i64;
        for i in k..n {
            let j = i as i32 - dist as i32 - 1;
            if j > 0 {
                cnt.erase(nums[j as usize]);
            }
            cnt.add(nums[i - 1]);
            ans = ans.min(cnt.sum() + nums[i] as i64);
        }
        
        ans + nums[0] as i64
    }
}


{% endraw %}
```
