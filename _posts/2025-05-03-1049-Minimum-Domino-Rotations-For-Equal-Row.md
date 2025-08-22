---
            title: "1049 Minimum Domino Rotations For Equal Row"
            date: "2025-05-03T06:53:46+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Domino Rotations For Equal Row](https://leetcode.com/problems/minimum-domino-rotations-for-equal-row) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

In a row of dominoes, tops[i] and bottoms[i] represent the top and bottom halves of the ith domino. (A domino is a tile with two numbers from 1 to 6 - one on each half of the tile.)

We may rotate the ith domino, so that tops[i] and bottoms[i] swap values.

Return the minimum number of rotations so that all the values in tops are the same, or all the values in bottoms are the same.

If it cannot be done, return -1.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/05/14/domino.png)
```

**Input:** tops = [2,1,2,4,2,2], bottoms = [5,2,6,2,3,2]
**Output:** 2
**Explanation:** 
The first figure represents the dominoes as given by tops and bottoms: before we do any rotations.
If we rotate the second and fourth dominoes, we can make every value in the top row equal to 2, as indicated by the second figure.

```

Example 2:

```

**Input:** tops = [3,5,1,2,3], bottoms = [3,6,3,3,4]
**Output:** -1
**Explanation:** 
In this case, it is not possible to rotate the dominoes to make one row of values equal.

```

 

**Constraints:**

	2 <= tops.length <= 2 * 104
	bottoms.length == tops.length
	1 <= tops[i], bottoms[i] <= 6

{% raw %}


```rust


use std::collections::HashMap;
use std::cmp::max;
use std::cmp::min;



impl Solution {
    pub fn min_domino_rotations(tops: Vec<i32>, bottoms: Vec<i32>) -> i32 {
        let mut dominoes = HashMap::new();
        let mut dominoes_tops = HashMap::new();
        let mut dominoes_bottoms = HashMap::new();


        for (top, bottom) in tops.iter().zip(bottoms.iter()) {
    if top == bottom {
        *dominoes.entry(*top).or_insert(0) += 1;
        // skip adding to tops or bottoms individually
    } else {
        *dominoes.entry(*top).or_insert(0) += 1;
        *dominoes.entry(*bottom).or_insert(0) += 1;
        *dominoes_tops.entry(*top).or_insert(0) += 1;
        *dominoes_bottoms.entry(*bottom).or_insert(0) += 1;
    }
}


        let mut mx_k = 0;
        let mut mx_v = 0;

        for (k, v) in &dominoes {
            if *v > mx_v {
                mx_v = *v;
                mx_k = *k;
            }
        }

        let top_count = *dominoes_tops.get(&mx_k).unwrap_or(&0);
        let bottom_count = *dominoes_bottoms.get(&mx_k).unwrap_or(&0);

        println!("dominoes_tops: {:?}", dominoes_tops);
        println!("dominoes_bottoms: {:?}", dominoes_bottoms);
        println!("dominoes (combined): {:?}", dominoes);
        println!("Max key: {}, Top count: {}, Bottom count: {}", mx_k, top_count, bottom_count);

        if *dominoes.get(&mx_k).unwrap_or(&0) < (tops.len()) {
            return -1
        }
        return min(top_count as i32 , bottom_count as i32);

    }
}



{% endraw %}
