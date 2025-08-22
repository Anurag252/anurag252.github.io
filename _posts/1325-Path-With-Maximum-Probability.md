---
title: "1325 Path With Maximum Probability"
date: "2024-08-31T22:28:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Path with Maximum Probability](https://leetcode.com/problems/path-with-maximum-probability) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given an undirected weighted graph of&nbsp;n&nbsp;nodes (0-indexed), represented by an edge list where&nbsp;edges[i] = [a, b]&nbsp;is an undirected edge connecting the nodes&nbsp;a&nbsp;and&nbsp;b&nbsp;with a probability of success of traversing that edge&nbsp;succProb[i].
  
  Given two nodes&nbsp;start&nbsp;and&nbsp;end, find the path with the maximum probability of success to go from&nbsp;start&nbsp;to&nbsp;end&nbsp;and return its success probability.
  
  If there is no path from&nbsp;start&nbsp;to&nbsp;end, **return&nbsp;0**. Your answer will be accepted if it differs from the correct answer by at most **1e-5**.
  
  &nbsp;
  
  Example 1:
  
  **![image](https://assets.leetcode.com/uploads/2019/09/20/1558_ex1.png)**
  
  ```
  
  **Input:** n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
  **Output:** 0.25000
  **Explanation:** There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.
  
  ```
  
  Example 2:
  
  **![image](https://assets.leetcode.com/uploads/2019/09/20/1558_ex2.png)**
  
  ```
  
  **Input:** n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
  **Output:** 0.30000
  
  ```
  
  Example 3:
  
  **![image](https://assets.leetcode.com/uploads/2019/09/20/1558_ex3.png)**
  
  ```
  
  **Input:** n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
  **Output:** 0.00000
  **Explanation:** There is no path between 0 and 2.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	2 &lt;= n &lt;= 10^4
  	0 &lt;= start, end &lt; n
  	start != end
  	0 &lt;= a, b &lt; n
  	a != b
  	0 &lt;= succProb.length == edges.length &lt;= 2*10^4
  	0 &lt;= succProb[i] &lt;= 1
  	There is at most one edge between every two nodes.
---

```python
class Solution:
    def maxProbability(self, n: int, edges: List[List[int]], succProb: List[float], start_node: int, end_node: int) -> float:
        matrix = {}
        result = {}
        
        # Build the adjacency list
        for k, l in zip(edges, succProb):
            if k[0] not in matrix:
                matrix[k[0]] = [(k[1], l)]
            else:
                matrix[k[0]].append((k[1], l))
                
            if k[1] not in matrix:
                matrix[k[1]] = [(k[0], l)]
            else:
                matrix[k[1]].append((k[0], l))
        
        visited = set()
        global q  # Declare q as a global variable
        q = [(-1, start_node)]  # Initialize max-heap with negative probabilities
        result[start_node] = 1  # Probability of start_node is 1
        
        def test():
            global q  # Declare q as global inside the function to use the global variable
            while len(q) > 0:
                t = heapq.heappop(q)
                
                # Convert back the probability to positive
                current_prob = -t[0]
                current_node = t[1]
                
                # If we've reached the end node, return the probability
                if current_node == end_node:
                    return current_prob
                
                if current_node in visited:
                    continue
                
                visited.add(current_node)
                
                if current_node not in matrix:
                    continue
                
                for k in matrix[current_node]:
                    new_prob = current_prob * k[1]
                    if new_prob > result.get(k[0], 0):
                        result[k[0]] = new_prob
                        heapq.heappush(q, (-new_prob, k[0]))  # Push with negative probability to maintain max-heap
            
            return 0  # Return 0 if end_node is not reachable
        
        # Call the helper function and return its result
        return test()   


```