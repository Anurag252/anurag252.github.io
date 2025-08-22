---
title: "Course Schedule Iv"
date: "2025-01-27T20:21:44+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 656 ms (18.20%) | Memory: 20.4 MB (61.44%) - LeetSync"
---

```python
class Solution:
    # Performs DFS and returns true if there's a path between src and target and false otherwise.
    def isPrerequisite(
        self, adjList: dict, visited: List[bool], src: int, target: int
    ) -> bool:
        visited[src] = True

        if src == target:
            return True

        for adj in adjList.get(src, []):
            if not visited[adj]:
                if self.isPrerequisite(adjList, visited, adj, target):
                    return True
        return False

    def checkIfPrerequisite(
        self,
        numCourses: int,
        prerequisites: List[List[int]],
        queries: List[List[int]],
    ) -> List[bool]:
        adjList = {i: [] for i in range(numCourses)}

        for edge in prerequisites:
            adjList[edge[0]].append(edge[1])

        result = []

        for query in queries:
            # Reset the visited array for each query
            visited = [False] * numCourses
            result.append(
                self.isPrerequisite(adjList, visited, query[0], query[1])
            )

        return result
```