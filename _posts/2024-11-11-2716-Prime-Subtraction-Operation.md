---
title: "2716 Prime Subtraction Operation"
date: "2024-11-11T08:10:51+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Prime Subtraction Operation](https://leetcode.com/problems/prime-subtraction-operation) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array nums of length n.

You can perform the following operation as many times as you want:

	Pick an index i that you haven’t picked before, and pick a prime p **strictly less than** nums[i], then subtract p from nums[i].

Return *true if you can make nums a strictly increasing array using the above operation and false otherwise.*

A **strictly increasing array** is an array whose each element is strictly greater than its preceding element.

 

Example 1:

```

**Input:** nums = [4,9,6,10]
**Output:** true
**Explanation:** In the first operation: Pick i = 0 and p = 3, and then subtract 3 from nums[0], so that nums becomes [1,9,6,10].
In the second operation: i = 1, p = 7, subtract 7 from nums[1], so nums becomes equal to [1,2,6,10].
After the second operation, nums is sorted in strictly increasing order, so the answer is true.
```

Example 2:

```

**Input:** nums = [6,8,11,12]
**Output:** true
**Explanation: **Initially nums is sorted in strictly increasing order, so we don't need to make any operations.
```

Example 3:

```

**Input:** nums = [5,8,3]
**Output:** false
**Explanation:** It can be proven that there is no way to perform operations to make nums sorted in strictly increasing order, so the answer is false.
```

 

**Constraints:**

	1 <= nums.length <= 1000
	1 <= nums[i] <= 1000
	nums.length == n

```python
class Solution:
    def primeSubOperation(self, nums: List[int]) -> bool:
        prime = []
        for k in range(2,1000):
            
            is_prime = True
            for l in range(2,int(k/2)+1):
                #print(k,l)
                if k % l == 0 and k != l:
                    is_prime = False
                    break
            if is_prime :
                prime.append(k)
        #print(prime)


        a = [0]
        for k in nums:
            t = bisect.bisect_left(prime, k - a[-1])
            if t <= 0 and k <= a[-1]:
                return False
            if t > 0:
                a.append(k - prime[t-1])
            else :
                a.append(k)
            #print(t, prime[t-1])
        #print(a)

        return True



```