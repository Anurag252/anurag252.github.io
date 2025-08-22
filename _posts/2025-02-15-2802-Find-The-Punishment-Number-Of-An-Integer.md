---
            title: "2802 Find The Punishment Number Of An Integer"
            date: "2025-02-15T08:36:25+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Find the Punishment Number of an Integer](https://leetcode.com/problems/find-the-punishment-number-of-an-integer) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a positive integer n, return *the **punishment number*** of n.

The **punishment number** of n is defined as the sum of the squares of all integers i such that:

	1 <= i <= n
	The decimal representation of i * i can be partitioned into contiguous substrings such that the sum of the integer values of these substrings equals i.

 

Example 1:

```

**Input:** n = 10
**Output:** 182
**Explanation:** There are exactly 3 integers i in the range [1, 10] that satisfy the conditions in the statement:
- 1 since 1 * 1 = 1
- 9 since 9 * 9 = 81 and 81 can be partitioned into 8 and 1 with a sum equal to 8 + 1 == 9.
- 10 since 10 * 10 = 100 and 100 can be partitioned into 10 and 0 with a sum equal to 10 + 0 == 10.
Hence, the punishment number of 10 is 1 + 81 + 100 = 182

```

Example 2:

```

**Input:** n = 37
**Output:** 1478
**Explanation:** There are exactly 4 integers i in the range [1, 37] that satisfy the conditions in the statement:
- 1 since 1 * 1 = 1. 
- 9 since 9 * 9 = 81 and 81 can be partitioned into 8 + 1. 
- 10 since 10 * 10 = 100 and 100 can be partitioned into 10 + 0. 
- 36 since 36 * 36 = 1296 and 1296 can be partitioned into 1 + 29 + 6.
Hence, the punishment number of 37 is 1 + 81 + 100 + 1296 = 1478

```

 

**Constraints:**

	1 <= n <= 1000

{% raw %}


```go


func punishmentNumber(n int) int {
    // we can do n + T(n-1)
    // for each n -> square it, then split it and see if thi sums up. This can be done in 
    // 6 (log n2) iterations for each n
    // n2logn
    // m times 
    // n2^logn
    if n == 1 {
        return 1
    }

    k := n * n
    if recurse(k, n, 0) {
        //fmt.Println(n, "found")
        return k + punishmentNumber(n-1)
    }

    return punishmentNumber(n-1)
    
}

func recurse(n int, init int, sum int) bool {
    if n <= 9 {
        if init == sum + n {
            return true
        } else {
            return false
        }
    }

    if init == sum + n {
            return true
    }

    l := n
    b := 10

    for l / b  > 0 {
        rem := l % b
        if recurse(l/b, init, sum + rem) {
            return true
        }
        b *= 10
    }
    return false

}


{% endraw %}
