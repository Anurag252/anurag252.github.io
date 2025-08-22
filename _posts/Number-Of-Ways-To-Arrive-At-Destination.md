---
title: "Number Of Ways To Arrive At Destination"
date: "2025-03-23T17:06:12+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 15 ms (90.31%) | Memory: 25 MB (68.75%) - LeetSync"
---

```python
import heapq
from collections import defaultdict

class Solution:
    def countPaths(self, n: int, roads: List[List[int]]) -> int:
        MOD = 10**9 + 7
        graph = defaultdict(list)

        for u, v, time in roads:
            graph[u].append((v, time))
            graph[v].append((u, time))

        dist = [float('inf')] * n
        ways = [0] * n

        dist[0] = 0
        ways[0] = 1
        heap = [(0, 0)]  # (time, node)

        while heap:
            curr_time, node = heapq.heappop(heap)
            if curr_time > dist[node]:
                continue
            for nei, t in graph[node]:
                new_time = curr_time + t
                if new_time < dist[nei]:
                    dist[nei] = new_time
                    ways[nei] = ways[node]
                    heapq.heappush(heap, (new_time, nei))
                elif new_time == dist[nei]:
                    ways[nei] = (ways[nei] + ways[node]) % MOD

        return ways[n - 1]

```