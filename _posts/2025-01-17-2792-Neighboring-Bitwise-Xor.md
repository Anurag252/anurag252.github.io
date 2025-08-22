---
            title: "2792 Neighboring Bitwise Xor"
            date: "2025-01-17T08:15:51+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Neighboring Bitwise XOR](https://leetcode.com/problems/neighboring-bitwise-xor) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A **0-indexed** array derived with length n is derived by computing the **bitwise XOR** (⊕) of adjacent values in a **binary array** original of length n.

Specifically, for each index i in the range [0, n - 1]:

	If i = n - 1, then derived[i] = original[i] ⊕ original[0].
	Otherwise, derived[i] = original[i] ⊕ original[i + 1].

Given an array derived, your task is to determine whether there exists a **valid binary array** original that could have formed derived.

Return ***true** if such an array exists or **false** otherwise.*

	A binary array is an array containing only **0's** and **1's**

 

Example 1:

```

**Input:** derived = [1,1,0]
**Output:** true
**Explanation:** A valid original array that gives derived is [0,1,0].
derived[0] = original[0] ⊕ original[1] = 0 ⊕ 1 = 1 
derived[1] = original[1] ⊕ original[2] = 1 ⊕ 0 = 1
derived[2] = original[2] ⊕ original[0] = 0 ⊕ 0 = 0

```

Example 2:

```

**Input:** derived = [1,1]
**Output:** true
**Explanation:** A valid original array that gives derived is [0,1].
derived[0] = original[0] ⊕ original[1] = 1
derived[1] = original[1] ⊕ original[0] = 1

```

Example 3:

```

**Input:** derived = [1,0]
**Output:** false
**Explanation:** There is no valid original array that gives derived.

```

 

**Constraints:**

	n == derived.length
	1 <= n <= 105
	The values in derived are either **0's** or **1's**

{% raw %}
```go
func doesValidArrayExist(derived []int) bool {
    // a ^ b = 1 diff
    // b ^ c = 1 diff
    // c ^ a = 1 diff
    // if a and b are same , b and c are same but c and a are diff -> not possible 
    // it is always possible to construct derived except last element to first elemen rule
    // and there are only two possible solutions start with 0 or 1

    valid := make([]int,1)

    // start with 0
    valid[0] = 0

    for _, k := range derived {
        if k == 1 {
            if valid[len(valid) - 1] == 1 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        } else {
            if valid[len(valid) - 1] == 0 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        }
    }

    if valid[len(valid) - 1] == valid[0] {
        return true
    }
    fmt.Println(valid)
    valid = make([]int,1)

    // start with 0
    valid[0] = 1

    for _, k := range derived {
        if k == 1 {
            if valid[len(valid) - 1] == 1 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        } else {
            if valid[len(valid) - 1] == 0 {
                valid = append(valid, 0)
            } else {
                valid = append(valid, 1)
            }
        }
    }

    if valid[len(valid) - 1] == valid[0] {
        return true
    }
    return false
}
{% endraw %}
