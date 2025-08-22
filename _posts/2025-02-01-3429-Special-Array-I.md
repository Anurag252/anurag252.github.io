---
            title: "3429 Special Array I"
            date: "2025-02-01T10:17:47+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Special Array I](https://leetcode.com/problems/special-array-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

An array is considered **special** if every pair of its adjacent elements contains two numbers with different parity.

You are given an array of integers nums. Return true if nums is a **special** array, otherwise, return false.

 

Example 1:

**Input:** nums = [1]

**Output:** true

**Explanation:**

There is only one element. So the answer is true.

Example 2:

**Input:** nums = [2,1,4]

**Output:** true

**Explanation:**

There is only two pairs: (2,1) and (1,4), and both of them contain numbers with different parity. So the answer is true.

Example 3:

**Input:** nums = [4,3,1,6]

**Output:** false

**Explanation:**

nums[1] and nums[2] are both odd. So the answer is false.

 

**Constraints:**

	1 <= nums.length <= 100
	1 <= nums[i] <= 100

{% raw %}


```go


func isArraySpecial(nums []int) bool {
    t := nums[0]
    isEven := false // odd

    if t & 1 == 0 { // even
        isEven = true
    }

    // 1 0 1 0 1 0
    // 0 1 0 1 0 1

    for _ , k := range nums {
        
        if ( ((k & 1) == 0 &&  isEven ) || ((k & 1) == 1 &&  !isEven ) ) {
            isEven = !isEven
        } else {
            return false
        }
        
       
        //fmt.Println(t, k, k & 1)
        
    }
    return true
}


{% endraw %}
