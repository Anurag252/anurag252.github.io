---
title: "3219 Make Lexicographically Smallest Array By Swapping Elements"
date: "2025-01-25T13:36:21+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---


                            ## [Make Lexicographically Smallest Array by Swapping Elements](https://leetcode.com/problems/make-lexicographically-smallest-array-by-swapping-elements) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** array of **positive** integers nums and a **positive** integer limit.

In one operation, you can choose any two indices i and j and swap nums[i] and nums[j] **if** |nums[i] - nums[j]| <= limit.

Return *the **lexicographically smallest array** that can be obtained by performing the operation any number of times*.

An array a is lexicographically smaller than an array b if in the first position where a and b differ, array a has an element that is less than the corresponding element in b. For example, the array [2,10,3] is lexicographically smaller than the array [10,2,3] because they differ at index 0 and 2 < 10.

 

Example 1:

```

**Input:** nums = [1,5,3,9,8], limit = 2
**Output:** [1,3,5,8,9]
**Explanation:** Apply the operation 2 times:
- Swap nums[1] with nums[2]. The array becomes [1,3,5,9,8]
- Swap nums[3] with nums[4]. The array becomes [1,3,5,8,9]
We cannot obtain a lexicographically smaller array by applying any more operations.
Note that it may be possible to get the same result by doing different operations.

```

Example 2:

```

**Input:** nums = [1,7,6,18,2,1], limit = 3
**Output:** [1,6,7,18,1,2]
**Explanation:** Apply the operation 3 times:
- Swap nums[1] with nums[2]. The array becomes [1,6,7,18,2,1]
- Swap nums[0] with nums[4]. The array becomes [2,6,7,18,1,1]
- Swap nums[0] with nums[5]. The array becomes [1,6,7,18,1,2]
We cannot obtain a lexicographically smaller array by applying any more operations.

```

Example 3:

```

**Input:** nums = [1,7,28,19,10], limit = 3
**Output:** [1,7,28,19,10]
**Explanation:** [1,7,28,19,10] is the lexicographically smallest array we can obtain because we cannot apply the operation on any two indices.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 109
	1 <= limit <= 109

                            {% raw %}
                            ```go
                            import "slices"

func lexicographicallySmallestArray(nums []int, limit int) []int {

    if len(nums) <= 1 {
        return nums
    }
    arr := make([]int, len(nums))
    for i, _ := range nums {
        arr[i] = nums[i]
    }
    slices.Sort(arr)

    temp := make([][]int, 0)
    temp1 := make([]int, 0)
    
    for i, _ := range arr {
        if i == len(arr) - 1 {
            if len(temp1) > 0 {

            }
            if arr[i] - arr[i-1] <= limit { // if true that means i-1 was already added
                temp1 = append(temp1, i)
                cpy := make([]int, len(temp1))
                copy(cpy, temp1)
                temp = append(temp, cpy)
                
            } else { // i-1 was already added
                if len(temp1) > 0 {
                    cpy := make([]int, len(temp1))
                    copy(cpy, temp1)
                    temp = append(temp, cpy)
                }
                
                temp1 = make([]int, 0)
                temp1 = append(temp1, i)
                cpy := make([]int, len(temp1))
                copy(cpy, temp1)
                temp = append(temp, cpy)

            }
            

            break
        }
        if arr[i+1] - arr[i] <= limit {
            temp1 = append(temp1, i)
        } else {
            temp1 = append(temp1, i) // previous is added to ans
            cpy := make([]int, len(temp1))
            copy(cpy, temp1)
            temp = append(temp, cpy)
            temp1 = make([]int, 0)
            
        }
    }

    mp := make(map[int]int)

    for i, k := range temp {
        for _, j := range k {
            mp[arr[j]] = i
        }
    }
    tl := make([]int, len(temp))
    for i, _ := range nums {
        grp := mp[nums[i]]
        temp1 := temp[grp]
        index := tl[grp]
        nums[i] = arr[temp1[index]]
        tl[grp] += 1

    }
    
    //fmt.Println(temp, arr, mp)
    return nums
}
                            {% endraw %}
                            