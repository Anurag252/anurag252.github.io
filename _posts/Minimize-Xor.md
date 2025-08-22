---
title: "Minimize Xor"
date: "2025-01-15T08:10:54+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 10 ms (0.00%) | Memory: 4.9 MB (0.00%) - LeetSync"
---

```go
func minimizeXor(num1 int, num2 int) int {

    count := 0
    i := 0
    for num2 != 0 {
        i = num2 & 1
        num2 =  num2 >> 1
        if i == 1 {
            count += 1
        }
    }

    res := make([]int,1)

    num3 := num1 

    numof1 := 0
    i = 0
    for num3 != 0 {
        i = num3 & 1
        num3 =  num3 >> 1
        if i == 1{
            numof1 += 1
        }
    }
    //fmt.Println(countOfNum3)
    diff1 := 0
    diff2 := 0
    if numof1 < count { 
                        // more 1s available but less needed
                        // find first 0 from left and make it 1
        diff2 = count - numof1
    } else {
        // less available but more needed
        // skip diff  1s from left and then make rest equal
        diff1 = numof1 - count
    }
    
    i = 0
    for count > 0 {
        fmt.Println(i, num1, res, count, diff1, diff2 )
        i = num1 & 1
        if i == 1 {
            if diff1 > 0 { // skip diff1 number of 1s
                res = append(res, 0)
                diff1 --
            } else {
                res = append(res, 1)
                //res = res | 1 // else attach 1
                //res = res << 1
                count -- 
            }
        } else {
            if diff2 > 0 {
                res = append(res, 1)
                //res = res | 1 // if diff2 > 0 make first 0 from left and make it 1
                //res = res << 1
                diff2 --
                count --
            } else {
                res = append(res, 0)
                //res = res | 0 // else keep it zero 
                //res = res << 1
            }
        }

        num1 = num1 >> 1

        
    }
    
    // reverse res
    slices.Reverse(res)
    fmt.Println(res[:len(res)-1])
    res1 := 0
    for j := 0 ; j < len(res)-1 ; j ++ {
        res1 = res1 | res[j]
        res1 = res1 << 1
    }

    //fmt.Println(res, num3 )
    return res1 >> 1
}
```