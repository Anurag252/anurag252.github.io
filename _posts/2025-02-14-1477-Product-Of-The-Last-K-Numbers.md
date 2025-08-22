---
title: "1477 Product Of The Last K Numbers"
date: "2025-02-14T09:13:00+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---

## [Product of the Last K Numbers](https://leetcode.com/problems/product-of-the-last-k-numbers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Design an algorithm that accepts a stream of integers and retrieves the product of the last k integers of the stream.

Implement the ProductOfNumbers class:

	ProductOfNumbers() Initializes the object with an empty stream.
	void add(int num) Appends the integer num to the stream.
	int getProduct(int k) Returns the product of the last k numbers in the current list. You can assume that always the current list has at least k numbers.

The test cases are generated so that, at any time, the product of any contiguous sequence of numbers will fit into a single 32-bit integer without overflowing.

 

Example:

```

**Input**
["ProductOfNumbers","add","add","add","add","add","getProduct","getProduct","getProduct","add","getProduct"]
[[],[3],[0],[2],[5],[4],[2],[3],[4],[8],[2]]

**Output**
[null,null,null,null,null,null,20,40,0,null,32]

**Explanation**
ProductOfNumbers productOfNumbers = new ProductOfNumbers();
productOfNumbers.add(3);        // [3]
productOfNumbers.add(0);        // [3,0]
productOfNumbers.add(2);        // [3,0,2]
productOfNumbers.add(5);        // [3,0,2,5]
productOfNumbers.add(4);        // [3,0,2,5,4]
productOfNumbers.getProduct(2); // return 20. The product of the last 2 numbers is 5 * 4 = 20
productOfNumbers.getProduct(3); // return 40. The product of the last 3 numbers is 2 * 5 * 4 = 40
productOfNumbers.getProduct(4); // return 0. The product of the last 4 numbers is 0 * 2 * 5 * 4 = 0
productOfNumbers.add(8);        // [3,0,2,5,4,8]
productOfNumbers.getProduct(2); // return 32. The product of the last 2 numbers is 4 * 8 = 32 

```

 

**Constraints:**

	0 <= num <= 100
	1 <= k <= 4 * 104
	At most 4 * 104 calls will be made to add and getProduct.
	The product of the stream at any point in time will fit in a **32-bit** integer.

 

**Follow-up: **Can you implement **both** GetProduct and Add to work in O(1) time complexity instead of O(k) time complexity?

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