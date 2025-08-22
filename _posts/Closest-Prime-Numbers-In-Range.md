---
title: "Closest Prime Numbers In Range"
date: "2025-03-07T09:46:12+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 6507 ms (7.19%) | Memory: 20.4 MB (68.13%) - LeetSync"
---

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
        
        
        
```