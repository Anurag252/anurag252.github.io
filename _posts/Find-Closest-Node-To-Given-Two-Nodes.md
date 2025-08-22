---
title: "Find Closest Node To Given Two Nodes"
date: "2025-05-30T23:07:22+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 125 ms (85.20%) | Memory: 37.9 MB (75.79%) - LeetSync"
---

```python
from typing import List

class Solution:
    def closestMeetingNode(self, edges: List[int], node1: int, node2: int) -> int:
        def get_distances(start: int) -> List[int]:
            n = len(edges)
            dist = [-1] * n
            visited = set()
            curr = start
            d = 0
            while curr != -1 and curr not in visited:
                dist[curr] = d
                visited.add(curr)
                curr = edges[curr]
                d += 1
            return dist

        dist1 = get_distances(node1)
        dist2 = get_distances(node2)

        min_dist = float('inf')
        result = -1

        for i in range(len(edges)):
            if dist1[i] != -1 and dist2[i] != -1:
                max_dist = max(dist1[i], dist2[i])
                if max_dist < min_dist:
                    min_dist = max_dist
                    result = i
        return result

```