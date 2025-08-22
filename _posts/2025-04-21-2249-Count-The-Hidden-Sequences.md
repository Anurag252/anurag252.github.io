---
            title: "2249 Count The Hidden Sequences"
            date: "2025-04-21T06:34:12+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Count the Hidden Sequences](https://leetcode.com/problems/count-the-hidden-sequences) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** array of n integers differences, which describes the **differences **between each pair of **consecutive **integers of a **hidden** sequence of length (n + 1). More formally, call the hidden sequence hidden, then we have that differences[i] = hidden[i + 1] - hidden[i].

You are further given two integers lower and upper that describe the **inclusive** range of values [lower, upper] that the hidden sequence can contain.

	For example, given differences = [1, -3, 4], lower = 1, upper = 6, the hidden sequence is a sequence of length 4 whose elements are in between 1 and 6 (**inclusive**).

		[3, 4, 1, 5] and [4, 5, 2, 6] are possible hidden sequences.
		[5, 6, 3, 7] is not possible since it contains an element greater than 6.
		[1, 2, 3, 4] is not possible since the differences are not correct.

Return *the number of **possible** hidden sequences there are.* If there are no possible sequences, return 0.

 

Example 1:

```

**Input:** differences = [1,-3,4], lower = 1, upper = 6
**Output:** 2
**Explanation:** The possible hidden sequences are:
- [3, 4, 1, 5]
- [4, 5, 2, 6]
Thus, we return 2.

```

Example 2:

```

**Input:** differences = [3,-4,5,1,-2], lower = -4, upper = 5
**Output:** 4
**Explanation:** The possible hidden sequences are:
- [-3, 0, -4, 1, 2, 0]
- [-2, 1, -3, 2, 3, 1]
- [-1, 2, -2, 3, 4, 2]
- [0, 3, -1, 4, 5, 3]
Thus, we return 4.

```

Example 3:

```

**Input:** differences = [4,-7,2], lower = 3, upper = 6
**Output:** 0
**Explanation:** There are no possible hidden sequences. Thus, we return 0.

```

 

**Constraints:**

	n == differences.length
	1 <= n <= 105
	-105 <= differences[i] <= 105
	-105 <= lower <= upper <= 105

{% raw %}


```rust


impl Solution {
    pub fn number_of_arrays(differences: Vec<i32>, lower: i32, upper: i32) -> i32 {
        // Use prefix sum to track running total
        let mut prefix_sum = 0i64;
        let mut min_val = 0i64;
        let mut max_val = 0i64;

        for &diff in &differences {
            prefix_sum += diff as i64;
            min_val = min_val.min(prefix_sum);
            max_val = max_val.max(prefix_sum);
        }

        // If the difference between max and min exceeds the available range, return 0
        let available_range = (upper - lower) as i64;
        let required_range = max_val - min_val;

        if required_range > available_range {
            return 0;
        }

        // Otherwise, calculate number of valid starting values
        let valid_starts = available_range - required_range + 1;
        valid_starts as i32
    }
}



{% endraw %}
```
