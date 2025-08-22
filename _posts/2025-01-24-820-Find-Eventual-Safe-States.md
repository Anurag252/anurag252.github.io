---
            title: "820 Find Eventual Safe States"
            date: "2025-01-24T18:42:51+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Find Eventual Safe States](https://leetcode.com/problems/find-eventual-safe-states) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There is a directed graph of n nodes with each node labeled from 0 to n - 1. The graph is represented by a **0-indexed** 2D integer array graph where graph[i] is an integer array of nodes adjacent to node i, meaning there is an edge from node i to each node in graph[i].

A node is a **terminal node** if there are no outgoing edges. A node is a **safe node** if every possible path starting from that node leads to a **terminal node** (or another safe node).

Return *an array containing all the **safe nodes** of the graph*. The answer should be sorted in **ascending** order.

 

Example 1:

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/17/picture1.png)
```

**Input:** graph = [[1,2],[2,3],[5],[0],[5],[],[]]
**Output:** [2,4,5,6]
**Explanation:** The given graph is shown above.
Nodes 5 and 6 are terminal nodes as there are no outgoing edges from either of them.
Every path starting at nodes 2, 4, 5, and 6 all lead to either node 5 or 6.
```

Example 2:

```

**Input:** graph = [[1,2,3,4],[1,2],[3,4],[0,4],[]]
**Output:** [4]
**Explanation:**
Only node 4 is a terminal node, and every path starting at node 4 leads to node 4.

```

 

**Constraints:**

	n == graph.length
	1 <= n <= 104
	0 <= graph[i].length <= n
	0 <= graph[i][j] <= n - 1
	graph[i] is sorted in a strictly increasing order.
	The graph may contain self-loops.
	The number of edges in the graph will be in the range [1, 4 * 104].

{% raw %}


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


{% endraw %}
