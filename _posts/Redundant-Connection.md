---
title: "Redundant Connection"
date: "2025-01-29T07:35:36+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 17 ms (5.07%) | Memory: 9.1 MB (5.07%) - LeetSync"
---

```go
func dfs(source int, adj map[int][]int , visited map[int]bool, parent int) bool {
    //fmt.Println(visited, source, adj)
    _, ok := visited[source]
    
    if ok  {
        
        return false
    }
    visited[source] = true
    
    for _, k := range adj[source] {
        if parent != k && ! dfs (k, adj, visited, source)  {
            return false
        }
    }
    return true
}

func findRedundantConnection(edges [][]int) []int {
    
    adj := make(map[int][]int)

    for _, k := range edges {
        _, ok := adj[k[0]]
        if ! ok {
            adj[k[0]] = make([]int, 0)
            adj[k[0]] = append(adj[k[0]], k[1])
        } else {
            adj[k[0]] = append(adj[k[0]], k[1])
        }


        _, ok = adj[k[1]]
        if ! ok {
            adj[k[1]] = make([]int, 0)
            adj[k[1]] = append(adj[k[1]], k[0])
        } else {
            adj[k[1]] = append(adj[k[1]], k[0])
        }

        visited := make(map[int]bool)
        //fmt.Println("andy")
        if ! dfs(k[0], adj, visited, -1) {
            return k
        }
    }

    return nil
}
```