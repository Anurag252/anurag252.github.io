---
title: "2456 Construct Smallest Number From Di String"
date: "2025-02-18T08:21:13+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---


                            ## [Construct Smallest Number From DI String](https://leetcode.com/problems/construct-smallest-number-from-di-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** string pattern of length n consisting of the characters 'I' meaning **increasing** and 'D' meaning **decreasing**.

A **0-indexed** string num of length n + 1 is created using the following conditions:

	num consists of the digits '1' to '9', where each digit is used **at most** once.
	If pattern[i] == 'I', then num[i] < num[i + 1].
	If pattern[i] == 'D', then num[i] > num[i + 1].

Return *the lexicographically **smallest** possible string *num* that meets the conditions.*

 

Example 1:

```

**Input:** pattern = "IIIDIDDD"
**Output:** "123549876"
Explanation:
At indices 0, 1, 2, and 4 we must have that num[i] < num[i+1].
At indices 3, 5, 6, and 7 we must have that num[i] > num[i+1].
Some possible values of num are "245639871", "135749862", and "123849765".
It can be proven that "123549876" is the smallest possible num that meets the conditions.
Note that "123414321" is not possible because the digit '1' is used more than once.
```

Example 2:

```

**Input:** pattern = "DDD"
**Output:** "4321"
**Explanation:**
Some possible values of num are "9876", "7321", and "8742".
It can be proven that "4321" is the smallest possible num that meets the conditions.

```

 

**Constraints:**

	1 <= pattern.length <= 8
	pattern consists of only the letters 'I' and 'D'.

                            {% raw %}
                            ```go
                            func smallestNumber(pattern string) string {
    // we could try all and backtrack
    // if we find total num of maximas and all need to be unique 
    // lexicographically we need to allocate smaller first 
    // at next level also we need to allocate smaller first 
    // IIIDIDDD -> 1,2,3,2,3,2,1,0 -> add 1 to all so that all remain +vw
    // 2,3,4,3,4,3,2,1 -> now both 4 are maximas - does not work normally
    // Let's try to assign smallest > unused from 0-9 for every I and also 
    // smallest < unused from 0-9

    arr := make([]int, 10)
    res := make([]int, 10)
    for i, _ := range arr {
        // start from i
        arr[i] = 1
        res[0] = i+1
        if allocate(arr, res, pattern, 0){
            //fmt.Println(res, arr)
            s := ""
            for _, k := range res {
                if k != 0 {
                     s += strconv.Itoa(k)
                     }
                }
               
            return s
        }
        arr[i] = 0
    }
    return ""
}

func allocate(arr []int, res []int, pattern string, i int) bool {
    //fmt.Println(arr, res, pattern)
    if i == len(pattern)   {
        return true
    }

    for j, k := range arr {
        if k == 1 {
            continue
        }
        if k == 0 && j+1 > res[i] && string(pattern[i]) == "I" {
            arr[j] = 1
            res[i+1] = j+1
            if allocate(arr, res, pattern, i + 1) {
                return true
            }
            arr[j] = 0
        } else {
            if k == 0 && j+1 < res[i] && string(pattern[i]) == "D" {
            arr[j] = 1
            res[i+1] = j+1
            if allocate(arr, res, pattern, i + 1){
                return true
            }
            arr[j] = 0
            } else {
                return false
            }
        }
        
    }
    return false
}
                            {% endraw %}
                            