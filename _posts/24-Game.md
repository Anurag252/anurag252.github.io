---
title: "24 Game"
date: "2025-08-18T08:56:28+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 676 ms (11.86%) | Memory: 19.1 MB (7.90%) - LeetSync"
---

```python
class Solution:
    def judgePoint24(self, cards: List[int]) -> bool:
        """
            we start with each number and then make a tree 
            eqch branch represents + , - , * , /
        """
        def calc(arr):
            #print(arr)
            if len(arr) == 1 :
                return [arr[0]]
                
            result = []

            for i, k in enumerate(arr):
                for j , l in enumerate(arr):
                    if i == j:
                        continue
                    new_arr = []
                    
                    m = k + l

                    new_arr.append(m)
                    for s in range(0,len(arr)):
                        if s != i and s != j:
                            new_arr.append(arr[s])
                    res = calc(new_arr)
                    result.append(res)

                    new_arr[0] = k - l
                    res = calc(new_arr)
                    result.append(res)

                    if k != 0:
                        new_arr[0] =  float(l) / k
                        res = calc(new_arr)
                        result.append(res)


                    if l != 0:
                        new_arr[0] = float(k) / l
                        res = calc(new_arr)
                        result.append(res)


                    new_arr[0] = - k + l
                    res = calc(new_arr)
                    result.append(res)


                    new_arr[0] = k * l
                    res = calc(new_arr)
                    result.append(res)

            return [x for xs in result for x in xs]
        
        EPS = 1e-6
        return any(abs(x - 24) < EPS for x in calc(cards))



```