---
title: "3455 Minimum Length Of String After Operations"
date: "2025-01-13T21:08:32+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---


                            ## [Minimum Length of String After Operations](https://leetcode.com/problems/minimum-length-of-string-after-operations) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s.

You can perform the following process on s **any** number of times:

	Choose an index i in the string such that there is **at least** one character to the left of index i that is equal to s[i], and **at least** one character to the right that is also equal to s[i].
	Delete the **closest** character to the **left** of index i that is equal to s[i].
	Delete the **closest** character to the **right** of index i that is equal to s[i].

Return the **minimum** length of the final string s that you can achieve.

 

Example 1:

**Input:** s = "abaacbcbb"

**Output:** 5

**Explanation:**

We do the following operations:

	Choose index 2, then remove the characters at indices 0 and 3. The resulting string is s = "bacbcbb".
	Choose index 3, then remove the characters at indices 0 and 5. The resulting string is s = "acbcb".

Example 2:

**Input:** s = "aa"

**Output:** 2

**Explanation:**

We cannot perform any operations, so we return the length of the original string.

 

**Constraints:**

	1 <= s.length <= 2 * 105
	s consists only of lowercase English letters.

                            {% raw %}
                            ```go
                            func minimumLength(s string) int {
    // if there are 3 chars then 2 can be removed 1 is left 
    // if there are 4 - then also 2 can be removed 2 is left 
    // if there are 5 then 2 can be removed then 3 are left 
    // keep reducing 2 till at max 2 is left
    // (n - 2k) = 1  
    // n - 1/2 = 2k

    mp := make(map[rune]int)

    for _, k := range s {
        if _, ok := mp[k]; ok {
            mp[k] += 1
        } else {
            mp[k] = 1
        }
    }
    reduced := 0
    for _,v := range mp {
        if v >= 3 {
            if (v-1) % 2 == 0 {
                reduced += (v - 1)
            } else {
                reduced += (v - 2)
            }
        }
    }
    return len(s) - reduced
    
}
                            {% endraw %}
                            