---
title: "Construct Smallest Number From Di String"
date: "2025-02-18T08:21:13+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 3.8 MB (90.00%) - LeetSync"
---

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
```