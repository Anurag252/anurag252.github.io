---
            title: "2107 Find Unique Binary String"
            date: "2025-02-20T07:42:21+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Find Unique Binary String](https://leetcode.com/problems/find-unique-binary-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an array of strings nums containing n **unique** binary strings each of length n, return *a binary string of length *n* that **does not appear** in *nums*. If there are multiple answers, you may return **any** of them*.

 

Example 1:

```

**Input:** nums = ["01","10"]
**Output:** "11"
**Explanation:** "11" does not appear in nums. "00" would also be correct.

```

Example 2:

```

**Input:** nums = ["00","01"]
**Output:** "11"
**Explanation:** "11" does not appear in nums. "10" would also be correct.

```

Example 3:

```

**Input:** nums = ["111","011","001"]
**Output:** "101"
**Explanation:** "101" does not appear in nums. "000", "010", "100", and "110" would also be correct.

```

 

**Constraints:**

	n == nums.length
	1 <= n <= 16
	nums[i].length == n
	nums[i] is either '0' or '1'.
	All the strings of nums are **unique**.

{% raw %}


````go


func findDifferentBinaryString(nums []string) string {
    arr := []string{"0","1"}

    n := len(nums)
    if n == 1 {
        if nums[0] == "0" {
            return "1"
        } else {
            return "0"
        }
        
    }
    mp := make(map[string]bool)

    for _, k := range nums {
        mp[k] = true
    }

    return calc(arr, n-1, arr, mp)
}

func calc(arr []string, n int, prev []string, mp map[string]bool) string {
    if n == 1 {
        for _, k := range prev {
            for _, k1 := range arr {
                _, ok := mp[k + k1]
                if !ok {
                    return k + k1
                }
            }
            
        }
    }
    t := make([]string, 0)
    for _, k1 := range arr {
        for _, k := range prev {
            t = append(t, k1 + k)
        }
    }
    return calc(arr, n-1 , t, mp)

}


{% endraw %}
