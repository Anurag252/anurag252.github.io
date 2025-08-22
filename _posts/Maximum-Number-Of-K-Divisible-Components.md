---
title: "Maximum Number Of K Divisible Components"
date: "2024-12-21T11:02:34+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 246 ms (7.32%) | Memory: 43.2 MB (8.54%) - LeetSync"
---

```python
class Tree:
    def __init__(self, root):
        self.root = root

class Node:
    def __init__(self,val, left= None, right=None):
        self.val = val
        self.left= left
        self.right= right
        self.sum = 0



class Solution:
    def maxKDivisibleComponents(self, n: int, edges: List[List[int]], values: List[int], k: int) -> int:
        # find the leaf node equale to k
        # then find the lvl 1 tree sum equale to k
        # find all trees lvl 2

        new_edges = {i: [] for i in range(n)}
        for m in edges:
            if m[0] not in new_edges:
                new_edges[m[0]] = []
            new_edges[m[0]].append(m[1])

            if m[1] not in new_edges:
                new_edges[m[1]] = []
            new_edges[m[1]].append(m[0])
        print(new_edges)

        count = {}
        def traverse(m, s):

            s.add(m)
            if m not in new_edges:
               
                if (values[m] % k) == 0:
                    count["sum"] += 1
                    return 0
                return values[m]
            fin = 0
            for n in new_edges[m]:
                if n not in s :
                    c = traverse(n, s)
                    if (c)  % k == 0:
                        count["sum"] += 1
                        c = 0
                    fin += c
            return fin + values[m]

                    


        ans = 0
        count["sum"] = 0
        s= set()
        if traverse(0, s) % k == 0:
            count["sum"] += 1
        return count["sum"]
        


```