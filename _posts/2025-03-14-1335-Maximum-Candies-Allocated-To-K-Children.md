---
title: "1335 Maximum Candies Allocated To K Children"
date: "2025-03-14T14:09:09+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Maximum Candies Allocated to K Children](https://leetcode.com/problems/maximum-candies-allocated-to-k-children) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array candies. Each element in the array denotes a pile of candies of size candies[i]. You can divide each pile into any number of **sub piles**, but you **cannot** merge two piles together.

You are also given an integer k. You should allocate piles of candies to k children such that each child gets the **same** number of candies. Each child can be allocated candies from **only one** pile of candies and some piles of candies may go unused.

Return *the **maximum number of candies** each child can get.*

 

Example 1:

```

**Input:** candies = [5,8,6], k = 3
**Output:** 5
**Explanation:** We can divide candies[1] into 2 piles of size 5 and 3, and candies[2] into 2 piles of size 5 and 1. We now have five piles of candies of sizes 5, 5, 3, 5, and 1. We can allocate the 3 piles of size 5 to 3 children. It can be proven that each child cannot receive more than 5 candies.

```

Example 2:

```

**Input:** candies = [2,5], k = 11
**Output:** 0
**Explanation:** There are 11 children but only 7 candies in total, so it is impossible to ensure each child receives at least one candy. Thus, each child gets no candy and the answer is 0.

```

 

**Constraints:**

	1 <= candies.length <= 105
	1 <= candies[i] <= 107
	1 <= k <= 1012

```python
class Solution:
    def maximumCandies(self, candies: List[int], k: int) -> int:
        # say total number of candies is x
        # so each child should get x/k
        # minimum number of candies is n
        # if x/k > n -> then we can assign only n
        # if x/k < n then x/k

       
        def test(candies, candies_each, k):
            if candies_each == 0:
                return False
            q = []

            for n in candies:
                if n >= candies_each:
                    q.append(n - candies_each)


            left = k - len(q)
            if left <= 0:
                return (True , candies_each) # every one got and we have extra

            for n in q:
                if n >= candies_each: 
                    left -= (n // candies_each)

            if left <= 0:
                return (True, candies_each)
            return False, 0
            
        if sum(candies) < k:
            return 0


        left = 1
        right = max(candies)
        res = 0
        while(left  < right):
            mid = (left + right) // 2
            if test(candies, mid, k)[0]:
                left = mid + 1
                res = mid
            else:
                right = mid - 1
            #print(left, right, mid)
    
        if test(candies, left, k)[0]:
            res = left
        return res
        
```