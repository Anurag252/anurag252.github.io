---
            title: "3933 Minimum Jumps To Reach End Via Prime Teleportation"
            date: "2026-05-08T21:27:23+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Jumps to Reach End via Prime Teleportation](https://leetcode.com/problems/minimum-jumps-to-reach-end-via-prime-teleportation) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array nums of length n.

You start at index 0, and your goal is to reach index n - 1.

From any index i, you may perform one of the following operations:

	**Adjacent Step**: Jump to index i + 1 or i - 1, if the index is within bounds.
	**Prime Teleportation**: If nums[i] is a prime number p, you may instantly jump to any index j != i such that nums[j] % p == 0.

Return the **minimum** number of jumps required to reach index n - 1.

 

Example 1:

**Input:** nums = [1,2,4,6]

**Output:** 2

**Explanation:**

One optimal sequence of jumps is:

	Start at index i = 0. Take an adjacent step to index 1.
	At index i = 1, nums[1] = 2 is a prime number. Therefore, we teleport to index i = 3 as nums[3] = 6 is divisible by 2.

Thus, the answer is 2.

Example 2:

**Input:** nums = [2,3,4,7,9]

**Output:** 2

**Explanation:**

One optimal sequence of jumps is:

	Start at index i = 0. Take an adjacent step to index i = 1.
	At index i = 1, nums[1] = 3 is a prime number. Therefore, we teleport to index i = 4 since nums[4] = 9 is divisible by 3.

Thus, the answer is 2.

Example 3:

**Input:** nums = [4,6,5,8]

**Output:** 3

**Explanation:**

	Since no teleportation is possible, we move through 0 → 1 → 2 → 3. Thus, the answer is 3.

 

**Constraints:**

	1 <= n == nums.length <= 105
	1 <= nums[i] <= 106

{% raw %}


```rust


       // 10 pow 6 numbers
        // can find co-primes in linear time ?
        // its not needed
        // simply sort and bin search for numbers 
        // bin search not possible 
        // nums[j] = nums[i] * k where nums[i] is prime
        // we somehow need prime list 
        // say we pre-populate - say fixed number of these
        //  then once we find a prime , we mark it 
        // then for every non prime number we 
        // try all marked prime
        // and create an adj matrix ? 
        // not needed, just arr to farthest ?
        // greedily jumping farthest works ?
        // no it does not work
        // we need recurrence relation
        // T[j] = T[i] + 1 in case of multiple
        // T[j] = max (T[j-1] + 1 , T[i] + 1 , T[j+1] + 1)
        // so first find all primes from internet say x of these
        // then create a create an adj matrix of all possible jumps - O(n * x)
        // then solve recurrecen relation O(n)
        // why is this medium 
    
use std::collections::HashMap;

const MX: usize = 1_000_001;

lazy_static::lazy_static! {
    static ref FACTORS: Vec<Vec<i32>> = {
        let mut f = vec![vec![]; MX];
        for i in 2..MX {
            if f[i].is_empty() {
                for j in (i..MX).step_by(i) {
                    f[j].push(i as i32);
                }
            }
        }
        f
    };
}

impl Solution {
    pub fn min_jumps(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut edges: HashMap<i32, Vec<usize>> = HashMap::new();
        for (i, &a) in nums.iter().enumerate() {
            if FACTORS[a as usize].len() == 1 {
                edges.entry(a).or_default().push(i);
            }
        }
        let mut res = 0;
        let mut seen = vec![false; n];
        seen[n - 1] = true;
        let mut q = vec![n - 1];
        loop {
            let mut q2 = vec![];
            for &i in &q {
                if i == 0 { return res; }
                if i > 0 && !seen[i - 1] {
                    seen[i - 1] = true;
                    q2.push(i - 1);
                }
                if i < n - 1 && !seen[i + 1] {
                    seen[i + 1] = true;
                    q2.push(i + 1);
                }
                for &p in &FACTORS[nums[i] as usize] {
                    if let Some(list) = edges.get_mut(&p) {
                        for &j in list.iter() {
                            if !seen[j] {
                                seen[j] = true;
                                q2.push(j);
                            }
                        }
                        list.clear();
                    }
                }
            }
            q = q2;
            res += 1;
        }
    }
}


{% endraw %}
```
