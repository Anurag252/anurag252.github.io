---
            title: "1819 Construct The Lexicographically Largest Valid Sequence"
            date: "2025-02-16T09:07:43+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Construct the Lexicographically Largest Valid Sequence](https://leetcode.com/problems/construct-the-lexicographically-largest-valid-sequence) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer n, find a sequence that satisfies all of the following:

	The integer 1 occurs once in the sequence.
	Each integer between 2 and n occurs twice in the sequence.
	For every integer i between 2 and n, the **distance** between the two occurrences of i is exactly i.

The **distance** between two numbers on the sequence, a[i] and a[j], is the absolute difference of their indices, |j - i|.

Return *the **lexicographically largest** sequence**. It is guaranteed that under the given constraints, there is always a solution. *

A sequence a is lexicographically larger than a sequence b (of the same length) if in the first position where a and b differ, sequence a has a number greater than the corresponding number in b. For example, [0,1,9,0] is lexicographically larger than [0,1,5,6] because the first position they differ is at the third number, and 9 is greater than 5.

 

Example 1:

```

**Input:** n = 3
**Output:** [3,1,2,3,2]
**Explanation:** [2,3,2,1,3] is also a valid sequence, but [3,1,2,3,2] is the lexicographically largest valid sequence.

```

Example 2:

```

**Input:** n = 5
**Output:** [5,3,1,4,3,5,2,4,2]

```

 

**Constraints:**

	1 <= n <= 20

{% raw %}
```go
package main

import "fmt"

func constructDistancedSequence(n int) []int {
    arr := make([]int, 2*n-1)
    used := make([]bool, n+1)
    
    var result []int
    recurse(arr, used, n, 0, &result)
    return result
}

func recurse(arr []int, used []bool, n, index int, result *[]int) bool {
    if index == len(arr) {
        *result = append([]int(nil), arr...) // Store the first valid solution
        return true
    }

    if arr[index] != 0 {
        return recurse(arr, used, n, index+1, result) // Skip filled indices
    }

    for num := n; num >= 1; num-- {
        if used[num] {
            continue
        }
        if num == 1 {
            arr[index] = 1
            used[1] = true
            if recurse(arr, used, n, index+1, result) {
                return true
            }
            arr[index] = 0
            used[1] = false
        } else if index+num < len(arr) && arr[index+num] == 0 {
            arr[index], arr[index+num] = num, num
            used[num] = true
            if recurse(arr, used, n, index+1, result) {
                return true
            }
            arr[index], arr[index+num] = 0, 0
            used[num] = false
        }
    }
    return false
}



{% endraw %}
