---
            title: "2448 Count Number Of Bad Pairs"
            date: "2025-02-09T11:11:05+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Count Number of Bad Pairs](https://leetcode.com/problems/count-number-of-bad-pairs) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array nums. A pair of indices (i, j) is a **bad pair** if i < j and j - i != nums[j] - nums[i].

Return* the total number of **bad pairs** in *nums.

 

Example 1:

```

**Input:** nums = [4,1,3,3]
**Output:** 5
**Explanation:** The pair (0, 1) is a bad pair since 1 - 0 != 1 - 4.
The pair (0, 2) is a bad pair since 2 - 0 != 3 - 4, 2 != -1.
The pair (0, 3) is a bad pair since 3 - 0 != 3 - 4, 3 != -1.
The pair (1, 2) is a bad pair since 2 - 1 != 3 - 1, 1 != 2.
The pair (2, 3) is a bad pair since 3 - 2 != 3 - 3, 1 != 0.
There are a total of 5 bad pairs, so we return 5.

```

Example 2:

```

**Input:** nums = [1,2,3,4,5]
**Output:** 0
**Explanation:** There are no bad pairs.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 109

{% raw %}
```go
func countBadPairs(nums []int) int64 {

    // consecutive numbers must lie at indexes
    // we could count the number of consecutive numbers but 
    // [1,6,7,4,5], here 6 and 7 are consecutive and good pair and 1,4,5 are another good pairs
    // another obsv is that all good pairs till 4 will be added to 5
    // total number of pairs are n + n-1 + n-2 + n-3 . . .
    // saw the 2nd hint

    mp := make(map[int]int)

    totalPairs := int64(len(nums) * (len(nums) -1))/2
    goodPairs := int64(0)
    for i, k := range nums {
        elem := k - i
        _, ok := mp[elem]
        if ! ok {
            mp[elem] = 1
        } else {
            mp[elem] += 1
        }
    }

    for _, k := range mp {
        if k > 1 {
            goodPairs += int64((k * (k-1))/2)
        }
        
    }
    //fmt.Println(mp)
    return totalPairs - goodPairs

}
{% endraw %}
