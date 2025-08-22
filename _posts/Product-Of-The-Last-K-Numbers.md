---
title: "Product Of The Last K Numbers"
date: "2025-02-14T09:13:00+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 93 ms (44.23%) | Memory: 173.2 MB (7.69%) - LeetSync"
---

```go
import "math/big"

type ProductOfNumbers struct {
    arr []*big.Int
    curr *big.Int
    lastindex int
}


func Constructor() ProductOfNumbers {
    return ProductOfNumbers{
        arr : make([]*big.Int, 0),
        curr : big.NewInt(1),
        lastindex: -1,
        //mp : make(map[int]bool),
    }
}

func Mul(x, y *big.Int) *big.Int {
    return big.NewInt(0).Mul(x, y)
}


func Div(x, y *big.Int) *big.Int {
    return big.NewInt(0).Div(x, y)
}

func (this *ProductOfNumbers) Add(num int)  {
    if num == 0 {
        this.lastindex = len(this.arr)
        num = 1
    }

    this.curr = Mul(this.curr, big.NewInt(int64(num)))
    this.arr = append(this.arr, this.curr)
}


func (this *ProductOfNumbers) GetProduct(k int) int {
    //fmt.Println(this.arr, k, this.lastindex)
    if (len(this.arr) - 1)  - (k - 1) <= this.lastindex {
        return 0
    }
    if len(this.arr)-1-k >= 0 {
        t := Div(this.arr[len(this.arr)-1] , this.arr[len(this.arr)-1-k])
        return int(t.Int64())
    } else {
         return int(this.arr[len(this.arr)-1].Int64())
    }
     // assume list always has k numbers
   
    
}


/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * obj := Constructor();
 * obj.Add(num);
 * param_2 := obj.GetProduct(k);
 */
```