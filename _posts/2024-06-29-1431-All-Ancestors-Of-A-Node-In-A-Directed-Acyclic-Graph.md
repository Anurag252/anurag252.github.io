---
            title: "1431 All Ancestors Of A Node In A Directed Acyclic Graph"
            date: "2024-06-29T15:39:23+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [All Ancestors of a Node in a Directed Acyclic Graph](https://leetcode.com/problems/all-ancestors-of-a-node-in-a-directed-acyclic-graph) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a positive integer n representing the number of nodes of a **Directed Acyclic Graph** (DAG). The nodes are numbered from 0 to n - 1 (**inclusive**).

You are also given a 2D integer array edges, where edges[i] = [fromi, toi] denotes that there is a **unidirectional** edge from fromi to toi in the graph.

Return *a list* answer*, where *answer[i]* is the **list of ancestors** of the* ith *node, sorted in **ascending order***.

A node u is an **ancestor** of another node v if u can reach v via a set of edges.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2019/12/12/e1.png)
```

**Input:** n = 8, edgeList = [[0,3],[0,4],[1,3],[2,4],[2,7],[3,5],[3,6],[3,7],[4,6]]
**Output:** [[],[],[],[0,1],[0,2],[0,1,3],[0,1,2,3,4],[0,1,2,3]]
**Explanation:**
The above diagram represents the input graph.
- Nodes 0, 1, and 2 do not have any ancestors.
- Node 3 has two ancestors 0 and 1.
- Node 4 has two ancestors 0 and 2.
- Node 5 has three ancestors 0, 1, and 3.
- Node 6 has five ancestors 0, 1, 2, 3, and 4.
- Node 7 has four ancestors 0, 1, 2, and 3.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2019/12/12/e2.png)
```

**Input:** n = 5, edgeList = [[0,1],[0,2],[0,3],[0,4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
**Output:** [[],[0],[0,1],[0,1,2],[0,1,2,3]]
**Explanation:**
The above diagram represents the input graph.
- Node 0 does not have any ancestor.
- Node 1 has one ancestor 0.
- Node 2 has two ancestors 0 and 1.
- Node 3 has three ancestors 0, 1, and 2.
- Node 4 has four ancestors 0, 1, 2, and 3.

```

 

**Constraints:**

	1 <= n <= 1000
	0 <= edges.length <= min(2000, n * (n - 1) / 2)
	edges[i].length == 2
	0 <= fromi, toi <= n - 1
	fromi != toi
	There are no duplicate edges.
	The graph is **directed** and **acyclic**.

{% raw %}


```python


class Solution:
    def getAncestors(self, n: int, edges: List[List[int]]) -> List[List[int]]:
        graph = [[] for _ in range(n)]
        inDeg = [0] * n
        
        for e in edges:
            graph[e[0]].append(e[1])
            inDeg[e[1]] += 1
        
        q = deque()
        for i in range(n):
            if inDeg[i] == 0:
                q.append(i)
        
        ancestors = [set() for _ in range(n)]
        
        while q:
            u = q.popleft()
            for v in graph[u]:
                inDeg[v] -= 1
                ancestors[v].add(u)
                ancestors[v].update(ancestors[u])
                if inDeg[v] == 0:
                    q.append(v)
        
        ans = [[] for _ in range(n)]
        for i in range(n):
            ans[i] = sorted(list(ancestors[i]))
        
        return ans


{% endraw %}
```
