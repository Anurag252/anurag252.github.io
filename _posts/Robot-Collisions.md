---
title: "Robot Collisions"
date: "2024-07-13T06:47:14+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1087 ms (21.16%) | Memory: 49.2 MB (17.31%) - LeetSync"
---

```python
class Solution:
    def survivedRobotsHealths(self, positions: List[int], healths: List[int], directions: str) -> List[int]:
        stack = []
        arr = []
        for k,l,m in zip(positions, healths, directions):
            arr.append((k,l,m))
        
        arr.sort(reverse=False, key=lambda x : x[0])
        
        for k in arr:
            stack.append(k)
            while len(stack) > 1 and (stack[-1][2] == 'L' and stack[-2][2] == 'R'):
                a = stack.pop()
                b = stack.pop()
                if a[1] > b[1]:
                    stack.append((a[0], a[1]-1, a[2]))
                elif a[1] < b[1]:
                    stack.append((b[0], b[1]-1, b[2]))

        result = [None] * len(stack)
        dic = {}
        for k in stack:
            dic[k[0]] = (k[1], k[2])
        
        i = 0
        for k in positions:
            if k in dic:
                result[i] = dic[k][0]
                i  = i + 1
        return result

            


        
```