---
title: "Path With Maximum Probability"
date: "2024-08-31T22:28:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 572 ms (29.67%) | Memory: 30 MB (5.29%) - LeetSync"
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