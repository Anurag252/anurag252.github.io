---
title: "Defuse The Bomb"
date: "2024-11-18T09:15:30+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 7 ms (38.94%) | Memory: 17.1 MB (5.59%) - LeetSync"
---

```python
class Solution:
    def decrypt(self, code: List[int], k: int) -> List[int]:
        q = []
        res = []
        if k > 0:
            m = 1
            while (len(q) < k):
                q.append(code[m])
                m += 1
                if m >= len(code):
                    m = 0
            print(q)
            for idx, l in enumerate(code):
                print(q)
                res.append(sum(q))
                q.pop(0)
                q.append(code[(idx + k + 1) % len(code)])
            return res
        if k == 0:
            return [0] * len(code)


        if k < 0:
            m = len(code) - 1
            while (len(q) < -k):
                q.append(code[m])
                m -= 1
                if m < 0:
                    m = len(code) - 1
            print(q.reverse())
            for idx, l in enumerate(code):
                print(q)
                res.append(sum(q))
                q.pop(0)
                q.append(code[idx])
            return res






```