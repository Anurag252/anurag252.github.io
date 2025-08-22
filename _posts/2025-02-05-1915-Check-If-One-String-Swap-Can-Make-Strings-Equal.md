---
            title: "1915 Check If One String Swap Can Make Strings Equal"
            date: "2025-02-05T06:22:39+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Check if One String Swap Can Make Strings Equal](https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given two strings s1 and s2 of equal length. A **string swap** is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices.

Return true *if it is possible to make both strings equal by performing **at most one string swap **on **exactly one** of the strings. *Otherwise, return false.

 

Example 1:

```

**Input:** s1 = "bank", s2 = "kanb"
**Output:** true
**Explanation:** For example, swap the first character with the last character of s2 to make "bank".

```

Example 2:

```

**Input:** s1 = "attack", s2 = "defend"
**Output:** false
**Explanation:** It is impossible to make them equal with one string swap.

```

Example 3:

```

**Input:** s1 = "kelb", s2 = "kelb"
**Output:** true
**Explanation:** The two strings are already equal, so no string swap operation is required.

```

 

**Constraints:**

	1 <= s1.length, s2.length <= 100
	s1.length == s2.length
	s1 and s2 consist of only lowercase English letters.

{% raw %}


```go


func areAlmostEqual(s1 string, s2 string) bool {
    
    diff1 := make([]rune, 0)
    diff2 := make([]rune, 0)
    for i , k := range s1 {
        if rune(s2[i]) != k {
            diff1 = append(diff1, k)
            diff2 = append(diff2, rune(s2[i]) )
        }
    }

    if len(diff1) == 0 {
        return true
    }

    if len(diff1) == 1 {
        return false
    }

    if diff1[0] == diff2[1] && diff1[1] == diff2[0] && len(diff1) == 2 {
        return true
    }
    return false
}


{% endraw %}
```
