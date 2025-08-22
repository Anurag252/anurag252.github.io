---
title: "3058 Maximum Number Of K Divisible Components"
date: "2024-12-21T11:02:34+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Number of K-Divisible Components](https://leetcode.com/problems/maximum-number-of-k-divisible-components) ![image](https://img.shields.io/badge/Difficulty-Hard-red)
  
  There is an undirected tree with n nodes labeled from 0 to n - 1. You are given the integer n and a 2D integer array edges of length n - 1, where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the tree.
  
  You are also given a **0-indexed** integer array values of length n, where values[i] is the **value** associated with the ith node, and an integer k.
  
  A **valid split** of the tree is obtained by removing any set of edges, possibly empty, from the tree such that the resulting components all have values that are divisible by k, where the **value of a connected component** is the sum of the values of its nodes.
  
  Return *the **maximum number of components** in any valid split*.
  
   
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2023/08/07/example12-cropped2svg.jpg)
  ```
  
  **Input:** n = 5, edges = [[0,2],[1,2],[1,3],[2,4]], values = [1,8,1,4,4], k = 6
  **Output:** 2
  **Explanation:** We remove the edge connecting node 1 with 2. The resulting split is valid because:
  - The value of the component containing nodes 1 and 3 is values[1] + values[3] = 12.
  - The value of the component containing nodes 0, 2, and 4 is values[0] + values[2] + values[4] = 6.
  It can be shown that no other valid split has more than 2 connected components.
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2023/08/07/example21svg-1.jpg)
  ```
  
  **Input:** n = 7, edges = [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6]], values = [3,0,6,1,5,2,1], k = 3
  **Output:** 3
  **Explanation:** We remove the edge connecting node 0 with 2, and the edge connecting node 0 with 1. The resulting split is valid because:
  - The value of the component containing node 0 is values[0] = 3.
  - The value of the component containing nodes 2, 5, and 6 is values[2] + values[5] + values[6] = 9.
  - The value of the component containing nodes 1, 3, and 4 is values[1] + values[3] + values[4] = 6.
  It can be shown that no other valid split has more than 3 connected components.
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= n <= 3 * 104
  	edges.length == n - 1
  	edges[i].length == 2
  	0 <= ai, bi < n
  	values.length == n
  	0 <= values[i] <= 109
  	1 <= k <= 109
  	Sum of values is divisible by k.
  	The input is generated such that edges represents a valid tree.
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