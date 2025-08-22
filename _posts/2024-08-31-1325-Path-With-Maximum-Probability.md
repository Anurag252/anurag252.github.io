---
            title: "1325 Path With Maximum Probability"
            date: "2024-08-31T22:28:23+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Path with Maximum Probability](https://leetcode.com/problems/path-with-maximum-probability) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an undirected weighted graph of n nodes (0-indexed), represented by an edge list where edges[i] = [a, b] is an undirected edge connecting the nodes a and b with a probability of success of traversing that edge succProb[i].

Given two nodes start and end, find the path with the maximum probability of success to go from start to end and return its success probability.

If there is no path from start to end, **return 0**. Your answer will be accepted if it differs from the correct answer by at most **1e-5**.

 

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

 

**Constraints:**

	2 <= n <= 10^4
	0 <= start, end < n
	start != end
	0 <= a, b < n
	a != b
	0 <= succProb.length == edges.length <= 2*10^4
	0 <= succProb[i] <= 1
	There is at most one edge between every two nodes.

{% raw %}


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




{% endraw %}
