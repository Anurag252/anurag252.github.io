---
title: "./1431 All Ancestors Of A Node In A Directed Acyclic Graph"
date: "2024-06-29T15:39:23+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/all-ancestors-of-a-node-in-a-directed-acyclic-graph">All Ancestors of a Node in a Directed Acyclic Graph</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a positive integer <code>n</code> representing the number of nodes of a <strong>Directed Acyclic Graph</strong> (DAG). The nodes are numbered from <code>0</code> to <code>n - 1</code> (<strong>inclusive</strong>).</p>

<p>You are also given a 2D integer array <code>edges</code>, where <code>edges[i] = [from<sub>i</sub>, to<sub>i</sub>]</code> denotes that there is a <strong>unidirectional</strong> edge from <code>from<sub>i</sub></code> to <code>to<sub>i</sub></code> in the graph.</p>

<p>Return <em>a list</em> <code>answer</code><em>, where </em><code>answer[i]</code><em> is the <strong>list of ancestors</strong> of the</em> <code>i<sup>th</sup></code> <em>node, sorted in <strong>ascending order</strong></em>.</p>

<p>A node <code>u</code> is an <strong>ancestor</strong> of another node <code>v</code> if <code>u</code> can reach <code>v</code> via a set of edges.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2019/12/12/e1.png" style="width: 322px; height: 265px;" />
<pre>
<strong>Input:</strong> n = 8, edgeList = [[0,3],[0,4],[1,3],[2,4],[2,7],[3,5],[3,6],[3,7],[4,6]]
<strong>Output:</strong> [[],[],[],[0,1],[0,2],[0,1,3],[0,1,2,3,4],[0,1,2,3]]
<strong>Explanation:</strong>
The above diagram represents the input graph.
- Nodes 0, 1, and 2 do not have any ancestors.
- Node 3 has two ancestors 0 and 1.
- Node 4 has two ancestors 0 and 2.
- Node 5 has three ancestors 0, 1, and 3.
- Node 6 has five ancestors 0, 1, 2, 3, and 4.
- Node 7 has four ancestors 0, 1, 2, and 3.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2019/12/12/e2.png" style="width: 343px; height: 299px;" />
<pre>
<strong>Input:</strong> n = 5, edgeList = [[0,1],[0,2],[0,3],[0,4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
<strong>Output:</strong> [[],[0],[0,1],[0,1,2],[0,1,2,3]]
<strong>Explanation:</strong>
The above diagram represents the input graph.
- Node 0 does not have any ancestor.
- Node 1 has one ancestor 0.
- Node 2 has two ancestors 0 and 1.
- Node 3 has three ancestors 0, 1, and 2.
- Node 4 has four ancestors 0, 1, 2, and 3.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 1000</code></li>
	<li><code>0 &lt;= edges.length &lt;= min(2000, n * (n - 1) / 2)</code></li>
	<li><code>edges[i].length == 2</code></li>
	<li><code>0 &lt;= from<sub>i</sub>, to<sub>i</sub> &lt;= n - 1</code></li>
	<li><code>from<sub>i</sub> != to<sub>i</sub></code></li>
	<li>There are no duplicate edges.</li>
	<li>The graph is <strong>directed</strong> and <strong>acyclic</strong>.</li>
</ul>"
---

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
```