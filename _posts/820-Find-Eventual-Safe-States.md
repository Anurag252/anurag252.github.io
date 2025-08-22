---
title: "./820 Find Eventual Safe States"
date: "2025-01-24T18:42:51+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-eventual-safe-states">Find Eventual Safe States</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There is a directed graph of <code>n</code> nodes with each node labeled from <code>0</code> to <code>n - 1</code>. The graph is represented by a <strong>0-indexed</strong> 2D integer array <code>graph</code> where <code>graph[i]</code> is an integer array of nodes adjacent to node <code>i</code>, meaning there is an edge from node <code>i</code> to each node in <code>graph[i]</code>.</p>

<p>A node is a <strong>terminal node</strong> if there are no outgoing edges. A node is a <strong>safe node</strong> if every possible path starting from that node leads to a <strong>terminal node</strong> (or another safe node).</p>

<p>Return <em>an array containing all the <strong>safe nodes</strong> of the graph</em>. The answer should be sorted in <strong>ascending</strong> order.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="Illustration of graph" src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/17/picture1.png" style="height: 171px; width: 600px;" />
<pre>
<strong>Input:</strong> graph = [[1,2],[2,3],[5],[0],[5],[],[]]
<strong>Output:</strong> [2,4,5,6]
<strong>Explanation:</strong> The given graph is shown above.
Nodes 5 and 6 are terminal nodes as there are no outgoing edges from either of them.
Every path starting at nodes 2, 4, 5, and 6 all lead to either node 5 or 6.</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> graph = [[1,2,3,4],[1,2],[3,4],[0,4],[]]
<strong>Output:</strong> [4]
<strong>Explanation:</strong>
Only node 4 is a terminal node, and every path starting at node 4 leads to node 4.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == graph.length</code></li>
	<li><code>1 &lt;= n &lt;= 10<sup>4</sup></code></li>
	<li><code>0 &lt;= graph[i].length &lt;= n</code></li>
	<li><code>0 &lt;= graph[i][j] &lt;= n - 1</code></li>
	<li><code>graph[i]</code> is sorted in a strictly increasing order.</li>
	<li>The graph may contain self-loops.</li>
	<li>The number of edges in the graph will be in the range <code>[1, 4 * 10<sup>4</sup>]</code>.</li>
</ul>"
---

```go
func eventualSafeNodes(graph [][]int) []int {
    // we could do a dfs from each node and find if it is safe n2
    // terminal nodes have no outgoing edges
    // so directly pointing to terminal node from another node is needed for this work 
    // either a node directly points to terminal node or directly points to another node which points to terminal (all edges)
    // start a q - add terminal nodes
    // for each terminal node, find the nodes pointing to it 
    // for every node see that it points only to terminal node by having the entry of terminal nodes in a map
    //  so DFS with cycle detection worked 

    terminalNodes := make(map[int]bool, 0)
    unsafe := make(map[int]bool)
    safe := make(map[int]bool)
    dest := make(map[int][]int)

    for i, k := range graph {
        if len(k) == 0 {
            terminalNodes[i] = true
            safe[i] = true
        }
    }

    g := make([][]int,0)
    for i, k := range graph {
        k = append(k, i)
        g = append(g, k)
    }

    sort.Slice(g, func(i, j int) bool {
        return len(g[i]) < len(g[j])
    })
    fmt.Println(g)

    for _, k := range g {
        i := k[len(k)-1]
        _, ok := terminalNodes[i]
        if !ok{
            continue
        }
        k = k[:len(k)-1]
        for _, k1 := range k {
            _, ok := dest[k1]
            if ok {
                dest[k1] = append(dest[k1], i)
            } else {
                dest[k1] = make([]int,0)
            }
        }
    }

    for i, _ := range graph {
        _, ok := unsafe[i]

        if ok {
            continue
        }
        visited := make(map[int]bool)
        //fmt.Println("here", visited)
        dfs(i, graph, safe, visited, unsafe)

    }
    res := make([]int,0)

    for k,_ := range safe {
        res = append(res, k)
    }
    sort.Slice(res, func(i, j int) bool {
    return res[i] < res[j]
    })
    return res

}

func dfs(source int , graph [][]int, safe map[int]bool, visited map[int]bool, unsafe map[int]bool ) bool {
    //fmt.Println(source, graph, safe, visited)
    _, ok := safe[source]
    if ok {
        return true
    }

    _, ok = unsafe[source]
    if ok {
        return false
    }

    _, ok = visited[source]
    if ok {
        unsafe[source] = true
        return false
    }

    visited[source] = true

    for _, k := range graph[source] {
        if !dfs(k, graph, safe, visited, unsafe) {
            unsafe[source] = true 
            return false
        }
    }
    safe[source] = true
    delete(visited, source)
    return true
}
```