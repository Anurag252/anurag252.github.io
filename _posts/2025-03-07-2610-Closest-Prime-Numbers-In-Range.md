---
title: "2610 Closest Prime Numbers In Range"
date: "2025-03-07T09:46:12+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Closest Prime Numbers in Range](https://leetcode.com/problems/closest-prime-numbers-in-range) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two positive integers left and right, find the two integers num1 and num2 such that:

	left <= num1 < num2 <= right .
	Both num1 and num2 are prime numbers.
	num2 - num1 is the **minimum** amongst all other pairs satisfying the above conditions.

Return the positive integer array ans = [num1, num2]. If there are multiple pairs satisfying these conditions, return the one with the **smallest** num1 value. If no such numbers exist, return [-1, -1]*.*

 

Example 1:

```

**Input:** left = 10, right = 19
**Output:** [11,13]
**Explanation:** The prime numbers between 10 and 19 are 11, 13, 17, and 19.
The closest gap between any pair is 2, which can be achieved by [11,13] or [17,19].
Since 11 is smaller than 17, we return the first pair.

```

Example 2:

```

**Input:** left = 4, right = 6
**Output:** [-1,-1]
**Explanation:** There exists only one prime number in the given range, so the conditions cannot be satisfied.

```

 

**Constraints:**

	1 <= left <= right <= 106

 

                            {% raw %}
                            ```python
                            class Solution:
    def closestPrimes(self, left: int, right: int) -> List[int]:
        
        last = -1
        res = [-1,-1]
        diff = math.pow(10, 6)
        def all_primes(divisors):
            for i in range (2, 1000):
                prime = True
                for j in range(2,i):
                    if i % j == 0:
                        prime= False
                        break 
                if prime:
                    divisors.append(i)

        divisors = []
        all_primes(divisors)
        def isPrime(k):
            if k == 1:
                return False
            if k == 2:
                return True
            t = math.floor(math.sqrt(k))
            for m in divisors:
                if m > t + 1:
                    divisors.append(k)
                    return True
                if k % m == 0:
                    return False
            divisors.append(k)
            return True
            for i in range(2, math.floor(math.sqrt(k)) + 1):
                if k % i == 0:
                    return False
            return True

        for k in range(left, right+1):
            if isPrime(k) :
                if last == -1 :
                    last = k
                    continue
                else:
                    if k - last < diff:
                        diff = k - last
                        res[0] = last
                        res[1] = k
                    last = k
        return res
        
        
        
                            {% endraw %}
                            