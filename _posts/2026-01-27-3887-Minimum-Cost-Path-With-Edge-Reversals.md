---
            title: "3887 Minimum Cost Path With Edge Reversals"
            date: "2026-01-27T22:00:02+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Minimum Cost Path with Edge Reversals](https://leetcode.com/problems/minimum-cost-path-with-edge-reversals) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a directed, weighted graph with n nodes labeled from 0 to n - 1, and an array edges where edges[i] = [ui, vi, wi] represents a directed edge from node ui to node vi with cost wi.

Each node ui has a switch that can be used **at most once**: when you arrive at ui and have not yet used its switch, you may activate it on one of its incoming edges vi → ui reverse that edge to ui → vi and **immediately** traverse it.

The reversal is only valid for that single move, and using a reversed edge costs 2 * wi.

Return the **minimum** total cost to travel from node 0 to node n - 1. If it is not possible, return -1.

 

Example 1:

**Input:** n = 4, edges = [[0,1,3],[3,1,1],[2,3,4],[0,2,2]]

**Output:** 5

**Explanation: **

**![image](https://assets.leetcode.com/uploads/2025/05/07/e1drawio.png)**

	Use the path 0 → 1 (cost 3).
	At node 1 reverse the original edge 3 → 1 into 1 → 3 and traverse it at cost 2 * 1 = 2.
	Total cost is 3 + 2 = 5.

Example 2:

**Input:** n = 4, edges = [[0,2,1],[2,1,1],[1,3,1],[2,3,3]]

**Output:** 3

**Explanation:**

	No reversal is needed. Take the path 0 → 2 (cost 1), then 2 → 1 (cost 1), then 1 → 3 (cost 1).
	Total cost is 1 + 1 + 1 = 3.

 

**Constraints:**

	2 <= n <= 5 * 104
	1 <= edges.length <= 105
	edges[i] = [ui, vi, wi]
	0 <= ui, vi <= n - 1
	1 <= wi <= 1000

{% raw %}


```rust


use std::collections::BinaryHeap;

impl Solution {
    pub fn min_cost(n: i32, edges: Vec<Vec<i32>>) -> i32 {
        let n = n as usize;
        let mut g = vec![vec![]; n];
        for e in edges {
            let (x, y, w) = (e[0] as usize, e[1] as usize, e[2]);
            g[x].push((y as i32, w));
            g[y].push((x as i32, 2 * w));
        }
        
        let mut dist = vec![i32::MAX; n];
        let mut visited = vec![false; n];
        let mut heap = BinaryHeap::new();  // max heap, but storing negative values
        
        dist[0] = 0;
        heap.push((0, 0));  // (-Distance, Node)
        
        while let Some((neg_d, node)) = heap.pop() {
            let d = -neg_d;
            let node = node as usize;
            
            if node == n - 1 {
                return d;
            }
            
            if visited[node] {
                continue;
            }
            visited[node] = true;
            
            for &(next, weight) in &g[node] {
                let next_idx = next as usize;
                let new_dist = d + weight;
                if new_dist < dist[next_idx] {
                    dist[next_idx] = new_dist;
                    heap.push((-new_dist, next));
                }
            }
        }
        
        -1
    }
}


{% endraw %}
```
