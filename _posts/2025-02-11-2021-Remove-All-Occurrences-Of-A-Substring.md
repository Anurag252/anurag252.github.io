---
title: "2021 Remove All Occurrences Of A Substring"
date: "2025-02-11T08:43:07+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---

## [Remove All Occurrences of a Substring](https://leetcode.com/problems/remove-all-occurrences-of-a-substring) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two strings s and part, perform the following operation on s until **all** occurrences of the substring part are removed:

	Find the **leftmost** occurrence of the substring part and **remove** it from s.

Return s* after removing all occurrences of *part.

A **substring** is a contiguous sequence of characters in a string.

 

Example 1:

```

**Input:** s = "daabcbaabcbc", part = "abc"
**Output:** "dab"
**Explanation**: The following operations are done:
- s = "da**abc**baabcbc", remove "abc" starting at index 2, so s = "dabaabcbc".
- s = "daba**abc**bc", remove "abc" starting at index 4, so s = "dababc".
- s = "dab**abc**", remove "abc" starting at index 3, so s = "dab".
Now s has no occurrences of "abc".

```

Example 2:

```

**Input:** s = "axxxxyyyyb", part = "xy"
**Output:** "ab"
**Explanation**: The following operations are done:
- s = "axxx**xy**yyyb", remove "xy" starting at index 4 so s = "axxxyyyb".
- s = "axx**xy**yyb", remove "xy" starting at index 3 so s = "axxyyb".
- s = "ax**xy**yb", remove "xy" starting at index 2 so s = "axyb".
- s = "a**xy**b", remove "xy" starting at index 1 so s = "ab".
Now s has no occurrences of "xy".

```

 

**Constraints:**

	1 <= s.length <= 1000
	1 <= part.length <= 1000
	s​​​​​​ and part consists of lowercase English letters.

```go
import (
    "strings"
    "fmt"
    "hash/fnv"
)

func hash(s string) uint32 {
        h := fnv.New32a()
        h.Write([]byte(s))
        return h.Sum32()
}

func removeOccurrences(s string, part string) string {
    // in case we do a recursive func, we get n/2 * m 
    // another approach is maybe brackets balancing like stack
    // that is m + n efficient ?def more than first approach 
    // No this is also n*m
    // how about sliding window ?


    st := make([]string, 0)
    h := hash(part)
    for _, k := range s {
        if len(st) >= len(part) {
            last := st[len(st) - len(part):]
            //fmt.Println(last, st)
            if hash(strings.Join(last, "")) == h {
                st = st[:len(st) - len(part)]
            } 
        }
        st = append(st, string(k))
        
    }
    if len(st) >= len(part) {
            last := st[len(st) - len(part):]
            fmt.Println(last, st)
            if strings.Join(last, "") == part {
                st = st[:len(st) - len(part)]
            } 
        }
    return strings.Join(st, "")
    





}
```