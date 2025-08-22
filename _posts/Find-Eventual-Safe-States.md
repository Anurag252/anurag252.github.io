---
title: "Find Eventual Safe States"
date: "2025-01-24T18:42:51+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 112 ms (5.09%) | Memory: 10.1 MB (11.86%) - LeetSync"
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