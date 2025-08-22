---
title: "Prime Subtraction Operation"
date: "2024-11-11T08:10:51+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 671 ms (5.03%) | Memory: 16.9 MB (35.50%) - LeetSync"
---

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