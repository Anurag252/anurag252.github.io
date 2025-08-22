---
            title: "684 Redundant Connection"
            date: "2025-01-29T07:35:36+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
            ---
            

            ## [Redundant Connection](https://leetcode.com/problems/redundant-connection) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

In this problem, a tree is an **undirected graph** that is connected and has no cycles.

You are given a graph that started as a tree with n nodes labeled from 1 to n, with one additional edge added. The added edge has two **different** vertices chosen from 1 to n, and was not an edge that already existed. The graph is represented as an array edges of length n where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the graph.

Return *an edge that can be removed so that the resulting graph is a tree of *n* nodes*. If there are multiple answers, return the answer that occurs last in the input.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/05/02/reduntant1-1-graph.jpg)
```

**Input:** edges = [[1,2],[1,3],[2,3]]
**Output:** [2,3]

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/05/02/reduntant1-2-graph.jpg)
```

**Input:** edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]
**Output:** [1,4]

```

 

**Constraints:**

	n == edges.length
	3 <= n <= 1000
	edges[i].length == 2
	1 <= ai < bi <= edges.length
	ai != bi
	There are no repeated edges.
	The given graph is connected.

            {% raw %}
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
            {% endraw %}
            