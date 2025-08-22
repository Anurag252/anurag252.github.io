---
title: "Count Number Of Balanced Permutations"
date: "2025-05-09T22:47:59+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1971 ms (26.51%) | Memory: 18.4 MB (86.75%) - LeetSync"
---

```python
class Solution:
    def countBalancedPermutations(self, num: str) -> int:
        MOD = 10**9 + 7
        tot, n = 0, len(num)
        cnt = [0] * 10
        for ch in num:
            d = int(ch)
            cnt[d] += 1
            tot += d
        if tot % 2 != 0:
            return 0

        target = tot // 2
        max_odd = (n + 1) // 2
        f = [[0] * (max_odd + 1) for _ in range(target + 1)]
        f[0][0] = 1
        psum = tot_sum = 0
        for i in range(10):
            # Sum of the number of the first i digits
            psum += cnt[i]
            # Sum of the first i numbers
            tot_sum += i * cnt[i]
            for odd_cnt in range(
                min(psum, max_odd), max(0, psum - (n - max_odd)) - 1, -1
            ):
                # The number of bits that need to be filled in even numbered positions
                even_cnt = psum - odd_cnt
                for curr in range(
                    min(tot_sum, target), max(0, tot_sum - target) - 1, -1
                ):
                    res = 0
                    for j in range(
                        max(0, cnt[i] - even_cnt), min(cnt[i], odd_cnt) + 1
                    ):
                        if i * j > curr:
                            break
                        # The current digit is filled with j positions at odd positions, and cnt[i] - j positions at even positions
                        ways = (
                            comb(odd_cnt, j) * comb(even_cnt, cnt[i] - j) % MOD
                        )
                        res = (
                            res + ways * f[curr - i * j][odd_cnt - j] % MOD
                        ) % MOD
                    f[curr][odd_cnt] = res % MOD

        return f[target][max_odd]


"""



class Solution:
    def countBalancedPermutations(self, num: str) -> int:

        def check(num):
            even = 0
            odd = 0
            for i, k in enumerate(num):
                if i % 2 == 0:
                    even += int(k)
                else:
                    odd += int(k)
            #print(even, odd)
            return even == odd




        s = set()

        @cache
        def test(prev , next):
            #print(prev, next)
            if next == "" :
                if check(prev):
                    #print(prev, "ancd")
                    s.add(prev)
                else:
                    return 0
            res = 0
            for i, k in enumerate(next):
                if i - 1 >= 0 and i + 1 < len(next):
                    test(prev + k, next[:i] + next[i+1:])
                if  i - 1 < 0:
                    test(prev + k,  next[i+1:])
                if i + 1 >= len(next):
                    test(prev + k, next[:i])
        
        test("", num)
        return len(s)


"""  
```