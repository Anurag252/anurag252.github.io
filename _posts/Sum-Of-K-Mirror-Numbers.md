---
title: "Sum Of K Mirror Numbers"
date: "2025-06-23T10:06:49+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 7372 ms (5.16%) | Memory: 17.9 MB (51.61%) - LeetSync"
---

```python
class Solution:
    def kMirror(self, k: int, n: int) -> int:


        def generate_palindromes():
            # Yield palindromes in increasing order
            for length in range(1, 100):  # Adjust as needed
                half = 10 ** ((length - 1) // 2)
                for i in range(half, 10**((length + 1) // 2)):
                    s = str(i)
                    if length % 2 == 0:
                        yield int(s + s[::-1])
                    else:
                        yield int(s + s[-2::-1])
        def to_base_k(n, k):
            digits = []
            while n > 0:
                digits.append(str(n % k))
                n //= k
            return ''.join(reversed(digits)) or '0'

        
        
        found = 0
        final = 0
        total = 0
        while(True):
            for t in generate_palindromes():
                if to_base_k(t, k) == to_base_k(t, k)[::-1]:
                    total += t
                    found += 1
                    if found == n:
                        return total
            
        
                



        
```