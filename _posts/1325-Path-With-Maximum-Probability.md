---
title: "./1325 Path With Maximum Probability"
date: "2024-08-31T22:28:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/path-with-maximum-probability">Path with Maximum Probability</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an undirected weighted graph of&nbsp;<code>n</code>&nbsp;nodes (0-indexed), represented by an edge list where&nbsp;<code>edges[i] = [a, b]</code>&nbsp;is an undirected edge connecting the nodes&nbsp;<code>a</code>&nbsp;and&nbsp;<code>b</code>&nbsp;with a probability of success of traversing that edge&nbsp;<code>succProb[i]</code>.</p>

<p>Given two nodes&nbsp;<code>start</code>&nbsp;and&nbsp;<code>end</code>, find the path with the maximum probability of success to go from&nbsp;<code>start</code>&nbsp;to&nbsp;<code>end</code>&nbsp;and return its success probability.</p>

<p>If there is no path from&nbsp;<code>start</code>&nbsp;to&nbsp;<code>end</code>, <strong>return&nbsp;0</strong>. Your answer will be accepted if it differs from the correct answer by at most <strong>1e-5</strong>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2019/09/20/1558_ex1.png" style="width: 187px; height: 186px;" /></strong></p>

<pre>
<strong>Input:</strong> n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
<strong>Output:</strong> 0.25000
<strong>Explanation:</strong>&nbsp;There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.
</pre>

<p><strong class="example">Example 2:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2019/09/20/1558_ex2.png" style="width: 189px; height: 186px;" /></strong></p>

<pre>
<strong>Input:</strong> n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
<strong>Output:</strong> 0.30000
</pre>

<p><strong class="example">Example 3:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2019/09/20/1558_ex3.png" style="width: 215px; height: 191px;" /></strong></p>

<pre>
<strong>Input:</strong> n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
<strong>Output:</strong> 0.00000
<strong>Explanation:</strong>&nbsp;There is no path between 0 and 2.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= n &lt;= 10^4</code></li>
	<li><code>0 &lt;= start, end &lt; n</code></li>
	<li><code>start != end</code></li>
	<li><code>0 &lt;= a, b &lt; n</code></li>
	<li><code>a != b</code></li>
	<li><code>0 &lt;= succProb.length == edges.length &lt;= 2*10^4</code></li>
	<li><code>0 &lt;= succProb[i] &lt;= 1</code></li>
	<li>There is at most one edge between every two nodes.</li>
</ul>"
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